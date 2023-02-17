---
title: "Learnings from debugging a misconfigured service worker"
tags: ["service workers", "debugging"]
date: 2023-02-17T00:00:00Z
draft: false
---

Recently I worked on a task related to a misconfigured service worker in a [SPA (single page application)](https://developer.mozilla.org/en-US/docs/Glossary/SPA).
The issue was that cache invalidation of application configuration didn't work as expected.
If a configuration value was updated, the clients kept using an old value, served by a cached version of the configuration file.
When I started to work on this task, I had no prior experience of service workers.
Therefore, I hope to cement my newly gained knowledge by summarizing my debugging journey and some learnings in this post.

First of, what is a service worker?
Basically, it's a background job running in the context of a web application.
It acts as a proxy between the web application and a remote web server.
It's commonly used in [PWA's (progressive web apps)](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps) to provide offline availability, but also for improved performance in general.
The service worker itself is just a simple javascript file (commonly named `sw.js`, or `service-worker.js`).
Service workers often use the browsers [Cache API](https://developer.mozilla.org/en-US/docs/Web/API/Cache) to cache HTTP responses.
Either you write the code for your service worker manually, or you can have a tool such as webpack generate one for you.

My first troubleshooting step was to attempt to re-create the behavior while running the application locally.
If a web page uses a service worker, you can see some information about it by navigating to _Application_ > _Service Workers_ in the developer console.
Suprisingly, it looked like there was no service worker installed.
I continued to check both our test- and production-environments - I didn't have any installed service worker there either.
Weird.
After a journey down our git history, I noticed that a bunch of service worker-related webpack configuration had been removed during an update of webpack.
The absence of this configuration resulted in that the service worker no longer gets installed.

Great! We no longer attempt to install the misconfigured service worker, then we should be fine, right?
Not really, just because we no longer actively install the service worker, it doesn't mean that the misconfigured service worker has been _uninstalled_.
It may still live and provide cached content to clients out there.

I started to dig deeper into our service worker code in order to find out how it cached content.
Turns out we used [Workbox](https://developer.chrome.com/docs/workbox/service-worker-overview/), an abstraction by Googe to make it easier to work with service workers.
Specifically, we used a [webpack plugin](https://developer.chrome.com/docs/workbox/modules/workbox-webpack-plugin/) that generates service worker code using Workbox at build-time.
In the generated code, the applications build output was _precached_ and then delivered to the web application in a _cache-first_ manner.
This means that the build output will be cached in a user's browser during installation of the service worker, and that files always will be delivered from the cache, unless a certain file for some reason is missing in the cache.
The build output includes html, js bundles, css, images, etc, as well as the configuration files which we experienced cache invalidation issues with.

The next question that came to my mind was - How are the precached files updated?
Turns out it relies on content-based hashes.
The majority of the files in our build output contains a hash in the filename.
For the files that does not contain a hash, Workbox generates a _revision_ (content-based hash).
All of the filenames and revisions are present in the service worker javascript-file.
If a browser detect a byte-difference in the service worker code, it will attempt to install the new version (and then update its cache with the new content).

In light of that the configuration files are precached, and that it depends on content-based hashes, I continued to ponder the cache invalidation issue.
We have several different configuration files, e.g. `config-test.json`, `config-prod.json`.
All of these files are included in the build output, but only one of them is relevant for a specific environment.
How does the process of getting configuration values into runtime work?

After some digging, I learned that our SPA makes a request to `/config.json` in order to read configuration values.
The CI/CD pipeline makes sure that correct configuration file is present in `/config.json`.
In our specific case, the SPA is hosted in AWS S3, and the CI/CD pipelines runs something like `aws s3 cp build-output/config-<current-environment>.json s3://s3-web-bucket/config.json`.
How does this affect the precaching?
To learn about this, I ran a production build locally and emulated the behavior of our CI/CD pipeline by manually deleting and renaming configuration files.
Now, I was finally able to reproduce the cache invalidation issue locally on my own machine.
Success!

With the improved feedback cycle from being able to reproduce the issue locally, I relatively quickly concluded what the root cause of our cache invalidation issue was.
Amongst the environment-specific configuration files, we also had a file simply called `config.json` which was used while running the application locally.
All of the configuration files (including `config.json`) was precached in the service worker code.
However, due to the behavior of our CI/CD pipeline, renaming `config-<current-environment>.json` to `config.json`, the content hashes no longer matched.
When we made a change to `config-prod.json`, we expected our web application to deliver a new version of `/config.json`.
However, since no change had been made to `config.json` (the configuration file used while running the application locally), the content hash for that file remained the same, and the browser happily delivered the old version of the file.

To resolve the problem, I excluded the configuration files from precaching, as well as adding code to actually install the service worker.

# Final thoughts

Service workers is a great tool for enhancing your web page with offline capabilities.
In our specific web app I think it's a tad overkill because it doesn't really makes sense to use it offline.
In addition, I don't really see any performance gains compared to the HTTP caching provided by our content delivery network (CDN).

Always strive to maintain a basic understanding of your applications environment, such as its hosting and the CI/CD pipeline.
This knowledge will make it easier to troubleshoot obscure issues, when the need arise.

Don't let bugs rot in your backlog. If they're important, give them attention as soon as possible.
If you leave them for too long, they might multiply, or like in this case - the context changes and they're harder to reproduce.
