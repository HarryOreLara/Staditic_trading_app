import 'package:staditic_trading_app/src/shared/infraestructure/inputs/fecha_operacion.dart';
import 'package:staditic_trading_app/src/shared/infraestructure/inputs/ganada_perdida.dart';
import 'package:staditic_trading_app/src/shared/infraestructure/inputs/inputs.dart';

class OperationState {
  final bool isLoading;
  final bool isFormPosted;
  final bool isPosting;
  final bool isSaving;
  final String error;
  final bool isValid;
  final Monto monto;
  final Description description;
  final HoraOperacion horaOperacion;
  final FechaOperacion fechaOperacion;
  final Mercado mercado;
  final GanadaPerdida ganadaPerdida;

  OperationState(
      {this.isLoading = false,
      this.isValid = false,
      this.isFormPosted = false,
      this.isPosting = false,
      this.horaOperacion = const HoraOperacion.pure(),
      this.monto = const Monto.pure(),
      this.description = const Description.pure(),
      this.fechaOperacion = const FechaOperacion.pure(),
      this.mercado = const Mercado.pure(),
      this.ganadaPerdida = const GanadaPerdida.pure(),
      this.isSaving = false,
      this.error = ""});

  OperationState copyWith({
    bool? isLoading,
    bool? isSaving,
    bool? isFormPosted,
    bool? isPosting,
    String? error,
    bool? isValid,
    Monto? monto,
    HoraOperacion? horaOperacion,
    FechaOperacion? fechaOperacion,
    Mercado? mercado,
    GanadaPerdida? ganadaPerdida,
    Description? description,
  }) =>
      OperationState(
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
        error: error ?? this.error,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        isValid: isValid ?? this.isValid,
        horaOperacion: horaOperacion ?? this.horaOperacion,
        fechaOperacion: fechaOperacion ?? this.fechaOperacion,
        monto: monto ?? this.monto,
        mercado: mercado ?? this.mercado,
        ganadaPerdida: ganadaPerdida ?? this.ganadaPerdida,
        description: description ?? this.description,
      );
}
