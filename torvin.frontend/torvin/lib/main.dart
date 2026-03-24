import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/app_theme.dart';

const _designSize = Size(390, 844);
const _pagePadding = EdgeInsets.all(20);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TorvinApp());
}

class TorvinApp extends StatelessWidget {
  const TorvinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: _designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: const _ThemePreviewPage(),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Torvin',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: child,
        );
      },
    );
  }
}

class _ThemePreviewPage extends StatelessWidget {
  const _ThemePreviewPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        title: const Text('Torvin'),
      ),
      body: SingleChildScrollView(
        padding: _pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Theme preview', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Primjeri dugmadi i osnovnih komponenti.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            const _ActiveButtonsSection(),
            const SizedBox(height: 16),
            const _ActionRow(),
            const SizedBox(height: 24),
            Text('Disabled state', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            const _DisabledButtonsSection(),
            const SizedBox(height: 24),
            Text('Chips', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            const _FeatureChipsSection(),
          ],
        ),
      ),
    );
  }
}

class _ActiveButtonsSection extends StatelessWidget {
  const _ActiveButtonsSection();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
        FilledButton(onPressed: () {}, child: const Text('Filled')),
        OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
        TextButton(onPressed: () {}, child: const Text('Text')),
      ],
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.send),
          label: const Text('Send money'),
        ),
      ],
    );
  }
}

class _DisabledButtonsSection extends StatelessWidget {
  const _DisabledButtonsSection();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: const [
        ElevatedButton(onPressed: null, child: Text('Elevated')),
        OutlinedButton(onPressed: null, child: Text('Outlined')),
        FilledButton(onPressed: null, child: Text('Filled')),
      ],
    );
  }
}

class _FeatureChipsSection extends StatelessWidget {
  const _FeatureChipsSection();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [
        Chip(label: Text('Wallet')),
        Chip(label: Text('Budget')),
        Chip(label: Text('Transactions')),
      ],
    );
  }
}
