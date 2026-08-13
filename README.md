# 종합 자산 모의투자 앱 (Trading)

주식, 코인, 게임 아이템, 한정판 스니커즈 등 다양한 자산 카테고리를 아우르는 모의투자 Flutter 앱의 기초 뼈대 프로젝트입니다.

> **참고:** 현재 프로젝트는 Boilerplate 단계로, UI/UX 디자인, 실제 API 연동, 비즈니스 로직 등은 포함되어 있지 않습니다. 각 모듈은 확장 가능한 인터페이스와 플레이스홀더만 제공합니다.

## 목차

- [프로젝트 구조](#프로젝트-구조)
- [지원 자산 카테고리](#지원-자산-카테고리)
- [시작하기](#시작하기)
  - [요구 사항](#요구-사항)
  - [로컬 실행](#로컬-실행)
- [아키텍처 개요](#아키텍처-개요)
  - [Domain Layer](#domain-layer)
  - [Data Layer](#data-layer)
  - [Presentation Layer](#presentation-layer)
- [CI/CD (iOS 무서명 IPA 빌드)](#cicd-ios-무서명-ipa-빌드)
- [다음 단계](#다음-단계)

## 프로젝트 구조

Clean Architecture를 기반으로 계층 간 의존성 역전 원칙(DIP)을 준수하는 확장 가능한 구조입니다.

```
trading/
├── .github/
│   └── workflows/
│       └── ios-build.yml              # GitHub Actions: iOS 무서명 IPA 자동 빌드
├── lib/
│   ├── main.dart                      # 앱 진입점 (MaterialApp 부트스트랩)
│   ├── core/                          # 공통 유틸, 상수, 테마, 에러 처리 (확장용)
│   ├── data/
│   │   ├── datasources/               # 원격 API / 로컬 DB 데이터 소스 (확장용)
│   │   ├── models/                    # DTO: fromJson / toJson 직렬화
│   │   │   ├── asset_model.dart
│   │   │   └── portfolio_model.dart
│   │   └── repositories/              # Domain Repository 구현체 (확장용)
│   ├── domain/
│   │   ├── entities/                  # 순수 도메인 모델 (프레임워크 비의존)
│   │   │   ├── asset_entity.dart
│   │   │   └── portfolio_entity.dart
│   │   ├── repositories/              # Repository 추상 인터페이스 (확장용)
│   │   └── usecases/                  # UseCase (비즈니스 로직 오케스트레이터, 확장용)
│   └── presentation/
│       ├── navigation/
│       │   └── main_shell.dart        # 3탭 BottomNavigationBar + IndexedStack
│       ├── pages/
│       │   ├── home/home_page.dart         # 홈 화면 (Placeholder)
│       │   ├── market/market_page.dart     # 마켓 화면 (Placeholder)
│       │   └── portfolio/portfolio_page.dart # 포트폴리오 화면 (Placeholder)
│       └── widgets/                   # 공통 재사용 위젯 (확장용)
├── analysis_options.yaml              # Lint 규칙 (flutter_lints 기반)
└── pubspec.yaml                       # 패키지 의존성 관리
```

## 지원 자산 카테고리

`AssetCategory` enum으로 4가지 자산 유형을 지원합니다:

| 값 | 설명 |
|----|------|
| `stock` | 국내/해외 주식 |
| `coin` | 암호화폐 |
| `gameItem` | 게임 아이템 (스킨, 아이템 등) |
| `sneaker` | 한정판 스니커즈 / 리셀 상품 |

## 시작하기

### 요구 사항

- **Flutter SDK:** `>=3.0.0 <4.0.0` (권장: 3.19.x stable)
- **Dart SDK:** Flutter에 번들된 버전 사용
- **iOS 빌드 (선택 사항):** macOS + Xcode 15.2 이상

### 로컬 실행

1. Flutter 의존성 설치:
   ```bash
   flutter pub get
   ```

2. 에뮬레이터/시뮬레이터 또는 실기기 연결 확인:
   ```bash
   flutter devices
   ```

3. 앱 실행:
   ```bash
   flutter run
   ```

4. (선택) 정적 분석 실행:
   ```bash
   flutter analyze
   ```

## 아키텍처 개요

### Domain Layer

가장 내부 계층으로, 외부 프레임워크에 대한 의존성이 **전혀 없는** 순수 Dart 코드입니다.

- **Entities:** 비즈니스 규칙의 핵심이 되는 데이터 모델
  - [asset_entity.dart](file:///c:/Users/정찬율/Documents/trae_projects/trading/lib/domain/entities/asset_entity.dart) — `AssetEntity` (id, name, category, currentPrice, symbol)
  - [portfolio_entity.dart](file:///c:/Users/정찬율/Documents/trae_projects/trading/lib/domain/entities/portfolio_entity.dart) — `PortfolioEntity` + `PortfolioItemEntity` (수량, 평균매수가)
- **Repositories (추상):** Data Layer가 구현할 인터페이스 정의 (확장용)
- **UseCases:** 단일 책임을 갖는 비즈니스 오퍼레이션 단위 (확장용)

### Data Layer

Domain의 Repository 인터페이스를 구현하며, 데이터 소스(원격/로컬)와의 상호작용을 담당합니다.

- **Models:** Entity와 1:1 매핑되며 JSON 직렬화 로직 포함
  - [asset_model.dart](file:///c:/Users/정찬율/Documents/trae_projects/trading/lib/data/models/asset_model.dart) — `fromJson` / `toJson`
  - [portfolio_model.dart](file:///c:/Users/정찬율/Documents/trae_projects/trading/lib/data/models/portfolio_model.dart) — 포트폴리오 직렬화
- **Repositories (구현):** 추상 Repository의 실제 구현체 (확장용)
- **DataSources:** REST API / GraphQL / Hive / SQLite 등과의 통신 (확장용)

### Presentation Layer

사용자 상호작용(UI)과 상태 관리를 담당합니다.

- **Navigation / Shell:**
  - [main_shell.dart](file:///c:/Users/정찬율/Documents/trae_projects/trading/lib/presentation/navigation/main_shell.dart) — `IndexedStack`으로 3개 페이지를 유지한 채 `BottomNavigationBar`로 전환합니다. 탭 상태가 초기화되지 않습니다.
- **Pages:**
  - [home_page.dart](file:///c:/Users/정찬율/Documents/trae_projects/trading/lib/presentation/pages/home/home_page.dart) — 홈 (시세 요약, 추천 자산 등 배치 예정)
  - [market_page.dart](file:///c:/Users/정찬율/Documents/trae_projects/trading/lib/presentation/pages/market/market_page.dart) — 마켓 (카테고리별 자산 목록, 검색, 필터 등 배치 예정)
  - [portfolio_page.dart](file:///c:/Users/정찬율/Documents/trae_projects/trading/lib/presentation/pages/portfolio/portfolio_page.dart) — 내 포트폴리오 (보유 자산, 수익률, 거래 내역 등 배치 예정)
- **Widgets:** 여러 페이지에서 재사용되는 공통 위젯 모음 (확장용)

## CI/CD (iOS 무서명 IPA 빌드)

[ios-build.yml](file:///c:/Users/정찬율/Documents/trae_projects/trading/.github/workflows/ios-build.yml)은 GitHub Actions를 통해 Apple Developer 계정이나 인증서 없이도 **무서명 IPA**를 자동 생성합니다.

### 주요 특징

- **러너:** `macos-14` (Apple Silicon M1/M2/M3 기반)
- **Flutter:** 3.19.0 stable, 캐시 활성화로 빌드 속도 최적화
- **Xcode:** 15.2 고정
- **빌드 옵션:** `flutter build ios --release --no-codesign`
- **패키징:** `Payload/Runner.app` → `app-unsigned.ipa` zip 생성
- **아티팩트:** GitHub Actions Artifacts로 30일간 보존

### 트리거 조건

- `main` / `develop` 브랜치로 push 시 자동 실행
- `main` 브랜치로 PR 생성 시 자동 실행
- 수동 실행 (`workflow_dispatch`) 지원

### 활용

1. GitHub 저장소에 코드를 push하면 자동으로 워크플로우가 실행됩니다.
2. 완료 후 `Actions` 탭 → 해당 워크플로우 런 → **Artifacts** 섹션에서 `ios-unsigned-ipa.zip`을 다운로드할 수 있습니다.
3. 무서명 IPA는 AltStore, Sideloadly 등으로 사이드로드 테스트하거나, 추후 별도 인증서로 리사인하여 App Store / TestFlight에 제출할 수 있습니다.

## 다음 단계

현재 뼈대를 확장할 예정인 항목들입니다:

- [ ] 상태 관리 라이브러리 도입 (Riverpod / Bloc 권장)
- [ ] Domain Layer: Repository 추상 인터페이스 정의
- [ ] Data Layer: Repository 구현 + REST API / WebSocket 데이터 소스 구현
- [ ] Presentation Layer: 각 페이지 UI 구현 + 상태 연결
- [ ] 거래 로직: 매수/매도 UseCase, 포트폴리오 재평가 로직
- [ ] 실제 시세 데이터 연동 (업비트, 빗썸, 한국투자증권 API 등)
- [ ] Android용 CI/CD 워크플로우 추가 (APK / App Bundle)
#   O p e n T r a d i n g  
 