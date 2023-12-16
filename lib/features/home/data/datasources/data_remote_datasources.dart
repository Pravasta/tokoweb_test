import 'package:tokoweb_test/common/endpoint/app_endpoint.dart';
import 'package:tokoweb_test/features/home/data/models/issue_model.dart';
import 'package:tokoweb_test/features/home/data/models/repository_model.dart';
import 'package:tokoweb_test/features/home/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../../common/exception/server_exception.dart';

abstract class DataRemotDataSource {
  Future<List<UserModel>> getUserModel(String queue, String key);
  Future<List<IssueModel>> getIssueModel(String queue, String key);
  Future<List<RepositoryModel>> getRepositoryModel(String queue, String key);
}

class DataRemotDataSourceImpl implements DataRemotDataSource {
  final http.Client client;
  final AppEndPoint appEndPoint;

  DataRemotDataSourceImpl({
    required this.client,
    required this.appEndPoint,
  });

  @override
  Future<List<IssueModel>> getIssueModel(String queue, String key) async {
    final url = appEndPoint.getListData(queue: queue, key: key);
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return IssueModelResponse.fromRawJson(response.body).items;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<RepositoryModel>> getRepositoryModel(
      String queue, String key) async {
    final url = appEndPoint.getListData(queue: queue, key: key);
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return RepositoryModelResponse.fromRawJson(response.body).items;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UserModel>> getUserModel(String queue, String key) async {
    final url = appEndPoint.getListData(queue: queue, key: key);
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return UserModelResponse.fromRawJson(response.body).items;
    } else {
      throw ServerException();
    }
  }
}
