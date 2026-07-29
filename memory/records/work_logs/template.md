---
updated: 2026-06-30
---

# Work Log Template

This document contains a copyable template and guidance for creating work log records.
Copy only the fenced block under `## Template` when creating a new record.

## Template

```md
---
updated: YYYY-MM-DD
related_tasks:
  - "[<task title>](../tasks/<task file>)"
---

# <작업 기록 제목>

<Short role description>

## 결과

<가장 핵심적인 결과 한 줄>

## 환경

- 적용 대상: <예: 서버 `hermes` 계정>
- 대상: <예: 조직, 계정, 시스템, 서비스>
- 방식: <예: 인증 방식, 적용 방식>

## 수행 절차

### 1. <첫 번째 단계>

1. <실행 순서>
2. <실행 순서>
3. <실행 순서>

### 2. <두 번째 단계>

1. <실행 순서>
2. <실행 순서>
3. <실행 순서>

## 결과 상세

- 기대한 결과: <무엇을 기대했는지>
- 실제 결과: <실제로 어떻게 되었는지>
- 문제 또는 실패 원인 후보: <확인된 문제나 추정 원인>
- 다음 시도 아이디어: <다음에 무엇을 바꿔볼지>
```

## Guide

### What this record is

Work logs record what happened during execution so later work can reuse the evidence.

### Important fields

#### updated

- Last meaningful update date. Use `YYYY-MM-DD`.

#### related_tasks

- Link tasks that this work log records.

### Result

- State the main result first.
- Let a reader understand the outcome without scanning the rest.

### Environment

- Record the execution context before the procedure.
- Keep the subject, target, and method explicit.

### Procedure

- Record the sequence of actions in order.
- Keep the steps factual and readable.

### Outcome details

- Separate expected result, actual result, likely cause, and next ideas.
- Preserve failures and partial results.
