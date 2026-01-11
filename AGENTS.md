# 🤖 AGENTS.md: AI Assistant Context & Guidelines

このドキュメントは、AI 開発アシスタントがこのプロジェクトを正確に理解し、設計思想と規約に基づいたコード生成・修正を行うための指示書です。

---

## 🧐 Project Overview

Next.js 16 + React 19 + TypeScript をベースとした Todo アプリケーションテンプレート。

- **Primary Goal**: スケーラブルで型安全なフルスタック開発環境の提供。
- **Architecture**: App Router, Server Actions/API Routes, Drizzle ORM, SWR.

---

## 🛠️ Technology Stack (Strict)

AI は以下のスタックを前提に提案を行ってください。

| Category        | Technology              | Notes                                     |
| :-------------- | :---------------------- | :---------------------------------------- |
| **Runtime**     | Node.js 25+             | `pnpm` をパッケージマネージャとして使用。 |
| **Framework**   | Next.js 16 (App Router) | React 19 features を活用。                |
| **Styling**     | Tailwind CSS 4          | Vanilla CSS + Tailwind utility classes.   |
| **Database**    | Drizzle ORM             | PostgreSQL (pg driver).                   |
| **Auth**        | Better Auth             | `src/lib/auth.ts` を参照。                |
| **Format/Lint** | Biome                   | ESLint/Prettier ではなく Biome を使用。   |

---

## 📁 Folder Structure & Naming Conventions

### Structure

- `src/app`: Routes, Layouts, API.
- `src/components`: React components. `shared/` は共通部品、機能別はディレクトリを分ける。
- `src/hooks`: Custom hooks (SWR logic はここに集約)。
- `src/lib`: Core logic, Configs (Auth, DB).
- `src/types`: TypeScript schema definitions.

### Naming

- **Components**: PascalCase (e.g., `TaskCard.tsx`).
- **Hooks**: camelCase with `use` prefix (e.g., `useAuth.ts`).
- **Directories**: kebab-case (e.g., `task-list/`).

---

## 📜 Coding Rules & Principles

### 1. State Management

- **Local**: `useState` / `useReducer`.
- **Global**: React Context (minimal).
- **Server**: **SWR** (`src/hooks/`) を使用してデータフェッチ、キャッシュ、同期を行う。

### 2. Data Flow

- **UI → Hooks → API** の流れを遵守。
- コンポーネントは表示に専念し、ロジック（データ整形、API 呼び出し）は hooks に隠蔽する。

### 3. Components

- **Single Responsibility**: 1 コンポーネント 200 行以内を目安に分割。
- **Props**: すべての Props に明示的な型定義を行う。
- **Headless UI**: アクセシビリティ確保のため、極力 Headless UI を使用。

### 4. Performance

- **React Compiler**: プロジェクト全体で React Compiler が有効。`useMemo`, `useCallback` は原則として明示的に記述しない。

---

## 🚫 Anti-Patterns (Warnings)

- ❌ `useEffect` によるデータフェッチ（SWR を使用すること）。
- ❌ 深い Prop Drilling（Context または設計の見直し）。
- ❌ `any` 型の使用（Biome で禁止済み）。
- ❌ コンポーネント内での直接的な DB アクセス（API Routes/Actions を経由）。

---

## 🔧 Common Commands for AI

AI が作業中に実行を提案すべきコマンド。

- `pnpm lint`: コード品質チェック。
- `pnpm db:push`: スキーマ変更の反映。
- `docker compose exec app pnpm <command>`: Docker 環境での実行。
