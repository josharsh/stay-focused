# stay-focused

A Claude Code skill that keeps edits surgical. Detects when Claude is about to change code you didn't ask for.

## Install

**Plugin marketplace:**

```bash
claude plugin add josharsh/stay-focused
```

**Manual:**

```bash
git clone https://github.com/josharsh/stay-focused.git
cd stay-focused
bash install.sh
```

## Demo

```
You: Fix the email regex in src/auth/login.ts

Claude: Stay Focused enabled. I'll flag any changes that go beyond what you ask for.

I found the bug in login.ts — the regex is missing the + quantifier.

> **Scope check:** You asked me to fix the email regex in login.ts.
> I'm about to also refactor the validation helper in utils/validators.ts.
> This is outside your request. Should I proceed or stay focused?

You: Stay focused.

Claude: **Done.** Changed 1 file: src/auth/login.ts. Skipped: refactor of utils/validators.ts.
```

## Commands

| Command | What it does |
|---|---|
| `/stay-focused` | Activate scope enforcement for the session |
| `/stay-focused off` | Disable scope enforcement |

## Why This Exists

Developers' #1 frustration with AI coding tools is unexpected changes -- 66% report spending more time fixing "almost-right" AI code than writing it themselves. `stay-focused` eliminates the problem at the source: Claude asks before touching anything you didn't request.

## Uninstall

```bash
rm -rf ~/.claude/skills/stay-focused
```

Or remove via the plugin marketplace:

```bash
claude plugin remove stay-focused
```

## License

MIT
