
import 'package:flutter/material.dart';

class MercadoRadioPicker extends StatefulWidget {
  final Function(String)? onChanged;
  final String? errorMessage;
  const MercadoRadioPicker({Key? key, this.onChanged, this.errorMessage})
      : super(key: key);

  @override
  State<MercadoRadioPicker> createState() => _MercadoRadioPickerState();
}

class _MercadoRadioPickerState extends State<MercadoRadioPicker> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: Text(
                  'Forex',
                  style: textStyle.labelMedium,
                ),
                value: 'Forex',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                    if (widget.onChanged != null) {
                      widget.onChanged!(_selectedOption!);
                    }
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text(
                  'Cripto',
                  style: textStyle.labelMedium,
                ),
                value: 'Cripto',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                    if (widget.onChanged != null) {
                      widget.onChanged!(_selectedOption!);
                    }
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: Text(
                  'Acciones',
                  style: textStyle.labelMedium,
                ),
                value: 'Acciones',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                    if (widget.onChanged != null) {
                      widget.onChanged!(_selectedOption!);
                    }
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text(
                  'Materia \n Prima',
                  style: textStyle.labelMedium,
                ),
                value: 'Materia Prima',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                    if (widget.onChanged != null) {
                      widget.onChanged!(_selectedOption!);
                    }
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: Text(
                  'Indices',
                  style: textStyle.labelMedium,
                ),
                value: 'Indices',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                    if (widget.onChanged != null) {
                      widget.onChanged!(_selectedOption!);
                    }
                  });
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text(
                  'Futuros',
                  style: textStyle.labelMedium,
                ),
                value: 'Futuros',
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                    if (widget.onChanged != null) {
                      widget.onChanged!(_selectedOption!);
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
