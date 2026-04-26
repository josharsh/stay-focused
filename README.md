# Stay Focused

A Claude Code skill that keeps edits surgical. Detects when Claude is about to change code you didn't ask for and flags it before proceeding.

## Install

**Via Claude Code plugin system (recommended):**
```
/plugin marketplace add https://github.com/josharsh/stay-focused
```

**Via install script:**
```bash
git clone https://github.com/josharsh/stay-focused.git
cd stay-focused
./install.sh
```

**Manual:** Copy `skills/stay-focused/SKILL.md` to `~/.claude/skills/stay-focused/`.

## How It Works

Stay Focused adds a scope check before every code change. When Claude is about to edit or create a file, it compares the change against your original request:

- **In scope** -- editing files you mentioned, adding required imports, fixing errors introduced by the change. These proceed without interruption.
- **Out of scope** -- touching unmentioned files, refactoring adjacent code, adding error handling you didn't ask for, renaming variables, extracting helpers. These get flagged.
- **Bugs found** -- if Claude discovers a genuine bug (crash, data loss, security issue) while working, it flags it separately so you can decide.

The skill is lightweight. It only flags clear overreach, not obvious necessities.

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

The most common frustration with AI coding tools is unexpected changes. You ask for a bug fix and get a refactored file. You ask for a button and get reorganized components. `stay-focused` eliminates this at the source: Claude asks before touching anything you didn't request.

## Testing

Tests are defined in `tests.json` and compatible with [skillmother](https://github.com/josharsh/skillmother):

```bash
skillmother test ~/Development/stay-focused/
```

## Uninstalling

```bash
rm -rf ~/.claude/skills/stay-focused
```

Or remove via the plugin marketplace:

```
/plugin marketplace remove stay-focused
```

## License

MIT
