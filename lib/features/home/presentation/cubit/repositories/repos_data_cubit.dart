import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tokoweb_test/features/home/data/models/repository_model.dart';
import 'package:tokoweb_test/features/home/domain/usecases/repository_usecases.dart';

part 'repos_data_state.dart';

class ReposDataCubit extends Cubit<ReposDataState> {
  ReposDataCubit(this.repositoryUsecases) : super(ReposDataInitial());

  final RepositoryUsecases repositoryUsecases;

  void getUserData(String queue, String key) async {
    try {
      emit(ReposDataLoading());
      final data = await repositoryUsecases.getRepository(queue, key);
      emit(ReposDataLoaded(data: data));
    } catch (e) {
      emit(ReposDataError(e.toString()));
    }
  }
}
