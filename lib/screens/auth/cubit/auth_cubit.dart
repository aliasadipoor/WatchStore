import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store/data/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    emit(LOggetOutState());
  }
  Dio _dio = Dio();
/*  */
  sendSms(String mobile) async {
    emit(LoadingState());
    try {
      await _dio
          .post(EndPoints.sendSms, data: {"mobile": mobile}).then((value) {
        print(value.toString());
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

/*  */
  verifyCode(String mobile, String code) async {
    emit(LoadingState());
    try {
      await _dio.post(EndPoints.cheekSmsCode, data: {
        "mobile": mobile,
        "code": code,
      }).then((value) {
        print(value.toString());
        if (value.statusCode == 201) {
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
}

registration() {}

logOut() {}