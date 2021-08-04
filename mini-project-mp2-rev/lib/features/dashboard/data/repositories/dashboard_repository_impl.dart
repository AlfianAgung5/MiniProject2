import 'package:dartz/dartz.dart';
import 'package:mini_project/features/dashboard/data/datasources/dashboard_local_datasource.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:mini_project/framework/core/exceptions/failures.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl({
    required this.localDataSource,
  });

  final DashboardLocalDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> addDashboard(DataDiri data) async {
    try {
      final localData = await localDataSource.addDashboard(data);
      return Right(localData);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getdashboard() async {
    try {
      final localData = await localDataSource.getDashboard();
      return Right(localData);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> editDashboard(DataDiri data) async {
    try {
      final localData = await localDataSource.editDashboard(data);
      return Right(localData);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
