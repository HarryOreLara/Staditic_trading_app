import 'package:staditic_trading_app/src/operations/domain/entities/operation.dart';

abstract class OperationRepositoryDomain{
  Future<Operation> createOperation();
}