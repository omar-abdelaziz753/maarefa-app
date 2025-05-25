import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/common/cities/city_model.dart';
import '../../repository/common/cities/cities_repository.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit(this.citiesRepository) : super(CitiesInitial());
  static CitiesCubit get(BuildContext context) => BlocProvider.of(context);
  CitiesRepository citiesRepository;
  CityModel? city;
  String? cityName;
  int? cityId;

  getCitiesInSplash() {
    citiesRepository.getCitiesInSplash().then((value) {
      emit(AuthCityLoadedState(data: value.data));
    });
  }

  getCities() {
    citiesRepository.getCities().then((value) {
      if (value == null) {
        getCitiesInSplash();
      } else {
        emit(AuthCityLoadedState(data: value.data));
      }
    });
  }

  chooseCity(val) {
    switch (city == val) {
      case true:
        city = val;
        cityName = val.name;
        cityId = val.id;
        emit(SameCityState());
        break;
      case false:
        city = val;
        cityName = val.name;
        cityId = val.id;
        emit(ChangeCityState());
        break;
    }
    emit(ChooseCityState());
  }
}
