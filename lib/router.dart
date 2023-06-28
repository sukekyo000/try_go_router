
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:try_go_router/bottom_nav_bar_base.dart';
import 'package:try_go_router/pages/home.dart';
import 'package:try_go_router/pages/home_detail.dart';
import 'package:try_go_router/pages/non_bottom_nav_bar.dart';
import 'package:try_go_router/pages/my_page.dart';
import 'package:try_go_router/pages/settings.dart';

import 'bottom_nav_bar_animation.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _myPageNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'my_page');

BottomNavBarAnimation bottomNavBarAnimation = BottomNavBarAnimation();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase> [
    /// ボトムナビゲーションバー有り
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
          navigatorKey: _myPageNavigatorKey,
          routes: [
            GoRoute(
              path: '/my_page',
              pageBuilder: (context, state) => const NoTransitionPage(child: MyPagePage()),
              routes: [
                GoRoute(
                  path: 'settings',
                  builder: (context, state) => const SettingsPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    /// ボトムナビゲーションバー無し
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/non_nav',
      pageBuilder: (context, state) => bottomNavBarAnimation.transitionWithBottomToUp(const NonBottomNavBarPage()),
    )
  ]
);