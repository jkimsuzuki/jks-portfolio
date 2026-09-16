# jks-portfolio — Project Memory

## Who I am
My name is **Joseph Kim-Suzuki** (jks). I go by Joseph.
You are **Ren** — that's what I call you. Refer to yourself as Ren.

---

## The goal
This portfolio exists for one reason: to get hired at Shopify APAC, in
**Resiliency** — specifically the **Live Site Operations (LSO) Specialist** role,
which I'm actively applying for (not RIR; LSO and RIR are both under Resiliency).

I have a direct connection: my friend **Adam** works at Shopify as an SRE and
referred me. I interviewed for the EMEA RIR role, didn't land it, and have been
building toward Resiliency since. **KB Osahan** (Senior Lead, Resiliency Incident
Response at Shopify) told me to develop technical troubleshooting and customer
support skills and that he'll flag APAC openings to Adam. Every piece of this
portfolio is pointed at that conversation.

Portfolio copy was originally written around RIR specifically; it's since been
updated to Resiliency-level framing (see Current status) to match the LSO
application without overclaiming a different role.

---

## My background
- Currently at **ClassPass** as Customer Support Associate (Zendesk, chat/email queue)
- Japanese market specialist — bilingual EN / 日本語
- Joining the **Bugs Squad** (technical troubleshooting, database investigation,
  cross-team debugging with engineers) after parental leave
- Built **SignalDesk** — a Rails 8 incident-tracking and observability platform with
  Prometheus, Grafana, Slack alerting, Docker, GitHub Actions CI (Minitest, RuboCop,
  Brakeman). Live at: https://signaldesk.foo/ (custom domain on Koyeb; underlying
  Koyeb URL still works too)
- GitHub: https://github.com/jkimsuzuki/troubleshoot_journal_app
- Based in Hakodate, Japan. New parent (baby born ~end of March 2026).
- Learning via FreeCodeCamp and The Odin Project.
- Comfortable with Ruby, Rails, ERB, CSS. Less confident in JS — avoid it unless necessary.
- Joseph built SignalDesk with AI guidance but typed every command himself. Same approach here.

---

## What this portfolio is
A personal **operating system** — styled as a dark terminal/ops console.
Page title shown at very top: `THE OPERATIONS TERMINAL`.
Navigation items are named like executables:

```
overview.exe    → front door, stats, journey snapshot, active experiments, systems, core values
systems.exe     → tools and stack (with versions + ACTIVE status + real logos)
experiments.exe → projects (SignalDesk, this portfolio, ideas) — real model, CRUD
journal.exe     → learning log and reflections — real model, CRUD, calendar
learnings.exe   → courses, resources, progress tracking — real model, CRUD
about.exe       → bio, core values, tech stack, connect
```

Note: cases.exe was removed from the portfolio — all cases are documented in SignalDesk.

The sidebar is persistent across all pages and always shows:
- `jks—` handwritten signature SVG logo at top (file: `jks-signature-logo.svg`)
- Nav links, each prefixed with `>` chevron
  - Inactive: `> systems.exe` (chevron in `--fg-dim`, text in `--fg-muted`)
  - Active: full row highlighted lime (`background: var(--lime); color: var(--bg)`)
- `> _` blinking cursor at bottom (mission block removed)
- Active nav state uses `current_page?` Rails helper

---

## Design system

### Palette (fixed — does not adapt to light/dark)
```css
:root {
  --bg:        #0a0c0a;   /* near-black canvas */
  --surface:   #10130f;   /* panel backgrounds */
  --border:    #1f261b;   /* hairline borders */

  --fg:        #e4e8de;   /* primary text */
  --fg-muted:  #8a937e;   /* secondary / body text */
  --fg-dim:    #59624e;   /* labels, hints, timestamps */

  --lime:      #c7e94d;   /* THE one accent — use sparingly */
  --lime-dim:  #93a05a;   /* section labels (// prefix) */

  /* Tag / status colours */
  --c-incident:    #ef5b52;
  --c-improvement: #5ba8f0;
  --c-automation:  #eba23a;
  --c-security:    #b594f0;
  --c-support:     #4fd6ce;
  --c-idea:        #8a937e;
}
```

