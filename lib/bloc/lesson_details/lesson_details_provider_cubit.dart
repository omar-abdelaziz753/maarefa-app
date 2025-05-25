import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_academy/model/common/lessons/lesson_model.dart';
import '../../layout/activity/provider_screens/main/main_screen.dart';
import '../../repository/provider/lesson_details/lesson_details_repository.dart';
part 'lesson_details_provider_state.dart';

class LessonDetailsProviderCubit extends Cubit<LessonDetailsProviderState> {
  LessonDetailsProviderCubit(
      {required this.lessonDetailsProviderRepository, required this.id})
      : super(LessonDetailsProviderInitial());
  LessonDetailsProviderRepository lessonDetailsProviderRepository;
  static LessonDetailsProviderCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final int id;

  getLessonDetails() async {
    lessonDetailsProviderRepository.getLessonDetails(id).then((value) {
      emit(LessonDetailsLoadedState(data: value.data));
    });
  }

  deleteLesson(int id) {
    lessonDetailsProviderRepository.deleteLesson(id).then((value) {
      Get.offAll(() => const ProviderMainScreen());
      emit(LessonDeleteState());
    });
  }
}
