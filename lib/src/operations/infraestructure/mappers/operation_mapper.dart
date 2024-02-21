import 'package:staditic_trading_app/core/utils/typedef.dart';
import 'package:staditic_trading_app/src/operations/domain/entities/operation.dart';

class OperationMapper {
  static jsonToEntity(DataMap json) => Operation(
      mercado: json['mercado'],
      fechaOperacion: json['fechaOperacion'],
      horaOperacion: json['horaOperacion'],
      isWin: json['isWin'],
      monto: json['monto'],
      description: json['description']);
}
