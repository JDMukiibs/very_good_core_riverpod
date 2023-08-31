import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:{{project_name.snakeCase()}}/counter/counter.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const ProviderScope(child: CounterPage()));
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterView', () {
    testWidgets('renders 0 as initial count', (tester) async {
      const expected = 0;

      await tester.pumpApp(
        ProviderScope(
          overrides: [
            counterProvider.overrideWith((ref) => 0),
          ],
          child: const CounterView(),
        ),
      );

      expect(find.byType(CounterView), findsOneWidget);
      expect(find.text('$expected'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      const expected = 1;
      await tester.pumpApp(
        ProviderScope(
          overrides: [
            counterProvider.overrideWith((ref) => 0),
          ],
          child: const CounterView(),
        ),
      );

      expect(find.byType(CounterView), findsOneWidget);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('$expected'), findsOneWidget);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      const expected = -1;

      await tester.pumpApp(
        ProviderScope(
          overrides: [
            counterProvider.overrideWith((ref) => 0),
          ],
          child: const CounterView(),
        ),
      );

      expect(find.byType(CounterView), findsOneWidget);
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('$expected'), findsOneWidget);
    });
  });
}
