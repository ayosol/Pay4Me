import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/image_strings.dart';


SizedBox bottomNavBar(BuildContext context) {
  return SizedBox(
    height: kBottomNavigationBarHeight * 1.5,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
              decoration: BoxDecoration(
                color: AppColors.navItemColor,
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => print('Home Pressed'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(AssetImage(AppImages.home), size: 20),
                        Text('Home', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () => print('History Pressed'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(AssetImage(AppImages.history), size: 20),
                        Text('History', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 24),
            Container(
              height: 68,
              width: 68,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.navItemColor,
                borderRadius: BorderRadius.circular(1000),
              ),
              child: GestureDetector(
                onTap: () => print('More Pressed'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageIcon(AssetImage(AppImages.more), size: 18),
                    Text('More', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