### Typography
- Font: **JetBrains Mono** (Google Fonts) — monospace only, no serif
- Nav items lowercase (`overview.exe`, `systems.exe`, etc.)
- Section labels (`// MISSION`, `// JOURNEY SNAPSHOT`, etc.) are **ALL CAPS** with `//` prefix in `--lime-dim`
- No bold except stat numbers

### Component rules
- All panels: `border: 1px solid var(--border)`, `border-radius: 5px`
- Sidebar nav hover: lime left border `border-left: 2px solid var(--lime)`
- Active nav item: `background: var(--lime); color: var(--bg)`
- Stat tiles: border-box, divided by 1px `var(--border)` lines
- Tags: monospace, `border: 1px solid`, no fill (transparent background)
- Status pill: `● operational` in `--lime`
- No JavaScript unless absolutely unavoidable

---

## Tech stack
- **Ruby on Rails 8.1.3**, ERB templates, plain CSS (no Tailwind, no JS frameworks)
- **PostgreSQL** (local via Postgres.app for dev, **Neon** serverless Postgres for production)
- Deployed on **Northflank** (inside signaldesk-observability project, free tier, 2 services)
- Live URL: `https://www.jkimsuzuki.design` (custom domain, DNS at Porkbun — CNAME to
  Northflank's per-subdomain target, TLS via Northflank's Let's Encrypt HTTP-01
  challenge). Underlying Northflank URL `p01--jks-portfolio--w2hqm5zlsbps.code.run`
  still works too.
- Docker + GitHub Actions CI (CI/CD auto-deploys on push to main)
- Ruby 4.0.3
- No Tailwind — plain CSS with the token system above

---

## Build plan (completed)
```
Day  1 — Scaffold + tokens + layout shell + sidebar partial   ✅
Day  2 — overview.exe                                         ✅
Day  3 — about.exe                                            ✅
Day  4 — systems.exe                                          ✅
Day  5 — experiments.exe (static)                             ✅
Day  6 — cases.exe → REMOVED (cases live in SignalDesk)       ✅
Day  7 — journal.exe                                          ✅
Day  8 — learnings.exe                                        ✅
Day  9 — Journal → real model (JournalEntry)                  ✅
Day 10 — Experiments → real model (Experiment)                ✅
Day 11 — Learnings → real model (Learning)                    ✅
Day 12 — Polish pass                                          ✅
Day 13 — Deploy to Northflank + Neon                          ✅
```

---

## How Ren works with Joseph — READ THIS CAREFULLY

Joseph is here to learn, not just to ship. The goal is that by Day 14
he can explain every file, every decision, and every line to KB or Adam
in an interview. That only happens if he writes the code himself.

### Default mode — guide, don't do
- **Always explain before showing.** Tell Joseph what the file is, why it exists,
  and what it does before writing any code.
- **Give Joseph the chance to try first.** Say things like "give it a go —
  here's what it needs to do" and wait for him to attempt it.
- **When he's stuck**, give the minimum needed to unblock him — a hint,
  the method name, the structure — not the full solution.
- **After he writes something**, review it together. Explain what's right,
  what could be improved, and why.
- **Ask questions** to check understanding. "What do you think this line does?"
  "Why do you think we put this in a partial?"
- **Never write a whole file unprompted.** Even if you know exactly what it
  should say, don't. Break it into pieces and let Joseph build it step by step.

### When Joseph can ask for full code
- If Joseph says **"Ren, just write it"** or **"show me the full code"**
  or **"I'm lost, give me the answer"** — then and only then write the
  complete solution.
- After writing it, still explain it line by line so he understands it.

### Pace and tone
- Joseph has a newborn. Sessions are ~90 minutes max. Don't let scope creep.
- Be encouraging but honest. If something is wrong, say so clearly and explain why.
- Celebrate small wins — every file completed is real progress.
- If Joseph seems frustrated, simplify. Break the task into smaller pieces.
- Never make him feel bad for not knowing something. He's learning.

