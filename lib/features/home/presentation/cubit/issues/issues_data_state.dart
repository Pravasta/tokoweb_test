part of 'issues_data_cubit.dart';

sealed class IssuesDataState extends Equatable {
  const IssuesDataState();

  @override
  List<Object> get props => [];
}

final class IssuesDataInitial extends IssuesDataState {}

final class IssuesDataLoading extends IssuesDataState {}

final class IssuesDataLoaded extends IssuesDataState {
  final List<IssueModel> data;

  const IssuesDataLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class IssuesDataError extends IssuesDataState {
  final String message;

  const IssuesDataError(this.message);

  @override
  List<Object> get props => [message];
}
