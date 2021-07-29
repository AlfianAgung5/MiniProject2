import 'package:dartz/dartz.dart';
import 'package:mini_project/features/dashboard/domain/entities/friends.dart';
import 'package:mini_project/framework/core/exceptions/failures.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<String>>> getdashboard();
  Future<Either<Failure, bool>> addDashboard(Friends data);
  Future<Either<Failure, bool>> editDashboard(Friends data);
  Future<Either<Failure, bool>> deleteDashboard(Friends data);
}
