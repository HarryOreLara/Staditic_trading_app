import 'package:intl/intl.dart';

class HumanFormats {
  List<String> nombresMeses = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  String convertirFecha(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String fechaViaje(DateTime dateTime) {
    int dia = dateTime.day;
    int mes = dateTime.month;
    int anio = dateTime.year;

    String fechaFormateada = '$dia de ${nombresMeses[mes - 1]}, $anio';
    return fechaFormateada;
  }

  String horaViaje(DateTime dateTime) {
    String horaFormateada = DateFormat.jm().format(dateTime);

    return horaFormateada;
  }

  String diferenciaHoras(String fechaInicioString, String fechaFinString) {
    // Parsea las cadenas de fecha a objetos DateTime
    DateTime fechaInicio = DateTime.parse(fechaInicioString);
    DateTime fechaFin = DateTime.parse(fechaFinString);

    // Calcula la diferencia de tiempo entre las dos fechas
    Duration diferencia = fechaFin.difference(fechaInicio);

    // Obtiene las horas y minutos de la diferencia
    int horas = diferencia.inHours;
    int minutos = diferencia.inMinutes % 60;

    // Formatea la diferencia en el formato deseado
    String diferenciaFormateada = '$horas h y $minutos min';

    return diferenciaFormateada;
  }
}
