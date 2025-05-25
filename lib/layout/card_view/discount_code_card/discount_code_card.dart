import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_academy/bloc/coupon/coupon_cubit.dart';
import 'package:my_academy/widget/space/space.dart';

import '../../../res/value/color/color.dart';
import '../../../res/value/dimenssion/dimenssions.dart';
import '../../../res/value/style/textstyles.dart';

class DiscountCodeCard extends StatelessWidget {
  const DiscountCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 80.h,
      decoration: BoxDecoration(
        color: discountCardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => CouponCubit(),
          child: BlocConsumer<CouponCubit, CouponState>(
            listener: (context, state) {},
            builder: (context, state) {
              final bloc = CouponCubit.get(context);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: bloc.couponController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: tr("discount_code"),
                        // tr("enter_code"),
                        hintStyle:
                            TextStyles.hintStyle.copyWith(color: mainColor),
                        // label:  Text(
                        //   tr("discount_code"),
                        //   style: TextStyles.hintStyle.copyWith(color: mainColor),
                        // ),
                      ),
                    ),
                  ),
                  const Space(
                    boxWidth: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      bloc.getCoupon(bloc.couponController.text);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: white,
                        size: 40,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
