# Webアプリケーション開発のテンプレート

このリポジトリは、非エンジニアのためのWebアプリケーション開発のテンプレート。
AIエージェント(Cursor, Copilot)を利用して、
保守・運用が行いやすいような設計で、迅速にWebアプリ開発が行えるような構成を目指して構築しています。

## 基本的な開発フロー

1. Docsディレクトリに要件定義書を作成する。
2. 要件定義書をもとにテストを実装する。
3. AIエージェントにテストが通るように実装を依頼する。

## 使用技術

### Python

サンプルコードが豊富でAIとの相性が良いことから選定。

[UV](https://docs.astral.sh/uv/)
Pythonのパッケージ管理です。

[マニュアル](https://docs.astral.sh/uv/getting-started/installation/)に従ってインストールして下さい。

[FastAPI](https://fastapi.tiangolo.com/)
高速で自由度の高い設計が可能な素晴らしいFW。
