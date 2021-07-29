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

class DeleteDashboardSuccess extends DashboardState {
  DeleteDashboardSuccess({
    required this.isSuccess,
  });

  bool isSuccess;

  @override
  List<Object> get props => [
        isSuccess,
      ];
}

class DashboardFailure extends DashboardState {}
