import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/features/dashboard/domain/entities/friends.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/bloc.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:mini_project/theme/textstyle.dart';
import 'package:flash/flash.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // int _counter = 0;
  String _text = '';

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  //! 2
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jalanController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(LoadDashboard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<DashboardBloc, DashboardState>(
        listener: (BuildContext context, state) {
          if (state is DashboardLoading) {
            setState(() => _text = 'Aplikasi Loading..');
          }
          if (state is DashboardLoaded) {
            setState(() => _text = 'Aplikasi Loaded..');
          }

          //! 2
          if (state is AddDashboardSuccess) {
            if (state.isSuccess) {
              context.showSuccessBar(content: Text('I succeeded!'));
            }
          }
          if (state is DashboardFailure) {
            context.showErrorBar(content: Text('Error'));
          }
        },
        // child: BlocBuilder<DashboardBloc, DashboardState>(
        //     builder: (BuildContext context, state) {
        //   if (state is DashboardLoading) {
        //     return Center(child: CircularProgressIndicator());
        //   }
        //   if (state is DashboardLoaded) {
        //     return Center(child: Text('state loaded'));
        //   }
        //   return Container();
        // }),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                _text,
                style: TextPalette.secondaryTxtStyle,
              ),

              //! 2
              Container(
                padding: EdgeInsets.all(5),
                width: 200,
                child: TextField(
                  decoration: InputDecoration(labelText: 'Key'),
                  controller: _keyController,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 200,
                child: TextField(
                  decoration: InputDecoration(labelText: 'Nama Teman'),
                  controller: _nameController,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 200,
                child: TextField(
                  decoration: InputDecoration(labelText: 'Jalan'),
                  controller: _jalanController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<DashboardBloc>(context).add(
                          SaveDashboard(
                            data: Friends(
                                key: _keyController.text,
                                name: _nameController.text,
                                jalan: _jalanController.text),
                          ),
                        );
                      },
                      child: Text('Simpan')),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<DashboardBloc>(context).add(
                          EditDashboard(
                            data: Friends(
                                key: _keyController.text,
                                name: _nameController.text,
                                jalan: _jalanController.text),
                          ),
                        );
                      },
                      child: Text('Edit')),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<DashboardBloc>(context).add(
                          EditDashboard(
                            data: Friends(
                                key: _keyController.text,
                                name: _nameController.text,
                                jalan: _jalanController.text),
                          ),
                        );
                      },
                      child: Text('Hapus')),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<DashboardBloc>(context).add(
                          CountDashboard(),
                        );
                      },
                      child: Text('Lihat')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
