import 'package:dartz/dartz.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/framework/core/exceptions/failures.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<String>>> getdashboard();
  Future<Either<Failure, bool>> addDashboard(DataDiri data);
  Future<Either<Failure, bool>> editDashboard(DataDiri data);
  // Future<Either<Failure, List<DataDiri>>> getDashboard();
  // Future<Either<Failure, bool>> deleteDashboard(String id);
}
