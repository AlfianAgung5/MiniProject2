import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/framework/managers/hive_db_helper.dart';

abstract class DashboardLocalDataSource {
  Future<List<String>> getDashboard();
  Future<bool> addDashboard(DataDiri data);
  Future<bool> editDashboard(DataDiri data);
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  DashboardLocalDataSourceImpl({
    required this.dbServices,
  });

  final HiveDbServices dbServices;

  @override
  Future<bool> addDashboard(DataDiri data) {
    return dbServices.addData(data);
  }

  @override
  Future<List<String>> getDashboard() {
    // TODO: implement getDashboard
    throw UnimplementedError();
  }

  @override
  Future<bool> editDashboard(DataDiri data) {
    return dbServices.editData(data);
  }
}
