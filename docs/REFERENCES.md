# 근거·라이선스·정책·미확정 사항

확인 기준: 2026-10-08 (Asia/Seoul). 아래는 설계 조사 근거이며 출시 시점의 법률 검토나 플랫폼 승인을 대신하지 않는다.
수치·가격·정책·SDK/API는 실제 구현과 출시 전에 원문을 다시 확인한다.

## 1. Roblox 기술 근거

| 문서 | 설계 반영 |
|---|---|
| [Instance streaming](https://create.roblox.com/docs/workspace/streaming) | 주변 맵의 로딩/해제. NPC 서버 계산 범위는 별도 설계 |
| [Model](https://create.roblox.com/docs/reference/engine/classes/Model) | 모델 LOD/SLIM 후보, 실제 에셋으로 검증 |
| [HTTP requests](https://create.roblox.com/docs/cloud-services/http-service) | 서버에서 외부 API 연결, 인증·요청 제한·관측 |
| [Secrets stores](https://create.roblox.com/docs/cloud-services/secrets) | 서버 비밀 보관, 클라이언트 노출 금지 |
| [Data stores](https://create.roblox.com/docs/cloud-services/data-stores) | 프로필 영속화, UpdateAsync 기반 갱신 |
| [Player data and purchasing](https://create.roblox.com/docs/cloud-services/data-stores/player-data-purchasing) | 세션 잠금·구매 데이터 처리 근거 |
| [DataStore limits](https://create.roblox.com/docs/cloud-services/data-stores/error-codes-and-limits) | 실측 요청 예산·저장 제한 적용 |
| [Memory stores](https://create.roblox.com/docs/cloud-services/memory-stores) | 임시 상태용, 금전 원장 대체 금지 |
| [API keys](https://create.roblox.com/docs/cloud/auth/api-keys) | 최소 권한 발행·운영 키 |
| [Publish games and places](https://create.roblox.com/docs/production/publishing/publish-games-and-places) | Roblox 관리형 발행, 외부 컨테이너와 별도 |

일반 외부 HTTP와 Open Cloud의 요청 한도는 구분한다. 문서 숫자를 임의 혼용해 용량을 설계하지 않는다.
권한·예산은 구현 당시 해당 엔드포인트와 Roblox 서버에서 확인하고 설정으로 관리한다.

## 2. 광고·콘텐츠

[Roblox 광고 기준](https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards)은
보상형 광고의 명시적 선택, 보상 사전 고지, 확정 보상, 완료 후 지급을 요구하고 진행 관문으로 광고를 강제하는 것을 금지한다.
따라서 면허 교육은 광고 없이 완료하며 광고는 선택형 세차권 등으로 분리한다.
보상형 영상은 적격한 13세 이상 사용자 대상으로만 제공하고 플랫폼 적격성 판단을 우회하지 않는다.

[보상형 광고 공식 문서](https://create.roblox.com/docs/production/promotion/rewarded-video-ads)의 확인 당시 요건에는
공개·unrestricted 게임, 자유형 사용자 창작 미제공, 성숙도/준수 설문 승인, 월평균 고유 방문자 2,000명 이상,
게시자의 적격성·신원 확인·2FA 등이 있다. 보상은 일반적으로 Robux로 구매 가능한 developer product여야 한다.
출시 전 실제 dashboard 적격성과 API를 확인하고, 미충족이면 광고 없이 출시한다.
광고 단가·노출·수익은 보장하지 않는다. 게임 내 폭력과 광고 자체의 콘텐츠 제한을 동일한 규칙으로 오해하지 않는다.

[콘텐츠 등급 안내](https://en.help.roblox.com/hc/en-us/articles/8862768451604-Content-Maturity-Labels)에 따라
비유혈 표현이라도 실제 빈도·강도·연출로 신고·심사한다. 현재 특정 등급이나 광고 승인을 확보하지 않았다.
AI 대사의 필터·개인정보·로그 보존과 외부 전송은 T703에서 별도 정책 검증한다.

## 3. 지도·도구 출처

| 후보 | 용도 | 확인된 조건/남은 검증 |
|---|---|---|
| [OSM 한국 extract](https://download.geofabrik.de/asia/south-korea.html) | 도로·건물 윤곽·수계 | 지역별 완전성·높이 누락 실제 검사 필요 |
| [OSM 라이선스](https://www.openstreetmap.org/copyright) | ODbL·출처 표시 | 파생 DB와 제작물 구분, 데이터 공유 의무 검토 |
| [OSM 법률 FAQ](https://osmfoundation.org/wiki/Licence/Licence_and_Legal_FAQ) | 가공·배포 판단 | 게임 코드 전체 공개와 데이터 의무를 혼동하지 않음 |
| [서울 신호등·횡단보도 위치](https://data.seoul.go.kr/dataList/OA-22364/F/1/datasetView.do) | 좌표·시설물 | 공공누리 1유형 표시, 파일 실제 시점·좌표계·누락 검증 |
| [서울 차선 정보](https://data.seoul.go.kr/dataList/OA-15537/S/1/datasetView.do) | 차선 공간정보 | 공공누리 1유형 표시, 원본 파일과 metadata 시점 구분 |
| [공공누리](https://www.kogl.or.kr/info/publicGuide.do) | 이용 유형 | 1유형은 출처 표시·상업적 이용·변경 가능 |
| [USGS 고도 자료](https://www.usgs.gov/faqs/where-can-i-get-global-elevation-data) | SRTM 지형 초안 | 약 30m 격자는 미세 도로 경사에 부족, 선택 제품 조건 확인 |
| [Blosm](https://github.com/vvoovv/blosm) | OSM 기반 건물·도로 가져오기 | 도구 GPL과 입력 데이터/텍스처 권리는 별개 |
| [BlenderGIS](https://github.com/domlysz/BlenderGIS) | GIS·DEM·좌표 가공 | 적용 버전과 파일 호환성 검증 |
| [OSM2World](https://github.com/tordanik/OSM2World) | OSM→3D 변환 참고 | 라이선스·출력물·품질 검증 후 선택 |

[S-Map 오픈랩](https://openlab.eseoul.go.kr/)은 제11조의 자유이용 원칙 외에도 제3자 권리와
제8조의 검색결과/폭력적 내용 결합 제한을 포함한다. 이 게임에 사용할 파일별 재배포·콘텐츠 조건을 확인하기 전 채택하지 않는다.
[Google Map Tiles 정책](https://developers.google.com/maps/documentation/tile/policies)은 저장·추출·오프라인 이용을 제한한다.
Blosm이 Google 데이터를 가져올 수 있어도 Roblox 영구 에셋 재배포 허락을 의미하지 않는다.
브이월드 3D 모델 역시 이번 조사에서 이 용도의 명확한 최신 재배포 허락을 확인하지 못했으므로 기본 자료로 확정하지 않는다.

각 사용 데이터에 `sourceUrl, acquiredAt, dataVersion, boundingBox, crs, license,
attribution, redistributionEvidence, transforms, artifactHashes`를 manifest로 남긴다.
상업적 변형/외부 호스팅·플랫폼 업로드가 불명확하면 해당 자산을 빌드에서 제외한다.
상표·간판 사진·별도 3D 모델의 권리를 지도 좌표 라이선스가 대신 해결하지 않는다.

## 4. 확정하지 않은 결정

| 항목 | 현재 가정 | 확정 작업 |
|---|---|---|
| 첫 서울 지역 | 미선정, 1~2㎢ 검증 | T201 데이터·주행·밀도 조사 |
| 원본 대비 축척 | 공통 studsPerMeter 사용, 값 미정 | T101/T201 주행·캐릭터 비율 |
| 동접·NPC 밀도 | 서버 24명 목표, NPC 상한 미정 | T001/T302/T801 실측 |
| 하드웨어·성능 예산 | 모바일 포함, 기기 미정 | T001 |
| 클라우드 | AWS 서울/ECS 제안, 계정·예산 미정 | T004/T801 |
| 모델·Agent 제품 | 공급자 중립, 'jev' 특정 제품 미확인 | T702 adapter 비교 |
| 플레이어 공격 보호 | 쟁탈 참여 설정 제안 | T601 플레이테스트 |
| 광고 수익 | 자격 확보 전 비활성 | T802 dashboard 검증 |
| 보존 기간·개인정보 | 가명·최소화 원칙, 기간 미정 | T703/T801 정책·운영 설계 |
| 출시일 | 미정 | M2 이후 제작 속도·에셋 규모로 산정 |

미확정 항목이 전체 문서 작성이나 오프라인 기반 개발을 막지는 않는다. 의존 작업 착수 전에 필요한 결정만 확정한다.
