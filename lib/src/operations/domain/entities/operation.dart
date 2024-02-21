class Operation {
  final String mercado;
  final String fechaOperacion;
  final String horaOperacion;
  final bool isWin;
  final String monto;
  final String description;

  Operation(
      {required this.mercado,
      required this.fechaOperacion,
      required this.horaOperacion,
      required this.isWin,
      required this.monto,
      required this.description});
}
