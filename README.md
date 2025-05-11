# Webアプリケーション開発のテンプレート

このリポジトリは、非エンジニアのためのWebアプリケーション開発のテンプレート。
AIエージェント(Cursor, Copilot等)を利用して、
保守・運用が行いやすいような設計で、迅速にWebアプリ開発が行えるような構成を目指して構築しています。

## 基本的な開発フロー

1. docsディレクトリに要件定義書を作成する。
2. AIエージェントに要件定義書をもとにテストを実装するように依頼する。
3. AIエージェントにテストが通るように実装を依頼する。

## 開発環境構築手順

### 事前準備

1.[Docker](https://docs.docker.com/desktop/setup/install/mac-install/)をインストールする

1. [Just](https://just.systems/man/en/packages.html)をインストールする

### 環境構築

1. 以下のコマンドで.envを作成し、環境変数を設定します。

```sh
cp .env.example .env
```

1. justの以下のタスクを実行する

```sh
just start-development
```

### Python

サンプルコードが豊富でAIとの相性が良いことから選定。

[UV](https://docs.astral.sh/uv/)
Pythonのパッケージ管理です。

[マニュアル](https://docs.astral.sh/uv/getting-started/installation/)に従ってインストールして下さい。

[FastAPI](https://fastapi.tiangolo.com/)
高速で自由度の高い設計が可能な素晴らしいFW。
