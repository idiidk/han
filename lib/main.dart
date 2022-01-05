import 'package:flutter/material.dart';
import 'package:han/stores/xedule_store.dart';
import 'package:han/view/pages/home_page.dart';
import 'package:han/view/pages/onboarding_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<XeduleStore>(create: (_) => XeduleStore()),
      ],
      child: MaterialApp(
        title: 'Han',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Lexend',
          primaryColor: const Color(0xFF7CA0FE),
          scaffoldBackgroundColor: const Color(0xFF191720),
        ),
        initialRoute: '/onboarding',
        routes: {
          '/': (context) => const HomePage(),
          '/onboarding': (context) => const OnboardingPage(),
        },
      ),
    );
  }
}
