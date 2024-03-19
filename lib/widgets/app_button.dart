import 'package:flutter/material.dart';

import '../resources/color.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool isLoading;

  AppButton(
      {super.key,
      required this.onTap,
      this.text = "Sign In",
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? const Center(child: CircularProgressIndicator(color: AppColor.white,))
              : Text(
                  text,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
