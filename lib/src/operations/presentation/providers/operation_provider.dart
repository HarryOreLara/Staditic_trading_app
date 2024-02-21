import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staditic_trading_app/src/operations/presentation/providers/operation_notifier.dart';
import 'package:staditic_trading_app/src/operations/presentation/providers/operation_repository_provider.dart';
import 'package:staditic_trading_app/src/operations/presentation/providers/operation_state.dart';

final operationProvider =
    StateNotifierProvider<OperationNotifier, OperationState>((ref) {
  final operationRepositoryDomain = ref.watch(operationRepositoryProvider);
  return OperationNotifier(
      operationRepositoryDomain: operationRepositoryDomain);
});
