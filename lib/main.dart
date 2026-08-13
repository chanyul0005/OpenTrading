import 'package:flutter/material.dart';
import 'presentation/navigation/main_shell.dart';

void main() {
  runApp(const TradingApp());
}

class TradingApp extends StatelessWidget {
  const TradingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '종합 자산 모의투자',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainShell(),
    );
  }
}
