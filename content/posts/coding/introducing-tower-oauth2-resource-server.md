---
title: "Introducing tower-oauth2-resource-server"
tags: ["rust", "tower", "oauth", "jwt", "authorization"]
date: 2025-02-14T00:00:00Z
draft: true
---

**TLDR:** I've built a middleware for handling JWT authorization.
It's written for the rust ecosystem and supports many popular web frameworks such as [axum](https://crates.io/crates/axum), [salvo](https://crates.io/crates/salvo/) and [tonic](https://crates.io/crates/tonic).
It's called **tower-oauth2-resource-server** and you can find the source code on [github](https://github.com/Dunklas/tower-oauth2-resource-server).
Feel free to use and contribute!

---

The last few months I have delved into the art of writing a REST API using rust.
Specifically, I've used the [axum](https://crates.io/crates/axum) crate to do so.
At a point, it was time to add authorization.
My use-case was simple.
To use auth0 as an identity provider, and ensure that each request provides a valid JWT issued by a specific auth0 client.

At the time, I was working extensively with Java and Spring in my daily job.
In that ecosystem, I used spring-security-oauth2-resource-server for a similar use case.
That library makes things easy — you simply specify an issuer URL, and it takes care of discovering JWKS, handling key rotation, and validating JWTs.
However, in Rust, I couldn't find an equivalent library that provided the same level of simplicity.
So, I decided to build one myself.

To achieve this, I needed some kind of middleware that could intercept incoming requests, validate the JWT, and either allow or reject the request based on its validity.
Middleware is a common pattern for handling cross-cutting concerns like authentication, logging, and request transformations in web frameworks.
In Rust, many web frameworks — including Axum—are built on top of the Tower library, which provides a powerful and flexible abstraction for middleware.

Tower is a modular and composable library for building network services in Rust.
It provides a Service trait that represents an asynchronous request-response pipeline.
Middleware in Tower is simply a layer that wraps around a service, modifying either the request, response, or both.
Because Axum is built on Tower, we can leverage this middleware system to integrate authentication seamlessly.

With this in mind, I built a library specifically for Tower-based frameworks that performs JWT validation against an OIDC provider.
The goal was to replicate the developer experience of spring-security-oauth2-resource-server, allowing users to configure an issuer URL and have the library handle the rest—discovering the JWKS, caching keys, handling key rotation, and verifying JWTs.

Since Tower is widely used beyond Axum, this approach makes the library compatible with multiple frameworks, ensuring flexibility and reusability across different Rust web applications.

# Example usage
```rust
let auth = <OAuth2ResourceServer>::builder()
        .audiences(&["https://my-resource-server.com"])
        .issuer_url("https://some-identity-provider.com")
        .build()
        .await
        .unwrap();

    let app = Router::new()
        .route("/", get(root))
        .layer(ServiceBuilder::new().layer(auth.into_layer()));

    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();
    axum::serve(listener, app)
        .await
        .unwrap()
```

#  Link, and "call to usage / contribution"
You can find the repo here: https://github.com/Dunklas/tower-oauth2-resource-server