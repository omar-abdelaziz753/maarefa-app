part of 'rate_cubit.dart';

@immutable
abstract class RateState {}

class RateInitial extends RateState {}
class ValidateEmptyState extends RateState {}

class ValidateNotEmptyState extends RateState {}
class ValidateState extends RateState {}
class AddRateState extends RateState {}

