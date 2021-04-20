part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}
