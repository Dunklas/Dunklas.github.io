---
title: "Learnings from debugging a misconfigured service worker"
tags: ["service workers", "debugging"]
date: 2023-01-11T00:00:00Z
draft: false
---

Recently I worked on a task related to a misconfigured service worker in a [SPA (single page application)](LÄNK).
The issue was that cache invalidation of application configuration didn't work as expected.
If a configuration value was updated, the clients kept using an old value, served by a cached version of the configuration file.
When I started to work on this task, I had no prior experience of working with service works.
Therefore, I hope to cement my newly gained knowledge by summarizing my debugging journey and some learnings in this post.

First of, what is a service worker?
Basically, it's a background job running in the context of a web application.
It acts as a proxy between the web application and a remote web server.
It's commonly used in [PWA's (progressive web apps)](LÄNK) to provide offline availability, but also for improved performance in general.
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
The applications build output was _precached_ and then delivered to the web application in a _cache-first_ manner.
This means that the build output will be cached in clients during installation of the service worker, and that files always will be delivered from the cache, unless a certain file for some reason is missing in the cache.
The build output included html, js bundles, css, images, etc, but also the configuration files which we experienced cache invalidation issues with.

The next question that came to my mind was - How are the precached files updated?
Turns out it relies on content-based hashes.
The majority of the files in our build output contains a hash in the filename.
For the files that does not contain a hash, Workbox generates a _revision_ (content-based hash).
All of the filenames and revisions are present in the service worker javascript-file.
If a browser detect a byte-difference in the service worker code, it will attempt to install the new version (and then update its cache with the new content).

Now, how come our configuration files aren't updated? :think:

Learnings:
 - Always have an understanding of your applications environment (hosting, CI/CD, configuration)
 - Don't let bugs rot in your backlog! Your environment changes over time, this might make it harder to reproduce and debug