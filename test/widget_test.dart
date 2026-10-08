import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tilawa/app/app.dart';

void main() {
  testWidgets('Tilawa app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: TilawaApp()));

    await tester.pumpAndSettle();

    expect(find.text('Tilawa'), findsWidgets);
  });
}
