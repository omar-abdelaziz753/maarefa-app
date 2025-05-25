import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../failure.dart';

class SharedPrefService {
  dynamic value;

   getValue(String key) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      value = preferences.get(key);
      return value;
    // } catch (e) {
    //   return Left(Failure(e.toString()));
    // }
  }

  Future<Either<Failure, bool>> getBool(String key) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      value = preferences.getBool(key);
      return Right(value);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Option<Failure>> setBool(String key, bool value) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool(key, value);
      return none();
    } catch (e) {
      return Some(Failure(e.toString()));
    }
  }

  Future<Option<Failure>> setValue(String key, String value) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final result = await preferences.setString(key, value);
      debugPrint(result.toString());
      if (result) {
        return none();
      } else {
        return Some(Failure('حصلت مشكله حاول مره تانية'));
      }
    } catch (e) {
      return Some(Failure(e.toString()));
    }
  }

  Future<Option<Failure>> delete(String key) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      final result = await pref.remove(key);
      debugPrint(result.toString());
      if (result) {
        return none();
      } else {
        return some(Failure("حصلت مشكله حاول مره تانيه"));
      }
    } catch (e) {
      return some(Failure(e.toString()));
    }
  }
}
