---
title: "Introducing tower-oauth2-resource-server"
tags: ["rust", "tower", "OAuth", "jwt", "authorization"]
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
To ensure that each request provides a valid JSON Web Token (JWT) issued by an external identity provider.

At the time, I was working extensively with Java and Spring in my daily job.
In that ecosystem, I used [Spring Security OAuth2 Resource Server](https://docs.spring.io/spring-security/reference/servlet/oauth2/resource-server) for a similar use case.
That library makes things easy — you simply specify an issuer URL, and it takes care of discovering JSON Web Key Sets (JWKS), handling key rotation, and validating JWTs.
However, in Rust, I couldn't find an equivalent library that provided the same level of simplicity.
So, I decided to build one myself.

My objective was to write a middleware that intercept incoming requests, validate its JWT and either allow or reject the request based on the JWTs validity.
In the Rust ecosystem there is a crate called [tower](https://crates.io/crates/tower) which provides an abstraction for the concept of taking a request and returning a response.
It can be used for implementing middleware in both clients and servers, regardless of networking protocol.
Many web frameworks (including axum) uses tower instead of implementing its own middleware system.
With that in mind, I decided to write my middleware for tower — That way it can be used in a bunch of different web frameworks.

So, I hereby introduce **tower-oauth2-resource-server**!
The library is highly inspired by [Spring Security OAuth2 Resource Server](https://docs.spring.io/spring-security/reference/servlet/oauth2/resource-server).
Some of its features include:

 - JWT validation of incoming HTTP requests
    - Signature matches public key from JWKS endpoint
    - Validity of `exp`, `nbf`, `iss` and `aud` claims
 - Automatic discovery of JWKS endpoint
 - Makes JWT claims available to downstream services via a [Request extension](https://docs.rs/http/latest/http/struct.Extensions.html)

It should be possible to use the library together with any web framework built on top of [tower](https://crates.io/crates/tower).
However, I've only verified that it works together with [axum](https://crates.io/crates/axum), [salvo](https://crates.io/crates/salvo/) and [tonic](https://crates.io/crates/tonic).

The library is available on [crates.io](https://crates.io/crates/tower-oauth2-resource-server), and you can find the source code on [github](https://github.com/Dunklas/tower-oauth2-resource-server).
You can find examples of usage for different web frameworks in the [examples](https://github.com/Dunklas/tower-oauth2-resource-server/tree/main/examples) folder of the repository.

Feel free to use and contribute!
