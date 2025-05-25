import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'role_state.dart';

class RoleCubit extends Cubit<RoleState> {
  RoleCubit() : super(RoleInitial());
  static RoleCubit get(BuildContext context) => BlocProvider.of(context);

  bool isUser = true;

  saveRole(state) async {
    SharedPreferences prefService = await SharedPreferences.getInstance();
    prefService.setBool("isUser", state);
  }

  changeRole(state) {
    switch (state == true) {
      case true:
        isUser = state;
        saveRole(state);
        debugPrint("$state");
        emit(UserRoleState());
        break;
      case false:
        isUser = state;
        saveRole(state);
        debugPrint("$state");
        emit(ProviderRoleState());
        break;
    }
  }
}
