---
title: "Introducing tower-oauth2-resource-server"
tags: ["rust", "tower", "oauth", "jwt", "authorization"]
date: 2025-02-14T00:00:00Z
draft: true
---

**TLDR:** I've built a middleware for handling JWT authorization.
It's written for the Rust ecosystem and supports many popular web frameworks such as [axum](https://crates.io/crates/axum), [salvo](https://crates.io/crates/salvo/) and [tonic](https://crates.io/crates/tonic).
It's called **tower-oauth2-resource-server** and you can find the source code on [github](https://github.com/Dunklas/tower-oauth2-resource-server).
Feel free to use and contribute!

---

The last few months I have delved into the art of writing a REST API using rust.
Specifically, I've used the [axum](https://crates.io/crates/axum) crate to do so.
At a point it was time to add authorization.
My scenario was simple.
To use auth0 as an identity provider and ensure that each request provides a valid JSON Web Token (JWT) issued by a specific auth0 client.

At the time, I was working extensively with Java and Spring in my daily job.
In that ecosystem, I used spring-security-oauth2-resource-server for a similar use case.
That library makes things easy — you simply specify an issuer URL, and it takes care of discovering JSON Web Key Sets (JWKS), handling key rotation, and validating JWTs.
However, in Rust, I couldn't find an equivalent library that provided the same level of simplicity.
So, I decided to build one myself.

The objective was to write a middleware that intercept incoming requests, validate its JWT and either allow or reject the request based on the JWTs validity.
In the Rust ecosystem there is a crate called [tower](https://crates.io/crates/tower) which provides an abstraction for the concept of taking a request and returning a response.
It can be used for implementing middleware in both clients and servers, regardless of protocol.
Many web frameworks (including axum) uses tower instead of implementing its own middleware system.
With that in mind, I decided to write my middleware for tower — That way it can be used in a bunch of different web frameworks.

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