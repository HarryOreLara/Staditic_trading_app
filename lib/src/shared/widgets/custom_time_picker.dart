import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  final Function(String)? onChanged;
  final String? errorMessage;
  const CustomTimePicker({super.key, this.onChanged, this.errorMessage});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay? selectedHoraInicio;
  bool isHoraInicioSelected = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    const borderRadius = Radius.circular(15);

    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0x85919191),
          borderRadius: const BorderRadius.only(
              topLeft: borderRadius,
              topRight: borderRadius,
              bottomLeft: borderRadius,
              bottomRight: borderRadius),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: TextButton.icon(
        onPressed: () async {
          final newTime = await showTimePicker(
            context: context,
            initialEntryMode: TimePickerEntryMode.input,
            initialTime: selectedHoraInicio ?? TimeOfDay.now(),
          );

          if (newTime != null && newTime != selectedHoraInicio) {
            setState(() {
              selectedHoraInicio = newTime;
              widget.onChanged!(selectedHoraInicio.toString());
              isHoraInicioSelected = true;
            });
          }
        },
        style: const ButtonStyle(
          overlayColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 247, 242, 242)),
        ),
        icon: const Icon(
          Icons.timer_outlined,
          color: Colors.white,
        ),
        label: Text(
          isHoraInicioSelected
              ? selectedHoraInicio!.format(context)
              : 'Hora programacion',
          style: textStyle.labelMedium,
        ),
      ),
    );
  }
}
