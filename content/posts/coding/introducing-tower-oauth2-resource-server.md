---
title: "Introducing tower-oauth2-resource-server"
tags: ["rust", "tower", "oauth", "jwt", "authorization"]
date: 2025-02-14T00:00:00Z
draft: true
---

# Introduction / Why
The last few months I have delved into the art of writing a REST API using rust.
Specifically, I've used the [axum](https://crates.io/crates/axum) to do so.
At one point, it was time to add authorization.
My case was simple.
I use auth0 as an identity provider, and wanted to ensure that each request provided a JWT issued by a specific auth0 client.

At the time, I was working extensively with Java and Spring in my daily job.
In that ecosystem, I had used spring-security-oauth2-resource-server for a similar use case.
That library makes things easy—you simply specify an issuer URL, and it takes care of discovering JWKS, handling key rotation, and validating JWTs.
However, in Rust, I couldn't find an equivalent library that provided the same level of simplicity.
So, I decided to build one myself!

# What does the middleware do
Authorization!
Lookup well-known/oidc-configuration

Inspired by Spring security oauth2 resource server
# Example usage
```rust
pub fn someCode() {

}
```

#  Link, and "call to usage / contribution"
You can find the repo here: https://github.com/Dunklas/tower-oauth2-resource-server