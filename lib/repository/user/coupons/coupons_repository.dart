import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/user/coupons/check_coupon_db_response.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class CouponsRepository {
  getCoupons(
    String code,
  ) async {
    try {
      return await DioService()
          .post('/clients/coupons/checkCoupon?code=$code')
          .then((value) {
            return value.fold((l) => showToast(l.toString()), (r) async{
                CheckCouponDbResponse couponsModel =
                    CheckCouponDbResponse.fromJson(r);
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('couponDiscount', r['data']['discount']);
                return couponsModel;
              });
          });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
