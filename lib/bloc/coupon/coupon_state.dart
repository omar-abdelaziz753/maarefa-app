part of 'coupon_cubit.dart';

abstract class CouponState {}

class CouponInitial extends CouponState {}

class CouponLoading extends CouponState {}

class CouponLoaded extends CouponState {
  CouponData? data;
  CouponLoaded({this.data});
}

class CouponError extends CouponState {}
