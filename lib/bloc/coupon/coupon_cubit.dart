import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user/coupons/coupon_data.dart';
import '../../repository/user/coupons/coupons_repository.dart';
import '../../widget/toast/toast.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  CouponCubit() : super(CouponInitial());
  CouponsRepository couponsRepository = CouponsRepository();

  static CouponCubit get(BuildContext context) => BlocProvider.of(context);
  final TextEditingController couponController = TextEditingController();

  getCoupon(String code) {
    if (couponController.text.isEmpty) {
      showToast(tr("error_message"));
    } else {
      couponsRepository.getCoupons(code).then((value) {
        emit(CouponLoaded(data: value.data));
      });
    }
  }
}
