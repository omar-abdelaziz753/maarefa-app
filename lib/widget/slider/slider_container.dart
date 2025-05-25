import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_academy/res/value/color/color.dart';

import '../../bloc/slider_filter/slider_cubit.dart';

class SliderContainer extends StatelessWidget {
  const SliderContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => SliderCubit(),
    child: BlocConsumer<SliderCubit,SliderState>(
      listener: (context,state) {},
      builder: (context,state) {
        final bloc = SliderCubit.get(context);
        return RangeSlider(
          min: bloc.lowerValue,
          max: bloc.upperValue,
          values: bloc.values,
          divisions: 10,
          activeColor: mainColor,
          labels: RangeLabels(
            bloc.values.start.round().toString(),
            bloc.values.end.round().toString(),
          ),
          onChanged: (val) => bloc.setRangeValue(val),
        );
      },

    ));
  }
}