# プロジェクト設定
set dotenv-load
set export

# デフォルトのレシピ
default:
    @just --list

# 開発環境のビルドと実行
build-development:
    docker compose -p web-app --env-file .env -f compose.yml -f compose.dev.yml build

start-development:
    docker compose -p web-app --env-file .env -f compose.yml -f compose.dev.yml up

start-development-watch:
    docker compose -p web-app --env-file .env -f compose.yml -f compose.dev.yml watch

stop-development:
    docker compose -p web-app --env-file .env -f compose.yml -f compose.dev.yml down

# 本番環境のビルドと実行
build-production:
    docker compose -p web-app --env-file .env -f compose.yml -f compose.prod.yml build

start-production:
    docker compose -p web-app --env-file .env -f compose.yml -f compose.prod.yml up

stop-production:
    docker compose -p web-app --env-file .env -f compose.yml -f compose.prod.yml down

# コード品質管理
ruff *args:
    docker exec -it api uv run ruff check {{args}}

ruff-format:
    docker exec -it api uv run ruff format app

ruff-lint:
    docker exec -it api uv run ruff linter

# テスト実行
test:
    docker exec -it api uv run pytest --cov=app tests

# ヘルプ表示
help:
    @echo "Usage:"
    @echo "Development:"
    @echo "    just build-development       build all docker images"
    @echo "    just start-development       start local development"
    @echo "    just start-development-watch watch for changes"
    @echo "    just stop-development        stop local development"
    @echo ""
    @echo "Production:"
    @echo "    just build-production        build all docker images"
    @echo "    just start-production        start production"
    @echo "    just stop-production         stop production"
    @echo ""
    @echo "Code Quality:"
    @echo "    just ruff <path>            run ruff check"
    @echo "    just ruff-format            format code with ruff"
    @echo "    just ruff-lint              run ruff linter"
    @echo ""
    @echo "Tests:"
    @echo "    just test                   run pytest"
