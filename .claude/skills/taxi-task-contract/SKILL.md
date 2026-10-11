---
name: taxi-task-contract
description: 작업 ID(T001 등)별 작업 계약 문서 docs/tasks/<ID>.md를 docs/templates/TASK.md에서 만들고 채운다. 에이전트에 작업을 배정하기 전, 수정 경계·불변식·수용 시나리오·검증 명령을 확정할 때 사용한다. 계약 수정, 재작성, 보완 요청에도 사용한다.
---

# 작업 계약 작성

병렬 에이전트는 서로의 맥락을 모른다. 계약이 구체적이지 않으면 경계를 넘거나 완료 기준이 제각각이 되므로, 배정 전에 계약부터 고정한다(Gate G0).

## 절차
1. `docs/WORK_PLAN.md`에서 작업 ID의 선행·산출물·검증(Hxx)을 읽는다. 선행이 DONE이 아니면 계약만 만들고 READY로 올리지 않는다.
2. `docs/templates/TASK.md`를 `docs/tasks/<ID>.md`로 복사한다.
3. 아래를 채운다. 비워 두는 항목이 있으면 이유를 적는다.
   - **수정 경로**: 쓰기 허용 디렉터리/파일 목록. 병렬 작업 간 겹침 검사의 기준이다.
   - **공용 파일 요청 경로**: `default.project.json`, `src/shared/contracts/**`는 리더만 수정한다고 명시.
   - **불변식·수용 시나리오**: `docs/HARNESS_ENGINEERING.md` §6의 Hxx를 인용하고 Given/When/Then으로 구체화.
   - **실행 방법**: 실제로 실행되는 명령만. 아직 없으면 "NOT_RUN: T002 선행"처럼 쓴다.
4. 상태를 `READY`로 바꾼다(이후 `IN_PROGRESS → VERIFY → DONE`).

## 원칙
- 시나리오는 구현 내부 함수가 아니라 관측 가능한 결과(예약 수, 지급 수 등)로 쓴다.
- 외부 의존(계정·권리·결정)이 실제로 없을 때만 BLOCKED, 이유와 해제 조건을 적는다.
