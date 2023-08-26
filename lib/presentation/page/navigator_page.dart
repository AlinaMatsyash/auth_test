import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_auth/presentation/page/profile_page.dart';
import 'package:test_auth/res/assets/assets.gen.dart';
import 'package:test_auth/res/assets/colors.gen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Color(0xff4631D2),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Assets.icons.lenta.svg(
                color: _selectedIndex == 0 ? ColorName.blue : ColorName.black),
            label: 'Лента',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.map.svg(
                color: _selectedIndex == 1 ? ColorName.blue : ColorName.black),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.like.svg(
                color: _selectedIndex == 2 ? ColorName.blue : ColorName.black),
            label: 'Избранные',
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.profile.svg(
                color: _selectedIndex == 3 ? ColorName.blue : ColorName.black),
            label: 'Избранные',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Stack(children: [
              _buildOffstageNavigator(index),
            ]);
          },
        );
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          Text(''),
          Text(''),
          Text(''),
          ProfilePage(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return CupertinoPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
