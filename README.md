### flutter 초기세팅

https://docs.flutter.dev/get-started/install

### 브랜치 목록

다른 방법으로 구현한 코드는 branch로 분기하였습니다.

- interests_screen
  TabBarView로 구현한 예시로 아래의 commit과 분기 됨.

  `AnimatedCrossFade는 page가 2개일때 TabBarView보다 좋은 선택일 수도 있음.`

- BottomNavigationBar

  `BottomNavigationBar로 구현한 Navigate`

- m3NavigationBar

  `material 디자인 v3 Widget으로 구현한 Navigate Bar`
  https://m3.material.io/components/navigation-bar/overview

- globalKey

  `GlobalKey를 지정해줘야 서로 다른 Screen인것을 감지할 수 있다.`

- PageBuilder

  `PageView.builder로 최적화된 무한스크롤 구현 예시`

- videoPlayer

  `video_play package를 사용하여 videoPlayer 구현`

- VisibilityDetector

  `visibility_detector package를 사용하여 video play 제어하는 예시 코드`

- animationController

  `animationController과 Transform.scale로 애니메이션을 구현할 수있음.`

- animatedBuilder

  `animatedBuilder로 animation을 구현하면 animationController 커밋에서 사용했던 방법인 _animationController.addListener로 setState를 호출하지 않아도 된다.`

- RefreshIndicator

  `RefreshIndicator로 refresh function 구현`

- animationList

  `AnimatedList로 최상위로 2개의 애니메이션 추가하여 적용`

- CustomScrollView

  `CustomScrollView와 사용하는 Sliver Widget들 예시 코드`

- DefaultTabController

  `DefaultTabController로 TabBarView 구현 CustomScrollView도 사용`

- NestedScrollView

  `CustomScrollView + NestedScrollView로 tabBar 스크롤 시 tabBar상당에 고정하기`

- ListWheelScrollView

  `ListWheelScrollView 예시`

- OrientationBuilder

  `OrientationBuilder를 활용한 가로,세로 반응형도 대응가능하다`

- LayoutBuilder

  `LayoutBuilder를 활용하여 반응형 대응`

- darkMode

  `dark, white mode 반영 및 googleFont로 font입히기`

- material3

  `material3에서는 container로 BottomAppBar디자인`

- intl

  `서비스 국제화를 위한 intl 사용예시`

- flutter-intl-extension

  `Flutter Intl extension을 활용한 국제화`
  `Pluralize and Select 사용 예시`
  `Extract to ARB를 활용하면 arb파일로 자동으로 텍스트를 변수화 할 . 수 있다.`
  `arb파일에서 'when'을 활용하면 DateFormat도 가능하다.`

- InheritedWidget

  `InheritedWidget은 앱의 최상위에서 정의해서 하위 위젯에서 VideoConfig.of(context)로 접근할 수 있게 해준다`

- ChangeNotifier

  `ChangeNotifier를 사용하면 InheritedWidget를 썼을때보다 간단하게 value 공유 가능`

- ValueNotifier

  `ValueNotifier는 하나의 값을 전역으로 공유할때 사용한다. ValueListenableBuilder Widget으로 listener를 사용하지 않고 감지할 수 있다. `

- provider

  `provider를 활용하면 Class내부에서 listener를 사용하지 않고 context.watch<T>로 접근 가능`

- flutter_riverpod

  `flutter_riverpod api fetch, error, loading 처리코드 사용 예시를 볼 수 있다.`

### Flutter 참고하면 좋은 자료들

- [flutter widget of the w eek](https://youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&si=hqjynhQqFljGCVRm)
- [material 3](https://m3.material.io/)
- [flutter i18n](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization)
- [intl DateFormat](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html)

#### 커멘드 명령어

- l10n
  arb 의 내용을 추가할때마다 자동으로 연결되는 것이 아니라 regenerate 해주어야 한다.

```bash
lutter gen-l10n
```

- Flutter Intl (extension)
  1. `shift + p` 누르고 Flutter Intl: Initialize 찾아서 클릭 하면,
     generated폴더와 i10n폴더 생성됨
  2. 텍스트를 감싸고 `commend + .`을 눌러 Extract to ARB를 클릭하면 I10n의 arb파일에 변수화를 자동으로 할 수 있음.

#### intl_en.arb

`@SignUpTitle`로 주석을 추가할 수있음.

```arb
{
  "signUpTitle": "Sign up for {nameOfTheApp}",
  "@signUpTitle": {
    "description": "The title people see when they open the app for the first time.",
    "placeholders": {
      "nameOfTheApp": {
        "type": "String",
        "example": "TikTok"
      }
    }
  }
}
```
