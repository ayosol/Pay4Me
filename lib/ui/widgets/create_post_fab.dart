import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/image_strings.dart';

class CreatePostFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const CreatePostFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.greenColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
      elevation: 8,
      onPressed: () => onPressed(),
      child: ImageIcon(
        AssetImage(AppImages.edit),
        color: AppColors.whiteColor,
        size: 28,
      ),
    );
  }
}
