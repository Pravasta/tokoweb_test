import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tokoweb_test/features/home/data/models/user_model.dart';
import 'package:tokoweb_test/features/home/domain/usecases/user_usecases.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.userUsecases) : super(UserDataInitial());

  final UserUsecases userUsecases;

  void getUserData(String queue, String key) async {
    try {
      emit(UserDataLoading());
      final data = await userUsecases.getUser(queue, key);
      emit(UserDataLoaded(data: data));
    } catch (e) {
      emit(UserDataError(e.toString()));
    }
  }
}
