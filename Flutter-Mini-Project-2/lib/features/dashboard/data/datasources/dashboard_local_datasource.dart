import 'package:mini_project/features/dashboard/domain/entities/friends.dart';
import 'package:mini_project/framework/managers/hive_db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DashboardLocalDataSource {
  Future<List<String>> getDashboard();
  Future<bool> addDashboard(Friends data);
  Future<bool> editDashboard(Friends data);
  Future<bool> deleteDashboard(Friends data);
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  DashboardLocalDataSourceImpl({
    required this.dbServices,
  });

  final HiveDbServices dbServices;

  @override
  Future<bool> addDashboard(Friends data) {
    return dbServices.addData(data.key!, data.name);
  }

  @override
  Future<List<String>> getDashboard() {
    // TODO: implement getDashboard
    throw UnimplementedError();
  }

  @override
  Future<bool> editDashboard(Friends data) {
    return dbServices.editData(data.key!, data.name);
  }

  @override
  Future<bool> deleteDashboard(Friends data) {
    return dbServices.deleteData(data.key!);
  }

  //
}
