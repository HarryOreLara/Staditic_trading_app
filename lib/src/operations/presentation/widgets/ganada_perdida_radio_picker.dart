import 'package:flutter/material.dart';

class GanadaPerdidaRadioPicker extends StatefulWidget {
  final Function(String)? onChanged;
  final String? errorMessage;
  const GanadaPerdidaRadioPicker({Key? key, this.onChanged, this.errorMessage})
      : super(key: key);

  @override
  State<GanadaPerdidaRadioPicker> createState() =>
      _GanadaPerdidaRadioPickerState();
}

class _GanadaPerdidaRadioPickerState extends State<GanadaPerdidaRadioPicker> {
  String? _selectedOption;

  Widget _buildListTile(String title, String value) {
    final textStyle = Theme.of(context).textTheme;
    return ListTile(
      title: InkWell(
        onTap: () {
          setState(() {
            _selectedOption = value;
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          });
        },
        child: Text(
          title,
          style: textStyle.labelMedium,
        ),
      ),
      leading: Radio(
        value: value,
        groupValue: _selectedOption,
        onChanged: (newValue) {
          setState(() {
            _selectedOption = newValue;
            if (widget.onChanged != null) {
              widget.onChanged!(_selectedOption!);
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildListTile("Ganada", "Ganada"),
        _buildListTile("Perdida", "Perdida"),
      ],
    );
  }
}
