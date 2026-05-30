# Perseus Blade — Output Formats

---

## Direct Mode
Raw one-liners. No headers, no structure. Straight to the CLI.

```
[ROLE]: [one-liner in stereotype voice]
[ROLE]: [one-liner in stereotype voice]
```

---

## Inline Mode
Comments inserted into the target at the relevant position, as close to the relevant line/section as possible.

In code:
```
// [ROLE]: [one-liner]
```

In a Hades path or Styx task:
```
> [ROLE]: [one-liner]
```

In plain text:
```
[ROLE]: [one-liner]
```

---

## Review Mode

```
# Perseus Blade — [Date] — [Topic]

## Strike Team
- [Role] — [one-line reason for inclusion]

## Target
[One paragraph describing what is being reviewed]

---

## [ROLE]
> "[Hot take in stereotype voice]"

[2-3 sentences of reasoning in their voice. Direct, no hedging.]

- **Suggestion:** [specific actionable note — omit field if none]
- **Priority flag:** [raise/lower + reason — Styx tasks only, omit otherwise]

---

[repeat per persona]

---

## Strike Summary
- [Strongest signal from the session]
- [Second signal]
- [Key tension between personas, if any]

## Needs Attention
[Items flagged independently by 2+ personas — the overlap is the real signal. Omit section if none.]
```

### Review Mode — Hades Output Variant

```
# Perseus Blade — Hades Review — [Date]

## Strike Team
- [Role] — [reason]

## Oracle Recommendation: [Path Name]
[One-line restatement of what the Oracle recommended]

---

## Team Reaction to Oracle

## [ROLE]
> "[Hot take on the recommendation]"

[Reasoning]

- **Suggestion:** [if any]

---

[repeat per persona]

---

## Notable Path Flags
[Strong reactions to specific non-Oracle paths only — omit if none]
- **[Path Name] — [ROLE]:** [one-liner]

## Strike Summary
- [Signal 1]
- [Signal 2]
```

---

## Meeting Mode

```
# Perseus Blade — Meeting: [Topic]
*[Date] | Attendees: [Role, Role, Role...]*

---

## Discussion

**[ROLE]:** [Opening position]

**[ROLE]:** [Response — agreement, pushback, or new angle. May address others directly.]

**[ROLE]:** [Their take]

[Continue until key tensions are surfaced, challenged, and either resolved or noted as unresolved]

---

## Action Items
- [ ] [Specific action from discussion] — [owner: Role or "dev"]
- [ ] [Another action]

## Verdict
[What the team landed on. Unresolved disagreements stated explicitly, not smoothed over.]
```

---

## Standing Positions — `.perseus/positions.md`

The studio's memory. One file per project, holding each persona's current stance. Reconciled in Phase 7 of every session. Supersede, never append: one Active stance per persona per issue.

```
# Perseus Blade — Standing Positions
*Project: [name] | Last updated: YYYY-MM-DD*

## Active

### [Role]
- **Position:** [the stance in one or two lines, in their voice]
- **Since:** YYYY-MM-DD | **Status:** Open / Holding / Revised | **Revisits:** N
- **Last basis:** [the session or evidence that set or last confirmed it]

[repeat per persona with an active stance]

## Resolved

- **[Role]** | [Position] | resolved YYYY-MM-DD: [how it was addressed]
```

### Standing Position Callout

When a persona with an Active stance speaks to a related target, they open from it instead of cold. Prefix their take:

```
> *Standing position (since YYYY-MM-DD, held x N):* "[the stance]"
```

Their reaction then holds, revises, or escalates it. In Direct mode, compress to one line:

```
[ROLE] (holding since YYYY-MM-DD): [one-liner]
```
