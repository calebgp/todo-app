import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.hint,
  });
  final String label;
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(15.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(
            color: Colors.black,
          ),
          maxLines: null,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: borderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: borderRadius,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: borderRadius,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
