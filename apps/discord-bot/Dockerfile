FROM oven/bun:slim AS base
WORKDIR /app

FROM base AS install
WORKDIR /app
RUN mkdir -p /temp/prod
COPY package.json bun.lock /temp/prod
RUN cd /temp/prod && bun install --frozen-lockfile --production

FROM base AS prerelease
WORKDIR /app
COPY --from=install /temp/prod/node_modules node_modules
COPY . .
ENV NODE_ENV=production
RUN bun test
RUN bun run build

FROM base AS release
WORKDIR /app
COPY --from=install /temp/prod/node_modules node_modules
COPY --from=prerelease /app/dist/index.js .
COPY --from=prerelease /app/package.json .
USER bun
EXPOSE 3000/tcp
ENTRYPOINT [ "bun", "run", "index.js" ]