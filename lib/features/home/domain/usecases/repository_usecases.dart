import 'package:tokoweb_test/features/home/data/models/repository_model.dart';
import 'package:tokoweb_test/features/home/domain/repository/data_repository.dart';

class RepositoryUsecases {
  final DataRepository dataRepository;

  RepositoryUsecases(this.dataRepository);

  Future<List<RepositoryModel>> getRepository(String queue, String key) async {
    return dataRepository.getRepository(queue, key);
  }
}
