# Taximulation — 서울 택시: 콜 전쟁

실제 서울 도로에서 걷고 운전하며 플레이어·NPC 손님을 운송하는 Roblox 멀티플레이 게임.
NPC 시민·교통·경찰과 외부 AI 감독이 플레이어 행동에 반응하는 도시를 구성한다.

## 현재 상태

2026-10-08 기준 **설계 단계**. 실행 코드는 Rojo 기본 진입점과 예제 모듈뿐이다.
문서에 나오는 서비스·인프라·하네스는 목표 설계이며 구현·배포·성능 검증 완료를 뜻하지 않는다.
인접한 `../orchesty/`는 별도 프로젝트다.

## 설계 문서

1. [게임 기능과 규칙](docs/GAME_DESIGN.md)
2. [프로젝트 아키텍처](docs/ARCHITECTURE.md)
3. [MSA와 서비스 명세](docs/SERVICES.md)
4. [배포 구조와 운영](docs/DEPLOYMENT.md)
5. [하네스 엔지니어링](docs/HARNESS_ENGINEERING.md)
6. [작업 목록과 완료 조건](docs/WORK_PLAN.md)
7. [작업 계약 템플릿](docs/templates/TASK.md)
8. [근거·정책·미확정 사항](docs/REFERENCES.md)

## 제품 기준

- 유저가 한 명이어도 NPC 운송과 도시 생활이 가능하다.
- 실시간 이동·충돌·정산·면허는 Roblox 서버가 판정한다.
- AI는 허용된 행동을 제안하며, 장애 시 규칙 기반 게임으로 계속 진행한다.
- 상세한 서울은 거리별 상세도·스트리밍을 적용하고 단계적으로 확장한다.
- 교육은 광고 없이 완료 가능하다. 광고는 적격 사용자에게 선택형으로 제공한다.
- 설계상의 수치와 인프라 선택은 실측 전 가정이다.

## Getting Started
To build the place from scratch, use:

```bash
rojo build -o /tmp/taximulation.rbxlx
```

프로젝트 디렉터리에서 실행한다. Aftman 사용 시 먼저 `aftman install`로 도구를 설치한다.
생성된 `/tmp/taximulation.rbxlx`를 Roblox Studio에서 열고 Rojo 서버를 시작한다:

```bash
rojo serve
```

For more help, check out [the Rojo documentation](https://rojo.space/docs).

외부 서버·Docker·테스트 명령은 아직 구현되지 않았다. 검증된 실행 명령만 이후 여기에 추가한다.
