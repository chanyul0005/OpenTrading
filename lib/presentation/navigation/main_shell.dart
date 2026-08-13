import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/home/home_page.dart';
import '../pages/market/market_page.dart';
import '../pages/portfolio/portfolio_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    MarketPage(),
    PortfolioPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chart_bar),
            label: '마켓',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.briefcase),
            label: '내 포트폴리오',
          ),
        ],
      ),
    );
  }
}
