---
name: taxi-verify-gate
description: 완료 주장된 작업을 gate(G0~G4)로 독립 검증하고 증거를 artifacts/<task-id>/<run-id>/에 남긴다. 병합 전 검증, VERIFY 상태 작업 판정, 회귀 확인, 재검증 요청에 사용한다.
---

# 검증 gate 수행

자기보고가 아니라 직접 실행한 결과만 근거로 삼는다. 실행하지 못한 검사를 PASS로 쓰면 이후 단계가 허위 기반 위에 쌓이므로, 못 한 것은 NOT_RUN으로 남긴다.

## 절차
1. `docs/tasks/<ID>.md`의 수용 시나리오·실행 명령을 읽는다.
2. 경계 확인: `git diff --stat <base>...HEAD`로 변경 파일이 "수정 경로" 안인지 본다. 밖이면 FAIL(리더 승인 없는 공용 파일 수정 포함).
3. 명령을 실행해 exit code와 출력을 `artifacts/<task-id>/<run-id>/`(run-id=UTC 타임스탬프)에 저장한다. 증거에는 commit SHA, seed, 명령을 같이 적는다. 이전 실패 로그를 덮어쓰지 않는다.
4. 계약 교차 확인: DTO/Remote를 제공하는 쪽과 쓰는 쪽을 함께 읽어 필드·버전이 맞는지 본다.
5. 판정 기록(TASK 증거 표): PASS(실제), MOCK_PASS(가짜 환경), FAIL, NOT_RUN.
   - 실행 코드가 없는 단계에서 G1~G4를 PASS로 쓰지 않는다.
   - Studio/기기 확인이 필요한 G3는 에이전트가 할 수 없으므로 수동 절차를 적고 NOT_RUN으로 둔다.
6. FAIL이면 최소 재현 절차를 담당 에이전트에게 SendMessage로 전달한다. 재현 fixture는 회귀 모음에 추가한다.

## 비밀 취급
키, 원문 채팅, 사용자 식별자는 증거에 포함하지 않는다.
