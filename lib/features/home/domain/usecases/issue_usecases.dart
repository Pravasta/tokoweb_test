import 'package:tokoweb_test/features/home/data/models/issue_model.dart';
import 'package:tokoweb_test/features/home/domain/repository/data_repository.dart';

class IssueUsecases {
  final DataRepository dataRepository;

  IssueUsecases(this.dataRepository);

  Future<List<IssueModel>> getIssue(String queue, String key) async {
    return dataRepository.getIssue(queue, key);
  }
}