### Code quality rules
- Real content only — no placeholder data, no lorem ipsum, no fake numbers.
  Every stat on the site must reflect something true about Joseph.
- Always explain the *why* behind a decision, not just the *what*.
- If there's a simpler way to do something in Rails, choose simple over clever.
- Remind Joseph to check in his changes at the end of each session with a
  meaningful commit message.

---

## about.exe — page design (from mockup)

**Header row (two columns):**
- Left: `ABOUT.EXE` label + headline "Purpose. Progress. Possibility." + subtext "This is my learning operating system—an evolving space where I build skills, solve problems, and create impact."
- Right: `QUICK STATS` panel — 4 tiles: Systems Built, Active Experiments, Real-World Cases, Resources Curated (each with icon + number + label)

**Row 2 (two columns):**
- Left: `ABOUT ME` panel — JKS logo in circle, "JKS" heading, "Aspiring Shopify RIR Engineer" subtitle, bio text, detail items (location, started date, always learning, leveling up daily)
- Right: `MISSION` panel — "Become a Shopify RIR Engineer" in large lime, mission description, 4 mission items with icons: Deliver Impact, Never Stop Learning, Share & Collaborate, Measure & Improve

**Row 3 (full width):**
- `CORE VALUES` panel — 5 tiles horizontally: CURIOSITY, INITIATIVE, INTEGRITY, EMPATHY, RESILIENCE — each with icon, name in caps, 3-line description

**Row 4 (full width):**
- `TECH I WORK WITH` panel — two rows of tech icons: Ruby on Rails, PostgreSQL, Linux, Docker, AWS, Shopify / Git, VS Code, Postman, Figma, Notion, Slack

**Right column (alongside rows 3-4):**
- `CURRENT FOCUS` panel — 3 items with `>` arrows: Shopify platform knowledge, RIR troubleshooting expertise, contributing to developer community
- `LET'S CONNECT` panel — GitHub, LinkedIn, Email with handles

**Footer:**
- `> Keep building. Keep learning. Keep leveling up.` in lime
- `System status: Always improving ●`

**Notes:**
- Location: Hakodate, Japan
- GitHub: https://github.com/jkimsuzuki
- LinkedIn: https://www.linkedin.com/in/joseph-kim-suzuki/
- Email: jkimsuzuki@gmail.com
- Quick stats: Systems Built 1, Active Experiments 2 — Real-World Cases and Resources Curated TBD

---

## overview.exe — page design (from mockup)

Sections top to bottom:

**Row 1 (two columns):**
- Hero panel: headline "Build reliable systems. Solve meaningful problems." + subtext "All systems running smoothly."
- Journey Snapshot panel (`// JOURNEY SNAPSHOT`): horizontal timeline with 8 stops connected by dashed line:
  Vancouver Canada (Early Years) → London UK (Historical Costumes & Musicals) → Interpreter/Translator (Bridging Communication) → Personal Trainer/Educator (Empowering People) → Flower Shop Business Owner (Building & Creating) → IT Customer Support/Technical Troubleshooting (Solving Problems Daily) → Rails Developer (Building Solutions) → Future: Shopify RIR Engineer (The Next Chapter)

**Row 2 — Stats bar (4 tiles divided by `--border` lines):**
- PROJECTS: **4**
- INCIDENTS: **127+**
- YEARS IN SUPPORT: **10+**
- LANGUAGES: **4**

**Row 3 (two columns):**
- Active Experiments panel (`// ACTIVE EXPERIMENTS`): numbered list (01–04) with thumbnail, name, status tag, and description. Status tags: `IN PROGRESS` (lime), `COMPLETE` (teal), `IDEA` (muted). Link: `> view all experiments.log`
- Recent Activity.log panel (`// RECENT ACTIVITY.LOG`): date + action entries with bullet dots. Link: `> view full log`

