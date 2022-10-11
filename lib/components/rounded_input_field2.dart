import 'package:flutter/material.dart';
import 'package:medicament_project/components/text_field_container2.dart';
import 'package:medicament_project/constants.dart';

class RoundedInputField2 extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField2({
    Key key,
    this.hintText,
    this.icon = Icons.local_pharmacy,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer2(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.blue,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
