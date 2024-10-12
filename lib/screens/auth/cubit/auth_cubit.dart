import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:watch_store/data/constants.dart';
import 'package:watch_store/utils/shared_preferences_constants.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    //check token
    //isStore = T
    // emit(LoggedInState());
    //isStore = F
    // emit(LoggedOutState());

    emit(LoggedInState());
  }

  final Dio _dio = Dio();
  sendSms(String mobile) async {
    emit(LoadingState());
    try {
      await _dio
          .post(EndPoints.sendSms, data: {"mobile": mobile}).then((value) {
        debugPrint(value.toString());
        if (value.statusCode == 201) {
          emit(SentState(mobile: mobile));
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }

  verifyCode(String mobile, String code) async {
    emit(LoadingState());
    try {
      await _dio.post(EndPoints.cheekSmsCode,
          data: {"mobile": mobile, "code": code}).then((value) {
        debugPrint(value.toString());
        if (value.statusCode == 201) {
          SharedPreferencesManager().saveString(
              SharedPreferencesConstants.token, value.data["data"]["token"]);

          if (value.data["data"]["is_registered"]) {
            emit(VerifyIsRegisterState());
          } else {
            emit(VerifyNotRegisterState());
          }
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }

  registration() async {}

  logOut() {}
}
