import 'package:equatable/equatable.dart';

enum AppType { initial, unauthenticated, load, authenticated, registered }

class AuthState extends Equatable {
  final AppType appStatus;

  const AuthState({this.appStatus = AppType.initial});

  AuthState copyWith({
    // Account? user,
    AppType? appStatus,
  }) {
    return AuthState(
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [appStatus];
}
