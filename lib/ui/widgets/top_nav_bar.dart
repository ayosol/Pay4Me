import 'package:flutter/material.dart';
import 'package:pay4me/core/utils/image_strings.dart';

import '../../core/theme/app_colors.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.width > 600 ? 100 : 70,
      title: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(AppImages.profile),
                radius: 30,
              ),
              SizedBox(width: 10),
              Container(
                height: 42,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.navItemColor,
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => {},
                      icon: ImageIcon(AssetImage(AppImages.home), size: 20),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.chatColor,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: IconButton(
                        onPressed: () => {},
                        icon: ImageIcon(
                          AssetImage(AppImages.chat),
                          color: AppColors.whiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: IconButton(
                    icon: ImageIcon(
                      AssetImage(AppImages.wallet),
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                    onPressed: () => print('Wallet Pressed'),
                  ),
                ),
                IconButton(
                  icon: ImageIcon(
                    AssetImage(AppImages.notification),
                    color: AppColors.blackColor,
                    size: 22,
                  ),
                  onPressed: () => print('Notification Pressed'),
                ),
                SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ],
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
