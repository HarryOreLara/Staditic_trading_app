import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:staditic_trading_app/src/operations/presentation/providers/operation_provider.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                    Text(
                      'Forex',
                      style: textStyle.labelMedium,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                    Text(
                      'Cripto',
                      style: textStyle.labelMedium,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                    Text('Acciones', style: textStyle.labelMedium)
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                    Text(
                      'Materia \n Prima',
                      style: textStyle.labelMedium,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                    Text(
                      'Indices',
                      style: textStyle.labelMedium,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                    Text(
                      'Futuros',
                      style: textStyle.labelMedium,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 22.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.43,
                child: const CustomTimePicker(),
              ),
              SizedBox(
                width: size.width * 0.43,
                child: const CustomDatePicker(),
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
              Column(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 1, groupValue: 'null', onChanged: (index) {}),
                      Text(
                        'Ganada',
                        style: textStyle.labelMedium,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 1, groupValue: 'null', onChanged: (index) {}),
                      Text(
                        'Perdida',
                        style: textStyle.labelMedium,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.50,
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
        ],
      ),
    );
  }
}
