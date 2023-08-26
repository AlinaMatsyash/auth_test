import 'package:flutter/material.dart';
import 'package:test_auth/res/assets/colors.gen.dart';
import 'package:test_auth/theme/app_typography.dart';

class AuthField extends StatefulWidget {
  const AuthField(
      {Key? key,
      this.validator,
      this.initialValue = '',
      this.hintText = '',
      required this.controller})
      : super(key: key);

  final String? Function(String?)? validator;
  final String initialValue;
  final String hintText;
  final TextEditingController controller;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: AppTypography.manropeRegular16.copyWith(color: ColorName.black),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle:
            AppTypography.manropeRegular16.copyWith(color: ColorName.textIcon),
        focusedErrorBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      validator: widget.validator,
    );
  }
}
