import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:staditic_trading_app/src/operations/domain/repositories/operation_repository_domain.dart';
import 'package:staditic_trading_app/src/operations/presentation/providers/operation_state.dart';
import 'package:staditic_trading_app/src/shared/infraestructure/inputs/fecha_operacion.dart';
import 'package:staditic_trading_app/src/shared/infraestructure/inputs/ganada_perdida.dart';
import 'package:staditic_trading_app/src/shared/infraestructure/inputs/inputs.dart';
import 'package:staditic_trading_app/src/shared/infraestructure/inputs/monto_invertido.dart';

class OperationNotifier extends StateNotifier<OperationState> {
  final OperationRepositoryDomain operationRepositoryDomain;
  OperationNotifier({required this.operationRepositoryDomain})
      : super(OperationState());

  createOperation() async {
    _touchEveryField();

    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    
    print(state.montoInvertido);
  }

  _touchEveryField() {
    final description = Description.dirty(state.description.value);
    final montoDevuelto = MontoDevuelto.dirty(state.montoDevuelto.value);
    final horaOperacion = HoraOperacion.dirty(state.horaOperacion.value);
    final fechaOperacion = FechaOperacion.dirty(state.fechaOperacion.value);

    state.copyWith(
        isFormPosted: true,
        montoDevuelto: montoDevuelto,
        description: description,
        horaOperacion: horaOperacion,
        fechaOperacion: fechaOperacion);
  }

  onGanadaPerdida(String value) {
    final newGandaPerdida = GanadaPerdida.dirty(value);
    state = state.copyWith(
        ganadaPerdida: newGandaPerdida,
        isValid: Formz.validate([
          newGandaPerdida,
          state.mercado,
          state.fechaOperacion,
          state.horaOperacion,
          state.montoDevuelto,
          state.description
        ]));
  }

  onMercadoChange(String value) {
    final newMercado = Mercado.dirty(value);
    state = state.copyWith(
        mercado: newMercado,
        isValid: Formz.validate([
          newMercado,
          state.fechaOperacion,
          state.horaOperacion,
          state.montoDevuelto,
          state.description
        ]));
  }

  onFechaOperacionChange(String value) {
    final newFechaOperacion = FechaOperacion.dirty(value);
    state = state.copyWith(
        fechaOperacion: newFechaOperacion,
        isValid: Formz.validate([
          newFechaOperacion,
          state.description,
          state.montoDevuelto,
          state.horaOperacion,
        ]));
  }

  onHoraOperacionChange(String value) {
    final newHoraOperacion = HoraOperacion.dirty(value);
    state = state.copyWith(
        horaOperacion: newHoraOperacion,
        isValid: Formz.validate([
          newHoraOperacion,
          state.description,
          state.montoDevuelto,
          state.fechaOperacion
        ]));
  }

  onDescriptionChange(String value) {
    final newDescription = Description.dirty(value);
    state = state.copyWith(
        description: newDescription,
        isValid: Formz.validate([
          newDescription,
          state.montoDevuelto,
          state.horaOperacion,
          state.fechaOperacion
        ]));
  }

  onMontoDevueltoChange(double value) {
    final newMontoDevuelto = MontoDevuelto.dirty(value);
    state = state.copyWith(
        montoDevuelto: newMontoDevuelto,
        isValid: Formz.validate([
          newMontoDevuelto,
          state.description,
          state.horaOperacion,
          state.fechaOperacion
        ]));
  }

  onMontoInvertidoChange(double value) {
    final newMontoInvertido = MontoInvertido.dirty(value);
    state = state.copyWith(
        montoInvertido: newMontoInvertido,
        isValid: Formz.validate([
          newMontoInvertido,
          state.description,
          state.horaOperacion,
          state.fechaOperacion
        ]));
  }
}
