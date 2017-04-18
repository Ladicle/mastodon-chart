# Mastodon chart

A Helm chart for [Mastodon](https://github.com/tootsuite/mastodon). Mastodon is a free, open-source social network server.

## How to Install?

``` shell
helm install -f secrets.yaml
```

post-install:
```
kubectl exec -it [web pod name] -- bundle exec rails db:setup
kubectl exec -it [web pod name] -- bundle exec rails assets:precompile
```

post-upgrade:
```
kubectl exec -it [web pod name] -- bundle exec rails db:migrate
kubectl exec -it [web pod name] -- bundle exec rails assets:precompile
```
