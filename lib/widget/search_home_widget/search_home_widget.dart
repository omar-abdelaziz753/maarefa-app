import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../layout/activity/user_screens/search/search.dart';
import '../../res/drawable/icon/icons.dart';
import '../../res/value/color/color.dart';
import '../../res/value/style/textstyles.dart';
import '../side_padding/side_padding.dart';

class SearchHomeWidget extends StatelessWidget {
  const SearchHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const SearchScreen()),
      child: SidePadding(
        sidePadding: 35.w,
        child: LimitedBox(
          maxHeight: 55.h,
          child: Container(
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: const [BoxShadow()]),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Image.asset(search, height: 20.h, fit: BoxFit.contain),
                ),
                const SizedBox(width: 10),
                Text(
                  tr("search_courses"),
                  style: TextStyles.hintStyle,
                ),
                const Spacer(),
                Container(
                  height: 55.h,
                  width: 55.w,
                  decoration: const BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(12),
                          bottomEnd: Radius.circular(12))),
                  child: Center(
                      child: Image.asset(filter,
                          color: mainColor, height: 20.h, fit: BoxFit.contain)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
