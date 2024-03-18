import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final String? Function(dynamic value)? validator;
  final void Function(dynamic value)? onSaved;

  const MyTextField({
    Key? key,
    required this.labelText,
    required this.obscureText,
    required this.validator,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 151, 172, 239),
            ),
          ),
          labelText: labelText,
        ),
        validator: validator,
        onSaved: onSaved != null
            ? (value) {
                if (onSaved != null) {
                  onSaved!(value);
                }
              }
            : null,
      ),
    );
  }
}
