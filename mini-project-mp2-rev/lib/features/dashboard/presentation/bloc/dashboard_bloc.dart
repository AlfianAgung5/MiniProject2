import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/features/dashboard/domain/usecases/dashboard_usecase.dart';
import 'package:mini_project/framework/managers/hive_db_helper.dart';
import 'bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required HiveDbServices dbServices,
    required AddDashboardUseCase addDashboard,
    required EditDashboardUseCase editDashboard,
  })  : assert(dbServices != null),
        // assert(addDashboard != null),
        _dbServices = dbServices,
        _addDashboard = addDashboard,
        _editDashboard = editDashboard,
        super(DashboardInitial());

  final HiveDbServices _dbServices;
  final AddDashboardUseCase _addDashboard;
  final EditDashboardUseCase _editDashboard;

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is LoadDashboard) {
      yield DashboardLoading();
      await Future.delayed(Duration(seconds: 2));
      yield DashboardLoaded();
    }

    if (event is SaveDashboard) {
      // try {
      //   final result =
      //       await _dbServices.addData(event.data.key!, event.data.name);
      //   yield AddDashboardSuccess(isSuccess: result);
      // } catch (e) {
      //   yield DashboardFailure();
      // }
      final failureOrSuccess = await _addDashboard(event.data);
      yield failureOrSuccess.fold(
        (failure) => DashboardFailure(),
        (success) => AddDashboardSuccess(isSuccess: success),
      );
    }
    if (event is EditDashboard) {
      // try {
      //   final result =
      //       await _dbServices.addData(event.data.key!, event.data.name);
      //   yield AddDashboardSuccess(isSuccess: result);
      // } catch (e)
      //   yield DashboardFailure();
      // }
      final failureOrSuccess = await _editDashboard(event.data);
      yield failureOrSuccess.fold(
        (failure) => DashboardFailure(),
        (success) => AddDashboardSuccess(isSuccess: success),
      );
    }

    if (event is CountDashboard) {
      final result = await _dbServices.getData('1');
      print(result.toString());
    }
  }
}
