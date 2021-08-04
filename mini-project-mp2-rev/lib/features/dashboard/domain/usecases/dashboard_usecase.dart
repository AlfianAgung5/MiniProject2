import 'package:dartz/dartz.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:mini_project/framework/core/exceptions/failures.dart';
import 'package:mini_project/framework/core/usecases/usecase.dart';

class DashboardUseCase implements UseCase<List<String>, NoParams> {
  DashboardUseCase(this.repository);

  final DashboardRepository repository;

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) =>
      repository.getdashboard();
}

class AddDashboardUseCase implements UseCase<bool, DataDiri> {
  AddDashboardUseCase(this.repository);

  final DashboardRepository repository;

  @override
  Future<Either<Failure, bool>> call(DataDiri data) =>
      repository.addDashboard(data);
}

class EditDashboardUseCase implements UseCase<bool, DataDiri> {
  EditDashboardUseCase(this.repository);

  final DashboardRepository repository;

  @override
  Future<Either<Failure, bool>> call(DataDiri data) =>
      repository.editDashboard(data);
}

// class GetDashboardUseCase implements UseCase<List<DataDiri>, NoParams> {
//   GetDashboardUseCase(this.repository);

//   final DashboardRepository repository;

//   @override
//   Future<Either<Failure, List<DataDiri>>> call(NoParams params) =>
//       repository.getDashboard();
// }
