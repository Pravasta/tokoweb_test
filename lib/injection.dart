import 'package:get_it/get_it.dart';
import 'package:tokoweb_test/common/endpoint/app_endpoint.dart';
import 'package:tokoweb_test/common/endpoint/uri_helper.dart';
import 'package:tokoweb_test/features/home/data/datasources/data_remote_datasources.dart';
import 'package:tokoweb_test/features/home/data/repositories/data_repositories_impl.dart';
import 'package:tokoweb_test/features/home/domain/repository/data_repository.dart';
import 'package:tokoweb_test/features/home/domain/usecases/issue_usecases.dart';
import 'package:tokoweb_test/features/home/domain/usecases/repository_usecases.dart';
import 'package:tokoweb_test/features/home/domain/usecases/user_usecases.dart';
import 'package:tokoweb_test/features/home/presentation/cubit/issues/issues_data_cubit.dart';
import 'package:tokoweb_test/features/home/presentation/cubit/repositories/repos_data_cubit.dart';
import 'package:tokoweb_test/features/home/presentation/cubit/user/user_data_cubit.dart';
import 'package:http/http.dart' as http;

GetIt locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory(() => UserDataCubit(locator()));
  locator.registerFactory(() => IssuesDataCubit(locator()));
  locator.registerFactory(() => ReposDataCubit(locator()));

  // Usecases
  locator.registerLazySingleton(() => UserUsecases(locator()));
  locator.registerLazySingleton(() => IssueUsecases(locator()));
  locator.registerLazySingleton(() => RepositoryUsecases(locator()));

  // repository
  locator.registerLazySingleton<DataRepository>(
      () => DataRepositoryImpl(dataRemotDataSource: locator()));

  // Datasource
  locator.registerLazySingleton<DataRemotDataSource>(
      () => DataRemotDataSourceImpl(client: locator(), appEndPoint: locator()));

  locator.registerLazySingleton<http.Client>(() => http.Client());
  locator.registerLazySingleton(() => AppEndPoint('api.github.com'));
  locator.registerLazySingleton(() => UriHelper());
}
