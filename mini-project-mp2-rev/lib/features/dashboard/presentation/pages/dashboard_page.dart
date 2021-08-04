import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/bloc.dart';
import 'package:mini_project/features/dashboard/presentation/pages/dashboard_page_datadiri.dart';
import 'package:mini_project/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:mini_project/service_locator.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => serviceLocator.get<DashboardBloc>(),
        child: DashboardScreen(
          title: '',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return BlocProvider(
              create: (_) => serviceLocator.get<DashboardBloc>(),
              child: PageDataDiri(),
            );
          }));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
