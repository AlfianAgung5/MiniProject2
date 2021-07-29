import 'package:dartz/dartz.dart';
import 'package:mini_project/features/dashboard/domain/entities/friends.dart';
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

class AddDashboardUseCase implements UseCase<bool, Friends> {
  AddDashboardUseCase(this.repository);

  final DashboardRepository repository;

  @override
  Future<Either<Failure, bool>> call(Friends data) =>
      repository.addDashboard(data);
}

class EditDashboardUseCase implements UseCase<bool, Friends> {
  EditDashboardUseCase(this.repository);

  final DashboardRepository repository;

  @override
  Future<Either<Failure, bool>> call(Friends data) =>
      repository.addDashboard(data);
}

class DeleteDashboardUseCase implements UseCase<bool, Friends> {
  DeleteDashboardUseCase(this.repository);

  final DashboardRepository repository;

  @override
  Future<Either<Failure, bool>> call(Friends data) =>
      repository.deleteDashboard(data);
}
