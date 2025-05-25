import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitialState());
  static SliderCubit get(BuildContext context) => BlocProvider.of(context);
  double lowerValue = 100.0;
  double upperValue = 1000.0;
  RangeValues values =  const RangeValues(100, 1000);

  void setRangeValue(RangeValues rangeValues){
    values = rangeValues;
    emit(SliderInitialState());
  }

}
