part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {}

class AuthFailed extends AuthState {
  final String message;

  AuthFailed({required this.message});

  // Ensuring this class is NEVER equal to itself, so every error (even repeats) are shown.
  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => message.hashCode;
}

class NotAuthenticated extends AuthState {}

class CriticalAuthError extends AuthState {
  final String message;

  CriticalAuthError({required this.message});
  @override
  List<Object?> get props => [message];
}

class Authenticated extends AuthState {
  final String username;
  final String token;

  Authenticated({
    required this.username,
    required this.token,
  });
  @override
  List<Object?> get props => [username, token];
}
