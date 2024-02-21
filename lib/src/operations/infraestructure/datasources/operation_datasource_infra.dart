import 'package:dio/dio.dart';
import 'package:staditic_trading_app/config/constants/enviroment.dart';
import 'package:staditic_trading_app/src/operations/domain/datasources/operation_datasource_domain.dart';
import 'package:staditic_trading_app/src/operations/domain/entities/operation.dart';

class OperationDatasourceInfra extends OperationDatasourceDomain {
  late final Dio dio;
  final String accesToken;

  OperationDatasourceInfra({required this.accesToken})
      : dio = Dio(BaseOptions(
            baseUrl: Enviroment.apiUrlAuth,
            headers: {'Authorization': 'Bearer $accesToken'}));

  @override
  Future<Operation> createOperation() {
    // TODO: implement createOperation
    throw UnimplementedError();
  }
}
