# Todo App Template

A full-stack Todo application built with modern web technologies.

## Tech Stack

- **Frontend**: Next.js 16, React 19, TypeScript
- **Styling**: Tailwind CSS 4, Headless UI
- **Authentication**: Better Auth (JWT + OAuth - Google & GitHub)
- **Database**: PostgreSQL with Drizzle ORM
- **Data Fetching**: SWR
- **Code Quality**: Biome (linter & formatter)

## Features

- User authentication with email/password and OAuth (Google, GitHub)
- Create, read, update, and delete todos
- Mark todos as complete/incomplete
- Real-time data synchronization with SWR
- Dark mode support
- Responsive design
- Type-safe database operations with Drizzle ORM

## Docker Quick Start (Recommended)

最も簡単に環境を構築する方法です。Docker と Docker Compose がインストールされている必要があります。

1. **環境変数の準備**:
   `.env.example` を `.env` にコピーし、必要に応じて値を編集します。

   ```bash
   cp .env.example .env
   ```

   ※ `DATABASE_URL` はデフォルトで Docker 用の設定になっています。

2. **起動**:

   ```bash
   docker compose up -d
   ```

   これでアプリケーション ([http://localhost:3000](http://localhost:3000)) と PostgreSQL が立ち上がります。

3. **データベースの初期化**:
   コンテナが起動している状態で以下を実行します。
   ```bash
   docker compose exec app pnpm db:push
   ```

## Getting Started (Local Development)

### Prerequisites

- Node.js 25+
- pnpm (recommended) or npm

### Installation

1. Clone the repository
2. Install dependencies:

```bash
pnpm install
```

3. Set up environment variables:

Copy `.env.example` to `.env.local` and update the values:

```bash
cp .env.example .env.local
```

Required environment variables:

- `BETTER_AUTH_SECRET`: A secret key for JWT signing (generate a random string)
- `BETTER_AUTH_URL`: Your app URL (http://localhost:3000 for development)

Optional (for OAuth):

- `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET`
- `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET`

4. Initialize the database:

```bash
pnpm db:push
```

5. Run the development server:

```bash
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000) to see the app.

## Available Scripts

- `pnpm dev` - Start development server
- `pnpm build` - Build for production
- `pnpm start` - Start production server
- `pnpm lint` - Lint code with Biome
- `pnpm format` - Format code with Biome
- `pnpm db:push` - Push database schema changes
- `pnpm db:studio` - Open Drizzle Studio to view database

## Docker Commands

Docker 環境での開発に便利なコマンドです。

- `docker compose build` - イメージの再ビルド
- `docker compose logs -f` - ログの表示
- `docker compose down -v` - 環境の停止とボリューム（データ）の削除
- `docker compose exec app pnpm <script>` - アプリコンテナ内でのスクリプト実行

## Project Structure

```
src/
├── app/
│   ├── api/
│   │   ├── auth/[...all]/    # Better Auth API routes
│   │   └── todos/             # Todo CRUD API routes
│   ├── layout.tsx             # Root layout
│   └── page.tsx               # Home page
├── components/
│   ├── AuthForm.tsx           # Login/signup form
│   └── TodoList.tsx           # Todo list component
├── hooks/
│   └── useTodos.ts            # SWR hooks for todos
└── lib/
    ├── auth.ts                # Better Auth server config
    ├── auth-client.ts         # Better Auth client config
    └── db/
        ├── index.ts           # Database connection
        └── schema.ts          # Database schema
```

## OAuth Setup (Optional)

### Google OAuth

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable Google+ API
4. Create OAuth 2.0 credentials
5. Add authorized redirect URI: `http://localhost:3000/api/auth/callback/google`
6. Copy Client ID and Client Secret to `.env.local`

### GitHub OAuth

1. Go to GitHub Settings > Developer settings > OAuth Apps
2. Create a new OAuth App
3. Set Authorization callback URL: `http://localhost:3000/api/auth/callback/github`
4. Copy Client ID and Client Secret to `.env.local`
