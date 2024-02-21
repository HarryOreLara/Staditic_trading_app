import 'package:staditic_trading_app/src/operations/domain/datasources/operation_datasource_domain.dart';
import 'package:staditic_trading_app/src/operations/domain/entities/operation.dart';
import 'package:staditic_trading_app/src/operations/domain/repositories/operation_repository_domain.dart';

class OperationRepositoryInfra extends OperationRepositoryDomain {
  final OperationDatasourceDomain operationDatasourceDomain;
  OperationRepositoryInfra(this.operationDatasourceDomain);

  @override
  Future<Operation> createOperation() {
    return operationDatasourceDomain.createOperation();
  }
}
