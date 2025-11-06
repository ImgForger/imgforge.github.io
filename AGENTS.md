# Repository Guidelines

## Project Structure & Module Organization
This Next.js 16 app is organised around route groups under `app/`. Pages in `app/(home)` drive the marketing landing experience, while `app/docs` wires Fumadocs navigation. API handlers such as `app/api/search/route.ts` power indexed search. Shared UI sits in `components/`, and MDX content lives under `content/docs`, where numeric prefixes control sidebar order. Keep source adapters in `lib/`, tweak MDX runtime in `mdx-components.tsx`, and manage schema settings via `source.config.ts`.

## Build, Test, and Development Commands
Install dependencies with `pnpm install`. Run `pnpm dev` for the turbo dev server at `http://localhost:3000`. `pnpm build` compiles the production bundle; follow with `pnpm start` to serve it locally. `pnpm lint` runs Biome's static and type-aware checks, and `pnpm format` applies the shared formatting defaults before committing.

## Coding Style & Naming Conventions
TypeScript is standard across `app/`, `components/`, and `lib/`. Biome enforces two-space indentation, consistent semicolons, and organised imports—run it rather than tweaking settings manually. Use `PascalCase` for React components, `camelCase` for helpers, and numeric-kebab MDX filenames (`05_processing_options/index.mdx`) to preserve ordering. Prefer functional components, lightweight hooks, and Tailwind utility classes; push reusable logic into `lib/` rather than inline closures.

## Testing Guidelines
Automated tests are not yet configured, so plan for focused manual verification. Run `pnpm dev`, confirm landing content, doc navigation, and the search endpoint (`/api/search?q=example`). When introducing new behaviour, document the manual steps in the PR and, where feasible, add colocated assertions under `lib/` using your preferred runner (e.g. Vitest) until a shared harness is agreed.

## Commit & Pull Request Guidelines
Recent commits favour short, imperative subjects (`Add caching`, `Update signing.tsx`). Keep summaries under 72 characters and add a brief body when rationale is not obvious. For pull requests, include: 1) a concise change description, 2) screenshots or terminal captures for UI or CLI updates, 3) a checklist of verification steps (`pnpm lint`, manual docs tour), and 4) linked issues or doc tickets. Request review whenever both code and content move.

## Content Authoring Tips
Docs render through Fumadocs MDX. Every leaf folder should contain an `index.mdx` plus `meta.json` for labels and ordering. Frontmatter must include `title` and should provide `description` for search. Use fenced code blocks with language hints (for example, three backticks followed by `bash`) and absolute doc links (`/docs/...`). After reorganising, update `meta.json` and run `pnpm dev` to catch missing routes.
