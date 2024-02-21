import 'package:flutter/material.dart';
import 'package:staditic_trading_app/config/helpers/human_formats.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = Radius.circular(15);
    final textStyle = Theme.of(context).textTheme;

    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0x85919191),
          borderRadius: const BorderRadius.only(
              topLeft: borderRadius,
              bottomLeft: borderRadius,
              topRight: borderRadius,
              bottomRight: borderRadius),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: TextButton.icon(
        onPressed: () {
          _selectDate(context);
        },
        style: const ButtonStyle(
          overlayColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 247, 242, 242)),
        ),
        icon: const Icon(
          Icons.calendar_month,
          color: Colors.white,
        ),
        label: Text(
          selectedDate == null
              ? "Fecha de operacion"
              : HumanFormats().convertirFecha(selectedDate!),
          style: textStyle.labelMedium,
        ),
      ),
    );
  }
}
