import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../layout/activity/role/role_screen.dart';
import '../../res/drawable/image/images.dart';
import '../../service/local/share_prefs_service.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());
  static IntroCubit get(BuildContext context) => BlocProvider.of(context);
  SharedPrefService pref = SharedPrefService();
  List<String> imageIntro = [intro1, intro2];
  List<String> subjectIntroAr = [
    "مع تطبيق معرفة يوجد شرح للمنهج الدراسي وتتوفر جميع المقررات في جميع المراحل الدراسية المتنوعة بأفضل طريقة ممكنة",
    "يتوفر دورات في جميع الموضوعات المتنوعة في جميع المجالات وتحت اشراف افضل المدرسين والمحاضرين",
  ];

  List<String> subjectIntroEn = [
    "With the Maarefa application, there is an explanation of the curriculum, and all courses are available in all the various academic levels in the best possible way",
    "Courses are available on all diverse topics in all fields and under the supervision of the best teachers and lecturers",
  ];
  List<String> titleIntroAr = ["أهلا بك في تطبيق معرفة", "دورات تدريبية؟"];
  List<String> titleIntroEn = [
    "Welcome to the Maarefa application",
    "Training courses?"
  ];
  int intro = 0;
  double percent = 1 / 2;

  changeIntro(state) {
    pref.setBool("seen", true);
    if (state < imageIntro.length - 1) {
      intro++;
      percent = percent == 1 ? 1 : percent + 1 / 2;
      emit(ChangeIntroState());
    } else {
      Get.offAll(() => const RoleScreen());
      emit(StartAppState());
    }
  }

  scrollIntro(state) {
    intro = state;
    emit(ChangeIntroScrollState());
  }
}
