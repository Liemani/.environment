---
updated: 2026-06-30
---

# Task Template

This document contains a copyable template and guidance for creating task records.
Copy only the fenced block under `## Template` when creating a new record.

## Template

```md
---
status: <Now / Backlog / Done / Canceled>
updated: YYYY-MM-DD
related_work_logs:
  - "[<work log title>](../work_logs/<work log file>)"
related_decisions:
  - "[<decision title>](../decisions/<decision file>)"
---

# <작업 제목>

<Short role description>

## Checklist

- [ ] <아직 하지 않은 실행 항목> (YYYY-MM-DD)
- [~] <진행 중인 실행 항목> (YYYY-MM-DD)
- [x] <완료한 실행 항목> (YYYY-MM-DD)
- [-] <취소한 실행 항목> (YYYY-MM-DD)

## Notes

- <작업의 목적>
- <진행 중 참고할 사항>
```

## Guide

### What this record is

Task records manage executable work that can be tracked over time.

### Important fields

#### status

- Current state of the task.

Allowed values:

- `Backlog`
- `Now`
- `Done`
- `Canceled`

#### updated

- Last meaningful update date. Use `YYYY-MM-DD`.

#### related_work_logs

- Link work logs that record execution for this task.

#### related_decisions

- Link decisions influenced by this task.

### Checklist

- Represent executable actions.
- Progress through checklist states.
- Include a date on each item.
- The date is the item's last status change date.

Allowed states:

- `[ ]`
- `[~]`
- `[x]`
- `[-]`

Checklist items should include dates.

### Notes

- Record extra context, constraints, or reminders.
- Keep it separate from executable checklist items.
