# ベースイメージとして Node.js 25 を使用
FROM node:25-alpine AS base

# pnpm をインストール
RUN npm install -g pnpm@10.26.0

# 依存関係のインストール用ステージ
FROM base AS deps
WORKDIR /app

# 依存関係ファイルをコピー
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./

# 依存関係をインストール
RUN pnpm install --frozen-lockfile

# ビルド用ステージ
FROM base AS builder
WORKDIR /app

# 依存関係をコピー
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Next.js アプリケーションをビルド
RUN pnpm build

# 本番環境用ステージ
FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production

# セキュリティのため非rootユーザーを作成
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# 必要なファイルのみをコピー
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

# ユーザーを切り替え
USER nextjs

EXPOSE 3000

ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

# アプリケーションを起動
CMD ["node", "server.js"]