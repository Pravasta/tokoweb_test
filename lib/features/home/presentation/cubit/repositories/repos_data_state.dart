part of 'repos_data_cubit.dart';

sealed class ReposDataState extends Equatable {
  const ReposDataState();

  @override
  List<Object> get props => [];
}

final class ReposDataInitial extends ReposDataState {}

final class ReposDataLoading extends ReposDataState {}

final class ReposDataLoaded extends ReposDataState {
  final List<RepositoryModel> data;

  const ReposDataLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class ReposDataError extends ReposDataState {
  final String message;

  const ReposDataError(this.message);

  @override
  List<Object> get props => [message];
}
