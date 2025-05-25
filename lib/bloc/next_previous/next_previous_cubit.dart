import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'next_previous_state.dart';

class NextPreviousCubit extends Cubit<NextPreviousState> {
  NextPreviousCubit() : super(NextPreviousInitial());
  static NextPreviousCubit get(BuildContext context) =>
      BlocProvider.of(context);

  List<String> typeListAr = ["الكل", "حضوري", "أونلاين", "مباشر"];
  List<String> typeListEn = ["All", "Offline", "Online", "Live"];
}
