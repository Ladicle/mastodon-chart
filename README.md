# Mastodon chart

A Helm chart for [Mastodon](https://github.com/tootsuite/mastodon). Mastodon is a free, open-source social network server.

Updated to support the latest version of the Mastodon image on Dockerhub, and for K8s v1.17.

## How to Install?

``` shell
helm upgrade --install -f secrets.yaml mastodon .
```
