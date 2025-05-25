import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_academy/repository/user/all_requests/all_requests_repository.dart';
import '../../model/user/lesson_requests/lesson_requests_model.dart';
import '../../model/user/request_details/request_details_model.dart';
part 'all_requests_state.dart';

class AllRequestsCubit extends Cubit<AllRequestsState> {
  AllRequestsCubit(this.allRequestsRepository) : super(AllRequestsInitial());
  AllRequestsRepository allRequestsRepository;

  getCourseRequests() {
    allRequestsRepository.coursesRequests().then((value) {
      emit(CourseRequestsLoadedState(data: value.data.requests));
    });
  }

  getCourseRequestsCache() {
    allRequestsRepository.coursesRequestsCache().then((value) {
      emit(CourseRequestsLoadedState(data: value.data.requests));
    });
  }

  getLessonRequests() {
    allRequestsRepository.lessonsRequests().then((value) {
      emit(LessonRequestsLoadedState(data: value.data.requests));
    });
  }

  getLessonRequestsCache() {
    allRequestsRepository.lessonsRequestsCache().then((value) {
      emit(LessonRequestsLoadedState(data: value.data.requests));
    });
  }

  String getStatus(String status) {
    if (status == '1') {
      return tr("pending");
    } else if (status == '2') {
      return tr("accepted");
    } else if (status == '3') {
      return tr("rejected");
    } else if (status == '4') {
      return tr("paid");
    }
    return tr("unknown");
  }

  String getAttendanceType(String status) {
    if (status == '1') {
      return tr("offline");
    } else if (status == '2') {
      return tr("live");
    } else if (status == '3') {
      return tr("online");
    }
    // else if (status == '4') {
    //   return 'Paid ';
    // }
    // return tr("unknown");
    return 'Online';
  }
}
