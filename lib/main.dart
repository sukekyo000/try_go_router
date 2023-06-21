import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp.router(
    routerConfig: router,
  ));
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'a');
final GlobalKey<NavigatorState> _settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'b');

final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/a',
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
                path: '/a',
                builder: (context, state) => const HomePage(pageTitle: "A",),
                routes: [
                  GoRoute(
                    path: 'detail',
                    builder: (context, state) => const DetailPage(pageTitle: "A",),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingsNavigatorKey,
            routes: [
              GoRoute(
                path: '/b',
                builder: (context, state) => const HomePage(pageTitle: "B",),
                routes: [
                  GoRoute(
                    path: 'detail',
                    builder: (context, state) => const DetailPage(pageTitle: "B",),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ]
);

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section A'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Section B'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => navigationShell.goBranch(index),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.pageTitle,
  });
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("$pageTitle Home Page"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.push("/a/detail"),
                child: const Text("Move to A Detail Page"),
              ),
              ElevatedButton(
                onPressed: () => context.push("/b/detail"),
                child: const Text("Move to B Detail Page"),
              ),
            ]
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.pageTitle,
  });
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("$pageTitle Detail Page"),
      ),
    );
  }
}