part of 'user_data_cubit.dart';

sealed class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataLoaded extends UserDataState {
  final List<UserModel> data;

  const UserDataLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class UserDataError extends UserDataState {
  final String message;

  const UserDataError(this.message);

  @override
  List<Object> get props => [message];
}
