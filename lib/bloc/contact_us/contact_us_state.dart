part of 'contact_us_cubit.dart';

@immutable
abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}

class ContactUsMessageState extends ContactUsState {}

class ValidateState extends ContactUsState {}