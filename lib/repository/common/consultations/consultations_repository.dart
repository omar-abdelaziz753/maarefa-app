// import 'package:flutter/cupertino.dart';
// import '../../../service/network/dio/dio_service.dart';
// import '../../../widget/toast/toast.dart';
//
// class ConsultationsRepository {
//   getConsultations() async {
//     try {
//       return await DioService()
//           .get('/consultation-fields')
//           .then((value) => value.fold((l) => showToast(l), (r) {
//         ConsultationsDbResponse consultations =
//         ConsultationsDbResponse.fromJson(r);
//         return consultations;
//       }));
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }
// }
