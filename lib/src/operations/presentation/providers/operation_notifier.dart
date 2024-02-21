import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:staditic_trading_app/src/operations/domain/repositories/operation_repository_domain.dart';
import 'package:staditic_trading_app/src/operations/presentation/providers/operation_state.dart';
import 'package:staditic_trading_app/src/shared/infraestructure/inputs/inputs.dart';

class OperationNotifier extends StateNotifier<OperationState> {
  final OperationRepositoryDomain operationRepositoryDomain;
  OperationNotifier({required this.operationRepositoryDomain})
      : super(OperationState());

  createOperation() async {
    _touchEveryField();

  }

  _touchEveryField() {
    final description = Description.dirty(state.description.value);
    final monto = Monto.dirty(state.monto.value);

    state.copyWith(isFormPosted: true, monto: monto, description: description);
  }

  onDescriptionChange(String value) {
    final newDescription = Description.dirty(value);

    state = state.copyWith(
        description: newDescription,
        isValid: Formz.validate([newDescription, state.monto]));
  }

  onMontoChange(double value) {
    final newMonto = Monto.dirty(value);
    state = state.copyWith(
        monto: newMonto,
        isValid: Formz.validate([newMonto, state.description]));
  }
}
