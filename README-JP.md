Plathome
===

# Overview
自宅のデバイスの状態監視、HTTPリクエストの送信をWebから行うGo+Postgres+Nuxtなアプリケーション

# Feature
- GUIでのデバイス登録(APIも提供)
- 登録したデバイスへの定期的なping
- GETリクエストを簡単に送れるEzRequester機能
- スマホ、PC両対応のPWA,レスポンシブアプリケーション

# Dependency
・docker-compose

# Setup

```
git clone https://github.com/reud/plathome.git
```

# Usage

```
cd plathome
# frontendとbackendのリポジトリを持ってきて、docker-compose buildとdocker-compose run -d を行う。 
# port など諸々変更を行いたい場合はフォークしたりしてstart.shやdocker-compose,frontendとbackendのリポジトリを編集してください。
# デフォルトの使用ポートは5432(postgres) 8080(backend) 3333(frontend) です。
chmod a+x start.sh
./start.sh <device ip address>
```

# License
This software is released under the MIT License,  see [LICENSE](https://github.com/reud/MIT_LICENSE/blob/master/LICENSE)

# Authors
[reud](https://github.com/reud)

# References
[backend swagger API document(yml)](https://github.com/reud/plathome-backend/blob/master/swagger.yaml)
