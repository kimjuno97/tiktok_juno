### flutter 초기세팅

https://docs.flutter.dev/get-started/install

### 브랜치 목록

다른 방법으로 구현한 코드는 branch로 분기하였습니다.

- interests_screen
  TabBarView로 구현한 예시로 아래의 commit과 분기 됨 :
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
