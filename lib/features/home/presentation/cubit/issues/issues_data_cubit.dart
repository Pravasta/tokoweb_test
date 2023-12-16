import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tokoweb_test/features/home/data/models/issue_model.dart';
import 'package:tokoweb_test/features/home/domain/usecases/issue_usecases.dart';

part 'issues_data_state.dart';

class IssuesDataCubit extends Cubit<IssuesDataState> {
  IssuesDataCubit(this.issueUsecases) : super(IssuesDataInitial());

  final IssueUsecases issueUsecases;

  void getUserData(String queue, String key) async {
    try {
      emit(IssuesDataLoading());
      final data = await issueUsecases.getIssue(queue, key);
      emit(IssuesDataLoaded(data: data));
    } catch (e) {
      emit(IssuesDataError(e.toString()));
    }
  }
}
