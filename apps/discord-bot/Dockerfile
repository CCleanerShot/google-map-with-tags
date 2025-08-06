# TODO: properly minify + deploy this but I've only touched bun for like 10 minutes so I'll think about it later

FROM oven/bun:slim AS stage1
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build && npm prune --production

FROM oven/bun:slim AS stage2
USER 1000:1000
WORKDIR /app
RUN ls
COPY --from=stage1 --chown=1000:1000 /app/build ./build
COPY --from=stage1 --chown=1000:1000 /app/node_modules ./node_modules
COPY package.json .
ENV PORT=5050
EXPOSE 5050
CMD ["bun", "run", "./src/index.ts"]