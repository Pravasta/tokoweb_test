import 'package:tokoweb_test/features/home/data/models/issue_model.dart';
import 'package:tokoweb_test/features/home/data/models/repository_model.dart';
import 'package:tokoweb_test/features/home/data/models/user_model.dart';

abstract class DataRepository {
  Future<List<UserModel>> getUser(String queue, String key);
  Future<List<IssueModel>> getIssue(String queue, String key);
  Future<List<RepositoryModel>> getRepository(String queue, String key);
}
