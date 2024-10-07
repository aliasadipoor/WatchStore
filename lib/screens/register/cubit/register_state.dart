part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class LoadingState extends RegisterState {}

final class ErrorState extends RegisterState {}

final class OkResponseState extends RegisterState {}

final class LocationPickState extends RegisterState {
  const LocationPickState({
    required this.location,
  });
  final GeoPoint? location;
}
