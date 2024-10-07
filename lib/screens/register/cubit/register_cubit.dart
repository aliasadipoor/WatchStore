import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:watch_store/data/constants.dart';
import 'package:watch_store/data/model/user.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final Dio _dio = Dio();

  /*  */
  pickLocation({required context}) async {
    await showSimplePickerLocation(
      context: context,
      isDismissible: true,
      textCancelPicker: "لغو",
      textConfirmPicker: "تایید",
      zoomOption: const ZoomOption(initZoom: 25),
      //  initCurrentUserPosition: UserTrackingOption.withoutUserPosition(),
      initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737),
      title: "انتخاب موقیت مکانی",
      radius: 8,
    ).then((value) => emit(LocationPickState(location: value)));
  }

/*  */
  register({required User user}) async {
    emit(LoadingState());
    print(user.toMap());
    try {
      String? token = SharedPreferencesManager().getString("token");
      _dio.options.headers['Authorization'] = "Bearer $token";
      await _dio
          .post(EndPoints.register, data: FormData.fromMap(user.toMap()))
          .then((value) {
        if (value.statusCode == 201) {
          emit(OkResponseState());
        } else {
          ErrorState();
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }
}