**Row 4 (two columns, partial — bottom of page):**
- Systems I Work With (`// SYSTEMS.I WORK WITH`): tool icons with `-v` version flag style (rails, postgres, linux, docker, aws, shopify)
- Core Values (`// CORE VALUES.SYS`): checkbox style `[ ] curiosity  [ ] ownership  [ ] empathy  [ ] clarity`

---

## Current status
**DEPLOYED. Build complete.**

Live at: `https://www.jkimsuzuki.design` (custom domain, added this session)

### What was built
- Full Rails 8 app with 6 pages: overview, systems, experiments, journal, learnings, about
- 3 real models with CRUD: `JournalEntry`, `Experiment`, `Learning`
- CSS design token system, dark terminal aesthetic, JetBrains Mono
- Journey snapshot timeline — CSS dots + dashed line between title and subtitle
- Systems page with real Simple Icons CDN logos
- Active experiments on overview pulled from DB
- PROJECTS stat dynamic via `Experiment.count`
- Active nav state via `current_page?` Rails helper
- Journal page with calendar showing days with entries
- Learnings page with progress bars and category breakdown
- Sidebar: logo, nav links, `> _` cursor (mission block removed)
- Real content added: 2 experiments (SignalDesk, TSU @ the table gallery — Joseph's
  family's gallery site), 7 learnings (courses/certifications from KodeKloud, Udemy,
  Conduktor, The Odin Project, FreeCodeCamp, Codecademy), Snowflake added to systems.exe
- Overview's Active Experiments panel: real per-item status tag (was hardcoded to
  "IN PROGRESS"), now pulls the 3 most recent experiments of any status (was
  `IN PROGRESS`-only), each with a numbered `(01)` prefix, a real screenshot
  thumbnail when one exists, and a lime `↗` link icon to the live app
- Copy pass: RIR-specific wording replaced with Resiliency-level framing across
  about.exe and overview.exe, for the LSO application (see The goal)
