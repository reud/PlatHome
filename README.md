Plathome
===

[README-JP.md available](https://github.com/reud/plathome/blob/master/README-JP.md)

# Overview
自宅のデバイスの状態監視、HTTPリクエストの送信をWebから行うGo+Postgres+Nuxtなアプリケーション

# Feature
- Device registering by GUI (API are also available)
- Routine ping to registered devices
- A function called EzRequester about easy to send GET Request
- Responsive, PWA, Application

# Dependency
・docker-compose

# Setup

```
git clone https://github.com/reud/plathome.git
```

# Usage

```
cd plathome
# Take frontend,backend repositories from github.
# If you want to configure about port, just code, etc..., you should edit docker-compose.yml and start.sh
# This app uses 5432(postgres container),8080 (backend container), 3333(frontend container)port by default.
chmod a+x start.sh
./start.sh <device ip address>
```

# License
This software is released under the MIT License,  see [LICENSE](https://github.com/reud/MIT_LICENSE/blob/master/LICENSE)

# Authors
[reud](https://github.com/reud)

# References
[backend swagger API document(yml)](https://github.com/reud/plathome-backend/blob/master/swagger.yaml)
