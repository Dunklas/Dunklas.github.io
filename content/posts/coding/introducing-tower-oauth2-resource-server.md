---
title: "Introducing tower-oauth2-resource-server"
tags: ["rust", "tower", "oauth", "jwt", "authorization"]
date: 2025-02-14T00:00:00Z
draft: true
---

# Introduction / Why
I've recently experimented with writing a web backend using Axum framework in rust.

Didn't find an easy-to-use lib for managing authorization towards an external IDP.

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