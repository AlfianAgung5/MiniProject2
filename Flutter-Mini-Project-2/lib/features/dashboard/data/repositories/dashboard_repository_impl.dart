import 'package:dartz/dartz.dart';
import 'package:mini_project/features/dashboard/data/datasources/dashboard_local_datasource.dart';
import 'package:mini_project/features/dashboard/domain/entities/friends.dart';
import 'package:mini_project/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:mini_project/framework/core/exceptions/failures.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl({
    required this.localDataSource,
  });

  final DashboardLocalDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> addDashboard(Friends data) async {
    try {
      final localData = await localDataSource.addDashboard(data);
      return Right(localData);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getdashboard() {
    // TODO: implement getdashboard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> editDashboard(Friends data) async {
    try {
      final localData = await localDataSource.editDashboard(data);
      return Right(localData);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteDashboard(Friends data) async {
    try {
      final localData = await localDataSource.deleteDashboard(data);
      return Right(localData);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
