import 'package:formz/formz.dart';

// Define input validation errors
enum GanadaPerdidaError { empty }

// Extend FormzInput and provide the input type and error type.
class GanadaPerdida extends FormzInput<String, GanadaPerdidaError> {



  // Call super.pure to represent an unmodified form input.
  const GanadaPerdida.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const GanadaPerdida.dirty( String value ) : super.dirty(value);



  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == GanadaPerdidaError.empty ) return 'El campo es requerido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  GanadaPerdidaError? validator(String value) {
    
    if ( value.isEmpty || value.trim().isEmpty ) return GanadaPerdidaError.empty;

    return null;
  }
}