
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:try_go_router/pages/base.dart';
import 'package:try_go_router/pages/home.dart';
import 'package:try_go_router/pages/home_detail.dart';
import 'package:try_go_router/pages/notification.dart';
import 'package:try_go_router/pages/settings.dart';
import 'package:try_go_router/pages/settings_detail.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'settings');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase> [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell){
        return ScaffoldWithNavBar(navigationShell: navigationShell,);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(child: HomePage()),
              routes: [
                GoRoute(
                  path: 'detail',
                  builder: (context, state) => const HomeDetailPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => const NoTransitionPage(child: SettingsPage()),
              routes: [
                GoRoute(
                  path: 'detail',
                  builder: (context, state) => const SettingsDetailPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/notification',
      pageBuilder: (context, state) => const MaterialPage(
        fullscreenDialog: true,
        child: NotificationPage()
      ),
    )
  ]
);