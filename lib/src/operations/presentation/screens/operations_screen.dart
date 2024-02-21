import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:staditic_trading_app/src/operations/presentation/providers/operation_provider.dart';
import 'package:staditic_trading_app/src/operations/presentation/widgets/widgets.dart';
import 'package:staditic_trading_app/src/shared/widgets/widgets_shared.dart';

class OperationsScreen extends StatelessWidget {
  const OperationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    final appStyle = Theme.of(context).appBarTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registrar operacion",
          style: appStyle.titleTextStyle,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
            onPressed: () {
              context.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: _OperationForm(textStyle: textStyle, size: size),
      ),
    );
  }
}

class _OperationForm extends ConsumerWidget {
  const _OperationForm({
    required this.textStyle,
    required this.size,
  });

  final TextTheme textStyle;
  final Size size;

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final operationForm = ref.watch(operationProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          MercadoRadioPicker(
            onChanged: (value) =>
                ref.read(operationProvider.notifier).onMercadoChange(value),
          ),
          const SizedBox(
            height: 22.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.43,
                child: CustomTimePicker(
                  onChanged: (value) => ref
                      .read(operationProvider.notifier)
                      .onHoraOperacionChange(value),
                  errorMessage: !operationForm.isFormPosted
                      ? operationForm.horaOperacion.errorMessage
                      : null,
                ),
              ),
              SizedBox(
                width: size.width * 0.43,
                child: CustomDatePicker(
                  onChanged: (value) => ref
                      .read(operationProvider.notifier)
                      .onFechaOperacionChange(value),
                  errorMessage: !operationForm.isFormPosted
                      ? operationForm.fechaOperacion.errorMessage
                      : null,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          const Divider(),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: size.width * 0.50,
                  child: GanadaPerdidaRadioPicker(
                    onChanged: (value) => ref
                        .read(operationProvider.notifier)
                        .onGanadaPerdida(value),
                  )),
              SizedBox(
                width: size.width * 0.40,
                child: CustomTextFormField(
                  label: "00.00",
                  keyboardType: TextInputType.number,
                  onChanged: (value) => ref
                      .read(operationProvider.notifier)
                      .onMontoChange(double.tryParse(value) ?? -1),
                  errorMessage: !operationForm.isFormPosted
                      ? operationForm.monto.errorMessage
                      : null,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),
          const Divider(),
          const SizedBox(
            height: 40.0,
          ),
          CustomTextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            height: 200.0,
            onChanged: (value) =>
                ref.read(operationProvider.notifier).onDescriptionChange(value),
            errorMessage: !operationForm.isFormPosted
                ? operationForm.description.errorMessage
                : null,
            label: "Por que operaste?..",
          ),
          const SizedBox(height: 30),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                text: 'Ingresar',
                buttonColor: Colors.white,
                onPressed: operationForm.isPosting
                    ? null
                    : ref.read(operationProvider.notifier).createOperation,
              )),
          const SizedBox(
            height: 25.0,
          )
        ],
      ),
    );
  }
}
