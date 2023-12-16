import 'package:flutter/material.dart';
import 'package:tokoweb_test/constant/app_colors.dart';
import 'package:tokoweb_test/constant/app_text.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
  });

  final String title;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? AppColors.greyColor : AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            width: 1,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      child: Text(
        title,
        style: AppText.text14.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
