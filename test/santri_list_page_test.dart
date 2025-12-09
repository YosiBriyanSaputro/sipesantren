import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sipesantren/features/santri/presentation/santri_list_page.dart';

void main() {
  testWidgets('SantriListPage renders without overflow', (WidgetTester tester) async {
    // Set screen size to a common mobile width to test for overflow
    tester.view.physicalSize = const Size(400 * 3, 800 * 3); // 400 logical width
    tester.view.devicePixelRatio = 3.0;

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SantriListPage(),
        ),
      ),
    );

    // Verify the page title
    expect(find.text('Daftar Santri'), findsOneWidget);

    // Verify Dropdowns exist
    expect(find.text('Semua Kamar'), findsOneWidget);
    expect(find.text('Semua Angkatan'), findsOneWidget);

    // Check for overflow errors
    expect(tester.takeException(), isNull);

    // Reset view
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
