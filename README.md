# stay-focused

A Claude Code skill that keeps edits surgical.

## Install

**Plugin marketplace:**
```
/plugin marketplace add https://github.com/josharsh/stay-focused
```

**Manual:** Copy `skills/stay-focused/SKILL.md` to `~/.claude/skills/stay-focused/`.

## Why I Built This

I kept asking Claude for small changes and getting back large diffs. A one-line fix would come with a refactored helper, reorganized imports, renamed variables, and error handling I never asked for. The code worked, but I'd spend more time reviewing the stuff I didn't request than the thing I did.

`/stay-focused` makes Claude check itself before every edit. If it's about to touch something you didn't ask for, it stops and asks first.

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

## How It Works

Before every edit, Claude compares the change against your original request:

- **In scope** -- files you mentioned, required imports, fixing errors introduced by the change. No interruption.
- **Out of scope** -- unmentioned files, adjacent refactors, extra error handling, variable renames, helper extractions. Gets flagged.
- **Bugs found** -- if Claude spots a real bug (crash, security issue) while working, it flags it separately so you decide.

It's lightweight. Only flags clear overreach, not obvious necessities.

## Commands

| Command | What it does |
|---|---|
| `/stay-focused` | Activate scope enforcement |
| `/stay-focused off` | Disable it |

## Testing

Tested with [skillmother](https://github.com/josharsh/skillmother):

```bash
skillmother test skills/stay-focused/
```

## Uninstalling

```bash
rm -rf ~/.claude/skills/stay-focused
```

## License

MIT
