import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';

abstract class DashboardState {
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {}

class AddDashboardSuccess extends DashboardState {
  AddDashboardSuccess({
    required this.isSuccess,
  });

  bool isSuccess;

  @override
  List<Object> get props => [
        isSuccess,
      ];
}

class GetDashboardSuccess extends DashboardState {
  GetDashboardSuccess({
    required this.data,
  });

  List<DataDiri> data;

  @override
  List<Object> get props => [
        data,
      ];
}

class DashboardFailure extends DashboardState {}
