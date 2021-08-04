import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mini_project/theme/color.dart';
import 'package:mini_project/theme/textstyle.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:mini_project/service_locator.dart';
import 'edit_dashboard_screen.dart';

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

  // final _formKey = GlobalKey<FormState>();

  late String nm;
  late String gender;
  late String tempLahir;
  late String tglLahir;
  late String jlnPertama;
  late String provinsiPertama;
  late String kabupatenPertama;
  late String kecamatanPertama;
  late String desaPertama;
  late String rtPertama;
  late String rwPertama;
  late String jlnKedua;
  late String provinsiKedua;
  late String kabupatenKedua;
  late String kecamatanKedua;
  late String desaKedua;
  late String rtKedua;
  late String rwKedua;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.gray300,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text('Search Here'),
            ValueListenableBuilder(
                valueListenable:
                    Hive.box<DataDiri>(DataDiriBoxName).listenable(),
                builder: (context, Box<DataDiri> box, _) {
                  print(box.values.isEmpty);
                  if (box.values.isEmpty)
                    return Center(
                      child: Text("No Data"),
                    );
                  SizedBox(
                    height: 30,
                  );
                  return Container(
                    width: double.infinity,
                    height: 522,
                    decoration: BoxDecoration(
                        color: ColorPalette.whitecolor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 20, right: 20),
                      child: ListView.builder(
                        itemCount: box.values.length,
                        itemBuilder: (context, index) {
                          var currentDataDiri = box.getAt(index);
                          var indeks = index;
                          return ListTile(
                            title: Text(
                              currentDataDiri!.name,
                              style: TextPalette.fieldStyle,
                            ),
                            subtitle: Text(currentDataDiri.jalan),
                            leading: CircleAvatar(
                                backgroundColor: ColorPalette.primary),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                    onPressed: () {
                                      print(index);
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return Dialog(
                                              child: Container(
                                                padding: EdgeInsets.all(32),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text("Alamat Data Diri "),
                                                    Divider(),
                                                    Text("Nama : " +
                                                        currentDataDiri.name),
                                                    Text("Jenis Kelamin : " +
                                                        currentDataDiri
                                                            .jenisKelamin),
                                                    Text("Tempat : " +
                                                        currentDataDiri.tempat),
                                                    Text("Tanggal Lahir :" +
                                                        currentDataDiri
                                                            .tanggalLahir
                                                            .toString()),
                                                    Text(""),
                                                    Text("Alamat KTP "),
                                                    Divider(),
                                                    Text("Jalan : " +
                                                        currentDataDiri.jalan),
                                                    Text("Provinsi : " +
                                                        currentDataDiri
                                                            .provinsiKtp),
                                                    Text("Kota/kabupaten : " +
                                                        currentDataDiri
                                                            .kabupatenKtp),
                                                    Text("Kecamatan : " +
                                                        currentDataDiri
                                                            .kecamatanKtp),
                                                    Text("Kelurahan/Desa : " +
                                                        currentDataDiri
                                                            .desaKtp),
                                                    Text("RT : " +
                                                        currentDataDiri.rtKtp),
                                                    Text("Rw : " +
                                                        currentDataDiri.rwKtp),
                                                    Text(""),
                                                    Text(
                                                        "Alamat Tempat Tinggal "),
                                                    Divider(),
                                                    Text("Jalan : " +
                                                        currentDataDiri
                                                            .jalanRumah),
                                                    Text("Provinsi : " +
                                                        currentDataDiri
                                                            .provinsiRumah),
                                                    Text("Kota/kabupaten : " +
                                                        currentDataDiri
                                                            .kabupatenRumah),
                                                    Text("Kecamatan : " +
                                                        currentDataDiri
                                                            .kecamatanRumah),
                                                    Text("Kelurahan/Desa : " +
                                                        currentDataDiri
                                                            .desaRumah),
                                                    Text("RT : " +
                                                        currentDataDiri
                                                            .rtRumah),
                                                    Text("Rw : " +
                                                        currentDataDiri
                                                            .rwRumah),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    icon: Icon(Icons.more_vert)),
                                IconButton(
                                    onPressed: () {
                                      Alert(
                                        context: context,
                                        type: AlertType.warning,
                                        title: "DELETE DATA",
                                        desc: "Apa anda yakin menghapus data.",
                                        buttons: [
                                          DialogButton(
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () {
                                                box.deleteAt(index);
                                                Navigator.pop(context);
                                              },
                                              color: ColorPalette.main),
                                          DialogButton(
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              color: ColorPalette.main)
                                        ],
                                      ).show();
                                      //
                                    },
                                    icon: Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        indeks = index;
                                        nm = currentDataDiri.name;
                                        gender = currentDataDiri.jenisKelamin;
                                        tempLahir = currentDataDiri.tempat;
                                        tglLahir = currentDataDiri.tanggalLahir
                                            .toString();
                                        jlnPertama = currentDataDiri.jalan;
                                        provinsiPertama =
                                            currentDataDiri.provinsiKtp;
                                        kabupatenPertama =
                                            currentDataDiri.kabupatenKtp;
                                        kecamatanPertama =
                                            currentDataDiri.kecamatanKtp;
                                        desaPertama = currentDataDiri.desaKtp;
                                        rtPertama = currentDataDiri.rtKtp;
                                        rwPertama = currentDataDiri.rwKtp;
                                        jlnKedua = currentDataDiri.jalanRumah;
                                        provinsiKedua =
                                            currentDataDiri.provinsiRumah;
                                        kabupatenKedua =
                                            currentDataDiri.kabupatenRumah;
                                        kecamatanKedua =
                                            currentDataDiri.kecamatanRumah;
                                        desaKedua = currentDataDiri.desaRumah;
                                        rtKedua = currentDataDiri.rtRumah;
                                        rwKedua = currentDataDiri.rwRumah;
                                      });

                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return BlocProvider(
                                          create: (_) => serviceLocator
                                              .get<DashboardBloc>(),
                                          child: EditDataDiriForm(
                                            index: indeks,
                                            nama: nm,
                                            gender: gender,
                                            tempLahir: tempLahir,
                                            tglLahir: tglLahir,
                                            jlnPertama: jlnPertama,
                                            provPertama: provinsiPertama,
                                            kabPertama: kabupatenPertama,
                                            kecPertama: kecamatanPertama,
                                            desaPertama: desaPertama,
                                            ertPertama: rtPertama,
                                            erwPertama: rwPertama,
                                            jlnKedua: jlnKedua,
                                            provKedua: provinsiKedua,
                                            kabKedua: kabupatenKedua,
                                            kecKedua: kecamatanKedua,
                                            desaKedua: desaKedua,
                                            ertKedua: rtKedua,
                                            erwKedua: rwKedua,
                                          ),
                                        );
                                      }));
                                    },
                                    icon: Icon(Icons.edit))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.mail),
      //       label: "Mail",
      //     ),
      //   ],
      // ),
    );
  }
}
