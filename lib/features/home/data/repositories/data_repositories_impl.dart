import 'dart:io';

import 'package:tokoweb_test/common/exception/failure.dart';
import 'package:tokoweb_test/common/exception/server_exception.dart';
import 'package:tokoweb_test/features/home/data/datasources/data_remote_datasources.dart';
import 'package:tokoweb_test/features/home/data/models/issue_model.dart';
import 'package:tokoweb_test/features/home/data/models/repository_model.dart';
import 'package:tokoweb_test/features/home/data/models/user_model.dart';
import 'package:tokoweb_test/features/home/domain/repository/data_repository.dart';

class DataRepositoryImpl implements DataRepository {
  final DataRemotDataSource dataRemotDataSource;

  DataRepositoryImpl({required this.dataRemotDataSource});

  @override
  Future<List<IssueModel>> getIssue(String queue, String key) async {
    try {
      final result = await dataRemotDataSource.getIssueModel(queue, key);
      return result;
    } on ServerException {
      rethrow;
    } on SocketException {
      throw const ConnectionFailure('Connect kan network');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<RepositoryModel>> getRepository(String queue, String key) async {
    try {
      final result = await dataRemotDataSource.getRepositoryModel(queue, key);
      return result;
    } on ServerException {
      rethrow;
    } on SocketException {
      throw const ConnectionFailure('Connect kan network');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<UserModel>> getUser(String queue, String key) async {
    try {
      final result = await dataRemotDataSource.getUserModel(queue, key);
      return result;
    } on ServerException {
      rethrow;
    } on SocketException {
      throw const ConnectionFailure('Connect kan network');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
