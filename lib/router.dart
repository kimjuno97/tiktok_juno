import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'common/widgets/main_navigation/main_navigation_screen.dart';
import 'features/authentication/login_screen.dart';
import 'features/authentication/sign_up_screen.dart';
import 'features/inbox/activity_screen.dart';
import 'features/inbox/chat_detail_screen.dart';
import 'features/inbox/chats_screen.dart';
import 'features/onbording/interests_screen.dart';
import 'features/videos/views/vide_recording_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeURL,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestsScreen.routeName,
      path: InterestsScreen.routeURL,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      name: ActivityScreen.routeName,
      path: ActivityScreen.routeURL,
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
      name: ChatsScreen.routeName,
      path: ChatsScreen.routeURL,
      builder: (context, state) => const ChatsScreen(),
      routes: [
        GoRoute(
          name: ChatDetailScreen.routeName,
          path: ChatDetailScreen.routeURL,
          builder: (context, state) {
            final chatId = state.pathParameters["chatId"]!;
            return ChatDetailScreen(
              chatId: chatId,
            );
          },
        )
      ],
    ),
    GoRoute(
      path: VideoRecordingScreen.routeURL,
      name: VideoRecordingScreen.routeName,
      // 페이지 아래서 위로 올라오는 애니메이션
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        child: const VideoRecordingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final position = Tween(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: position,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: "/:tab",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
  ],
);
