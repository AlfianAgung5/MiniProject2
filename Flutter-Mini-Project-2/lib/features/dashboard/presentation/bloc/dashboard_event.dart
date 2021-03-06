import 'package:equatable/equatable.dart';
import 'package:mini_project/features/dashboard/domain/entities/friends.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class LoadDashboard extends DashboardEvent {}

class SaveDashboard extends DashboardEvent {
  const SaveDashboard({
    required this.data,
  });

  final Friends data;

  @override
  List<Object> get props => [data];
}

class EditDashboard extends DashboardEvent {
  const EditDashboard({
    required this.data,
  });

  final Friends data;

  @override
  List<Object> get props => [data];
}

class DeleteDashboard extends DashboardEvent {
  const DeleteDashboard({
    required this.data,
  });

  final Friends data;

  @override
  List<Object> get props => [data];
}

// class DeleteDashboard extends DashboardEvent {}

class CountDashboard extends DashboardEvent {}
