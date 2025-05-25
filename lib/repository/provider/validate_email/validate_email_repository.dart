import 'package:flutter/cupertino.dart';

import '../../../model/provider/validate_email/validate_email_db_response.dart';
import '../../../service/network/dio/dio_service.dart';
import '../../../widget/toast/toast.dart';

class ValidateEmailProviderRepository {
  validateEmail() async {
    try {
      return await DioService()
          .get('/provider/auth/validate')
          .then((value) => value.fold((l) => showToast(l), (r) {
        ValidateEmailDbResponse validateEmail =
        ValidateEmailDbResponse.fromJson(r);
        return validateEmail;
      }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
