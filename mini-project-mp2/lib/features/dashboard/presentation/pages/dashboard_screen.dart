import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

const String DataDiriBoxName = "BOX_Friends";

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(LoadDashboard());
    BlocProvider.of<DashboardBloc>(context).add(GetDashboard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ValueListenableBuilder(
            valueListenable: Hive.box<DataDiri>(DataDiriBoxName).listenable(),
            builder: (context, Box<DataDiri> box, _) {
              print(box.values.isEmpty);
              if (box.values.isEmpty)
                return Center(
                  child: Text("No Data"),
                );
                  return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      var currentDataDiri = box.getAt(index);
                      return ListTile(
                          title: Text(currentDataDiri!.name),
                          subtitle: Text(currentDataDiri.jalan),
                          trailing: IconButton(
                              icon: Icon(Icons.info),
                              onPressed: () {
                                AlertDialog alertDialog = new AlertDialog(
                                content: new Container(
                                height: 450.0,
                                child: new Column(
                                children: [
                                Text("Nama : " + currentDataDiri.name),
                                Text("Tempat : " + currentDataDiri.tempat),
                                Text("Jalan : " + currentDataDiri.jalan),
                                Text("Jenis Kelamin : " + currentDataDiri.jenisKelamin),
                                Text("Tanggal Lahir : " + currentDataDiri.tanggalLahir),
                                Text("-------------------Alamat KTP--------------------"),
                                Text("Provinsi : " + currentDataDiri.provinsiKtp),
                                Text("Kabupaten : " + currentDataDiri.kabupatenKtp),
                                Text("Kecamatan : " + currentDataDiri.kecamatanKtp),
                                Text("Desa : " + currentDataDiri.desaKtp),
                                Text("RT : " + currentDataDiri.rtKtp),
                                Text("RW : " + currentDataDiri.rwKtp),
                                Text("------------Alamat Tempat Tinggal-----------"),
                                Text("Provinsi : " + currentDataDiri.provinsiRumah),
                                Text("Kabupaten : " + currentDataDiri.kabupatenRumah),
                                Text("Kecamatan :" + currentDataDiri.kecamatanRumah),
                                Text("Desa : " + currentDataDiri.desaRumah),
                                Text("RT : " + currentDataDiri.rtRumah),
                                Text("RW : " + currentDataDiri.rwRumah),
                                ElevatedButton(
                                child: new Text("OK"),
                                onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
      }));
       },
      );
       },
    )
    );
  }
}
