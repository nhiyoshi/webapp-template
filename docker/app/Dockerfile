FROM python:3.12-slim-bullseye  AS base

# Install uv.
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Copy the application into the container.
COPY . /app

# Install the application dependencies.
WORKDIR /app

RUN useradd -m appuser && \
    chown -R appuser:appuser /app/.venv && \
    chmod -R 755 /app/.venv

# デバッグ環境ステージ
FROM base AS debug
# 開発用依存関係をインストール（debugpyを含む）
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --dev --frozen --no-install-project


# 環境のパスに実行可能ファイルを前方に配置
ENV PATH="/app/.venv/bin:$PATH"

USER appuser

# デバッグモードで起動
CMD ["python", "-Xfrozen_modules=off", "-m", "debugpy", "--wait-for-client", "--listen", "0.0.0.0:5678", "-m", "uvicorn", "app.main:app", "--reload", "--host", "0.0.0.0", "--port", "8001"]

# 開発環境ステージ
FROM base AS development
# 開発用依存関係をインストール（debugpyを含む）
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --dev --frozen --no-install-project


# 環境のパスに実行可能ファイルを前方に配置
ENV PATH="/app/.venv/bin:$PATH"

USER appuser

CMD ["fastapi", "dev", "--host", "0.0.0.0"]

# 本番環境ステージ
FROM base AS production
# 本番用依存関係をインストール（開発用ツールを除外）
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-install-project --no-dev

# 環境のパスに実行可能ファイルを前方に配置
ENV PATH="/anappise/.venv/bin:$PATH"

USER appuser

# Run the application.
CMD ["fastapi", "run", "app/main.py", "--port", "80"]