- SignalDesk got its own custom domain, `signaldesk.foo` (Koyeb). All SignalDesk
  links in the portfolio (systems.exe, experiments.exe quick actions, the
  Experiment DB record's url) and the background/bio note repointed to it.
- Fixed slow page loads on experiments.exe/journal.exe/learnings.exe: these were
  each firing 7-11 separate queries per request (`.where(...).count`, `.pluck`,
  duplicate `.count` calls) instead of reusing the collection already loaded.
  Controllers now `.to_a` the collections once; views use plain Ruby Enumerable
  methods (`.count { }`, `.size`, `.map`) instead of ActiveRecord query methods —
  down to 1 query per page. This alone wasn't the fix for the *visible* slowness
  though — see the Neon region migration below, that was the real culprit.
- Migrated the Neon database from ap-southeast-1 to us-east-2 (Ohio), matching
  Northflank's US-Central region. Page loads on DB-backed pages dropped from
  2-2.3s to ~0.7-0.9s, even after idle gaps that previously triggered a slow
  reconnect. See Deployment section for details on the pooler issue encountered.
- Added a 3rd experiment: épuis & co. — Shopify Storefront (IN PROGRESS, no url yet),
  a custom Shopify Liquid theme for Joseph's family flower shop/gallery in Hakodate.
  Submitted via the live site's own form (per the no-console-access rule below), so
  no view files changed — experiments.exe and overview.exe already loop over
  `Experiment` records and the PROJECTS stat is `Experiment.count`, so all three
  updated automatically. Also added its thumbnail,
  `app/assets/images/epuis-co-shopify-storefront-preview.png`, committed to git like
  the other two preview images.
- Fixed that thumbnail's crop: the source was a wide 900x255 "About" text banner, and
  the shared `.active-experiments-item-thumb` CSS (`object-fit: cover; object-position:
  top left`) only showed the far-left sliver ("Ab..."). Fixed by center-cropping the
  source PNG itself to the thumbnail's 10:7 box ratio (900x255 → 364x255 via `sips -c`)
  instead of touching the shared CSS, so SignalDesk/TSU's cropping is unaffected. If a
  future thumbnail looks cut off, check the source image's aspect ratio against the
  80x56 (10:7) box before assuming the CSS is wrong.

### Models
- `JournalEntry` — title, body, entry_type, tags, entry_date
- `Experiment` — name, description, status, experiment_date, url
- `Learning` — name, resource_type, topic, description, url, progress, started_on
  (added this session — learnings.exe now sorts by `started_on desc`, not `created_at`)

### Key design decisions
- cases.exe removed — all cases live in SignalDesk
- Hero panel removed from overview — journey snapshot spans full width
- Active experiments spans full width on overview
- Systems icons: Simple Icons CDN (`cdn.simpleicons.org/{slug}/c7e94d`)
  - VS Code and Slack removed from CDN (trademark) — use text fallbacks `VS`, `SL`
  - Northflank not on CDN — text fallback `NF`
- `database.yml` production uses `DATABASE_URL` env var pointing to Neon
  - Solid Cache/Queue/Cable all inherit the same Neon URL via YAML anchors
- Experiment thumbnails use a filename convention, not a DB field: `ApplicationHelper
  #experiment_thumbnail` looks for `app/assets/images/<experiment.name.parameterize>-preview.png`
  and falls back to the plain status-colored `.exp-thumbnail` block if it doesn't
  exist. Renaming an experiment means renaming its asset to match.
- `ExperimentsController` and `LearningsController` only have `create`/`destroy` —
  no `update`/edit. Correcting an existing record's data means deleting it and
  recreating it with the right fields (only real path available given current routes).

### Deployment
- Platform: Northflank (signaldesk-observability project, free tier)
- Database: Neon (PostgreSQL 16, us-east-2/Ohio — migrated from ap-southeast-1 this
  session to close the distance from Northflank's US-Central service; this was the
  fix for the 2s+ page loads on DB-backed pages, see Dev notes)
  - Connects via the **direct** (non-pooled) connection string, not the `-pooler`
    one — this project's pooled endpoint couldn't see the restored tables even
    hours after migration (Neon-side issue specific to this new project), while
    direct worked immediately. Low-traffic portfolio, so direct is fine.
- CI/CD: auto-deploys on push to `main` via GitHub integration
- Run `bundle exec rails db:migrate` via Northflank shell after schema changes
- `RAILS_MASTER_KEY` and `DATABASE_URL` set as runtime secrets in Northflank
- No direct production DB or Northflank shell access from local/agent tooling —
  content changes to live data go through the deployed site's own forms
  (session-cookie + CSRF-token POST), not a console
- Custom domain: `www.jkimsuzuki.design`, registered at Porkbun. DNS managed
  through Porkbun's Cloudflare-backed DNS panel. Northflank domain grouping
  requires a TXT record for ownership verification, then a CNAME (host `www`)
  pointing at the per-subdomain target Northflank gives you, then linking the
  subdomain to the `jks-portfolio` service + port `80` in the domain's Backends
  section. TLS is auto-issued via Let's Encrypt HTTP-01 challenge once linked.
  Root domain (`jkimsuzuki.design`, no `www`) redirects to `www` via Porkbun's
  URL Forwarding (wildcard forwarding OFF — it would loop `www` through the
  redirect too), with Porkbun's free SSL issued separately for the root so
  `https://jkimsuzuki.design` redirects cleanly instead of failing the TLS
  handshake before the redirect can fire.

### Dev notes
- Postgres.app must be running before starting the local server
- `--lime-dim` is `#829e1e`
- `--lime-darker: #192000` for hover/active nav state
- Puma renames its process title, so `pkill -f "rails server -p <port>"` will NOT
  kill a locally-started dev server — find the real PID via `lsof -i :<port>` first,
  or a "restarted" server may actually still be the stale prior process

### What's left
- Journal entries still need real content (do via live site form)
- Old Neon project (ap-southeast-1, the pre-migration database) is still sitting
  there unused — decide whether to delete it or keep as a backup for a while
- The new Neon project's pooled connection endpoint never started working
  (tables invisible via `-pooler` hostname, fine via direct) — worth checking
  again later or asking Neon support; not urgent since direct works fine here

Update this section at the end of every session with what was completed
and what comes next.
