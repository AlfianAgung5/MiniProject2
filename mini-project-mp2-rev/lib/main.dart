import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_project/config/stringresource.dart';
import 'package:mini_project/env.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mini_project/service_locator.dart';
import 'package:mini_project/theme/color.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (Env().isInDebugMode) {
      print(event);
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (Env().isInDebugMode) {
      print(transition);
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (Env().isInDebugMode) {
      print(error);
    }
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load HiveDb
  await Hive.initFlutter();
  Hive.registerAdapter<DataDiri>(DataDiriAdapter());
  await Hive.openBox<DataDiri>('BOX_Friends');

  // Load Flutter dotenv
  await dotenv.load(fileName: ".env");
  // Load service Locator
  await initDependencyInjection();
  // Load Bloc stepper
  Bloc.observer = SimpleBlocObserver();

  if (Env().isInDebugMode) {
    print('app: ${Env().appName}');
  }
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringResources.TEXT_APLICATION_TITLE,
      theme: ThemeData(
        primarySwatch: ColorPalette.red,
      ),
      home: DashboardPage(),
    );
  }
}
