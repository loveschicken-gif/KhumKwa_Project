
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khum_kwa/core/router/router.dart';
import 'package:khum_kwa/core/theme/app_theme.dart';
import 'package:khum_kwa/features/compare/models/product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductUnitAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(ComparisonHistoryAdapter());
  await Hive.openBox<ComparisonHistory>('history_box');
  runApp(const ProviderScope(child: KhumKwaApp()));
}

class KhumKwaApp extends ConsumerWidget {
  const KhumKwaApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'คุ้มกว่า',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
