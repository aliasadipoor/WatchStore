part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoadingState extends AuthState {}

final class ErrorState extends AuthState {}

final class SentState extends AuthState {
  final mobile;
  SentState({
    required this.mobile,
  });
}

final class VerifyNotRegisterState extends AuthState {}

final class VerifyIsRegisterState extends AuthState {}

final class LoggedInState extends AuthState {}

final class LOggetOutState extends AuthState {}
