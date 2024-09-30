import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mail_list/core/di/di.dart';
import 'package:mail_list/core/theme/app_theme.dart';
import 'package:mail_list/presentation/main_app_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDi();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().light,
      darkTheme: AppTheme().light,
      home: const MainAppPage(),
    );
  }
}
