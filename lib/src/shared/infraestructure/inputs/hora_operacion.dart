import 'package:formz/formz.dart';

// Define input validation errors
enum HoraOperacionError { empty }

// Extend FormzInput and provide the input type and error type.
class HoraOperacion extends FormzInput<String, HoraOperacionError> {



  // Call super.pure to represent an unmodified form input.
  const HoraOperacion.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const HoraOperacion.dirty( String value ) : super.dirty(value);



  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == HoraOperacionError.empty ) return 'El campo es requerido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  HoraOperacionError? validator(String value) {
    
    if ( value.isEmpty || value.trim().isEmpty ) return HoraOperacionError.empty;

    return null;
  }
}