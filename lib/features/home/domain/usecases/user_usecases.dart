import 'package:tokoweb_test/features/home/data/models/user_model.dart';
import 'package:tokoweb_test/features/home/domain/repository/data_repository.dart';

class UserUsecases {
  final DataRepository dataRepository;

  UserUsecases(this.dataRepository);

  Future<List<UserModel>> getUser(String queue, String key) async {
    return dataRepository.getUser(queue, key);
  }
}
