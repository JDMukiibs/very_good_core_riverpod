import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final loggingServiceProvider = Provider<LoggingService>(
  (ref) => LoggingService(
    logger: Logger(),
  ),
);

class LoggingService {
  LoggingService({required this.logger});

  final Logger logger;
}
