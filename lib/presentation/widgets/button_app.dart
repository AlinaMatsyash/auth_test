import 'package:flutter/cupertino.dart';
import 'package:test_auth/res/assets/colors.gen.dart';
import 'package:test_auth/theme/app_typography.dart';

class ButtonApp extends StatelessWidget {
  ButtonApp({required this.text, required this.onTap, super.key});

  String text;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: MediaQuery.of(context).size.width - 32,
      child: CupertinoButton(
        onPressed: onTap,
        color: ColorName.blue,
        child: Text(
          text,
          style:
              AppTypography.manropeBold16.copyWith(color: ColorName.white),
        ),
      ),
    );
  }
}
