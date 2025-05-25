import 'package:get_it/get_it.dart';

import '../../../repository/provider/show_delete_payment/show_delte_payment_rep.dart';
import 'show_delete_and_paymnet_cubit.dart';

final sl = GetIt.instance;
Future<void> initSL() async {
  sl.registerLazySingleton<ShowDeleteAndPaymnetCubit>(
      () => ShowDeleteAndPaymnetCubit(showDeleteRepo: sl()));
  sl.registerLazySingleton<ShowDeleteRepo>(() => ShowDeleteRepo());
}
