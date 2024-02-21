import 'package:formz/formz.dart';

// Define input validation errors
enum MercadoError { empty }

// Extend FormzInput and provide the input type and error type.
class Mercado extends FormzInput<String, MercadoError> {



  // Call super.pure to represent an unmodified form input.
  const Mercado.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Mercado.dirty( String value ) : super.dirty(value);



  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == MercadoError.empty ) return 'El campo es requerido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  MercadoError? validator(String value) {
    
    if ( value.isEmpty || value.trim().isEmpty ) return MercadoError.empty;

    return null;
  }
}