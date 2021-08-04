//
import 'package:mini_project/features/dashboard/data/datasources/dashboard_local_datasource.dart';
import 'package:mini_project/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:mini_project/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:mini_project/features/dashboard/domain/usecases/dashboard_usecase.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/bloc.dart';
import 'package:mini_project/framework/managers/hive_db_helper.dart';
//
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

//
GetIt serviceLocator = GetIt.instance;
Future<void> initDependencyInjection() async {
  // ************************************************ //
  //! Features - Dashboard
  // Bloc
  // Dashboard Bloc
  serviceLocator.registerFactory<DashboardBloc>(
    () => DashboardBloc(
      dbServices: serviceLocator(),
      addDashboard: serviceLocator(),
      editDashboard: serviceLocator(),
    ),
  );

  // Use Cases
  serviceLocator
      .registerLazySingleton(() => AddDashboardUseCase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => EditDashboardUseCase(serviceLocator()));
  // serviceLocator
  //     .registerLazySingleton(() => DashboardFromCacheUseCase(serviceLocator()));

  // Repository
  serviceLocator
      .registerLazySingleton<DashboardRepository>(() => DashboardRepositoryImpl(
            localDataSource: serviceLocator(),
          ));

  // Data Sources
  // serviceLocator.registerLazySingleton<DashboardRemoteDataSource>(
  //     () => DashboardRemoteDataSourceImpl(
  //           httpManager: serviceLocator(),
  //           dbServices: serviceLocator(),
  //         ));
  serviceLocator.registerLazySingleton<DashboardLocalDataSource>(
      () => DashboardLocalDataSourceImpl(
            dbServices: serviceLocator(),
          ));

  // ************************************************ //

  //! Managers
  final sharedPreferences = await SharedPreferences.getInstance();
  //
  serviceLocator.registerSingleton<SharedPreferences>(sharedPreferences);
  serviceLocator.registerSingleton<HiveDbServices>(HiveDbServices());
  //
}
