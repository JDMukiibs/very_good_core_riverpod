import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_core/app/app.dart';
import 'package:very_good_core/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: App(),
        ),
      );

      expect(find.byType(CounterPage), findsOneWidget);
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
