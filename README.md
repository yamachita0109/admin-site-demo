# admin site demo

## Env

| Software | Version |
|-------------|----------|
| Ruby        | 3.2.3    |
| Rails       | 8.0.1    |
| MySQL       | 8.0      |

## Setup local

```sh
cp .env.sample .env
docker compose up -d --build
docker compose exec web rails db:create
open http://localhost:3003/
```
