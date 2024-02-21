import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staditic_trading_app/src/auth/presentation/presentacion.dart';
import 'package:staditic_trading_app/src/operations/domain/domain.dart';
import 'package:staditic_trading_app/src/operations/infraestructure/datasources/operation_datasource_infra.dart';
import 'package:staditic_trading_app/src/operations/infraestructure/repositories/operation_repository_infra.dart';

final operationRepositoryProvider = Provider<OperationRepositoryDomain>((ref) {
  final accesToken = ref.watch(authProvider).user?.token ?? '';
  final operationRepository = OperationRepositoryInfra(
      OperationDatasourceInfra(accesToken: accesToken));
  return operationRepository;
});
