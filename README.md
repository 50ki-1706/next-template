# 📝 Todo App Template

🚀 **modern tech stack で構築されたフルスタック Todo アプリケーション**

Next.js 16, React 19, TypeScript をベースとし、認証、データベース、リアルタイム同期を備えたプロジェクトテンプレートです。

---

## 🏗️ Tech Stack

このプロジェクトは以下の最新技術を使用して構築されています。

| Layer             | Technology                                                                                                       |
| :---------------- | :--------------------------------------------------------------------------------------------------------------- |
| **Frontend**      | [Next.js 16](https://nextjs.org/), [React 19](https://react.dev/), [TypeScript](https://www.typescriptlang.org/) |
| **Styling**       | [Tailwind CSS 4](https://tailwindcss.com/), [Headless UI](https://headlessui.com/)                               |
| **Auth**          | [Better Auth](https://www.better-auth.com/) (JWT + OAuth - Google & GitHub)                                      |
| **Database**      | [PostgreSQL](https://www.postgresql.org/) with [Drizzle ORM](https://orm.drizzle.team/)                          |
| **Data Fetching** | [SWR](https://swr.vercel.app/) (Real-time sync)                                                                  |
| **Quality**       | [Biome](https://biomejs.dev/) (Fast linter & formatter)                                                          |

---

## ✨ Features

- 🔐 **認証**: メール/パスワード + Google, GitHub OAuth
- ✅ **Todo 管理**: CRUD 操作 (作成、読込、更新、削除)
- 🔄 **同期**: SWR によるリアルタイムなデータ整合
- 🌙 **UI/UX**: ダークモード対応 & レスポンシブ設計
- 🛡️ **安全**: Drizzle ORM による型安全な DB 操作
- 🐳 **コンテナ化**: Docker による一貫した開発環境

---

## 🚀 Quick Start (Docker)

Docker を使用するのが最も迅速な方法です。

```bash
# 1. 環境変数のセットアップ
cp .env.example .env

# 2. コンテナの起動
docker compose up -d

# 3. データベースの初期化
docker compose exec app pnpm db:push
```

ブラウザで [http://localhost:3000](http://localhost:3000) を開いて確認してください。

---

## 🛠️ Local Development

Node.js 環境で直接実行する場合の手順です。

### 1. 準備

- Node.js 25+
- pnpm (推奨)

### 2. セットアップ

```bash
pnpm install
cp .env.example .env.local
# BETTER_AUTH_SECRET などを設定してください
```

### 3. DB & 実行

```bash
pnpm db:push
pnpm dev
```

---

## 📂 Project Structure

```text
src/
├── app/         # Next.js App Router (API, Pages)
├── components/  # React components (Shared, Features)
├── hooks/       # Custom hooks (SWR logic)
├── lib/         # Shared libraries (DB, Auth client/server)
└── types/       # TypeScript type definitions
```

---
