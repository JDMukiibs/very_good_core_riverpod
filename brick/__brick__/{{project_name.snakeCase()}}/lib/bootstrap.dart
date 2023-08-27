import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:{{project_name.snakeCase()}}/logging/logging.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Initialize logger
  final logger = Logger();
  final providerObserver = ProviderLogger(logger);

  FlutterError.onError = (errorDetails) {
    logger.e(
      'Crash occurred',
      error: errorDetails.exception,
      stackTrace: errorDetails.stack,
    );
  };

  // Add cross-flavor configuration here

  runApp(
    ProviderScope(
      observers: [
        providerObserver,
      ],
      child: await builder(),
    ),
  );
}
