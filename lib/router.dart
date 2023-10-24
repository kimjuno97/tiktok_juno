import 'package:go_router/go_router.dart';

import 'features/authentication/email_screen.dart';
import 'features/authentication/login_screen.dart';
import 'features/authentication/sign_up_screen.dart';
import 'features/authentication/username_screen.dart';
import 'features/users/user_profile_screen.dart';

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
      name: UsernameScreen.routeName,
      path: UsernameScreen.routeURL,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      name: EmailScreen.routeName,
      path: EmailScreen.routeURL,
      builder: (context, state) {
        final args = state.extra as EmailScreenArgs;
        return EmailScreen(username: args.username);
      },
    ),
    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.pathParameters['username'];
        return UserProfileScreen(username: username!, tab: '');
      },
    )
  ],
);
