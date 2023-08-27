import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProviderLogger extends ProviderObserver {
  ProviderLogger(this.logger);

  final Logger logger;

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.d('''
      Added Provider
      {
        "provider": ${provider.name ?? provider.runtimeType},
        "value": $value 
      }
    ''');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    logger.w('''
      Disposed Provider
      {
        "provider": ${provider.name ?? provider.runtimeType},
        "containers": $container 
      }
    ''');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.d('''
      Updated Provider
      {
        "provider": ${provider.name ?? provider.runtimeType},
        "previousValue": $previousValue,
         "newValue": $newValue
      }
    ''');
  }

  @override
  void providerDidFail(
      ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.e('''
      Provider Failed!
      {
        "provider": ${provider.name ?? provider.runtimeType},
        "error": $error,
        "stackTrace": $stackTrace 
      }
    ''');
  }
}
