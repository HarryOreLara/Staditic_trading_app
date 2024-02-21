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

  OperationState(
      {this.isLoading = false,
      this.isValid = false,
      this.isFormPosted = false,
      this.isPosting = false,
      this.monto = const Monto.pure(),
      this.description = const Description.pure(),
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
    Description? description,
  }) =>
      OperationState(
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
        error: error ?? this.error,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isPosting: isPosting ?? this.isPosting,
        isValid: isValid ?? this.isValid,
        monto: monto ?? this.monto,
        description: description ?? this.description,
      );
}
