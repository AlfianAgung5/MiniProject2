import 'package:mini_project/config/stringresource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:mini_project/theme/color.dart';
import 'package:mini_project/theme/textstyle.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:mini_project/features/dashboard/presentation/bloc/bloc.dart';
import 'package:mini_project/features/dashboard/domain/entities/datadiri.dart';
import 'package:flash/flash.dart';

class EditDataDiriForm extends StatefulWidget {
  final String? nama;
  final String? gender;
  final String? tempLahir;
  final String? tglLahir;
  final String? jlnPertama;
  final String? provPertama;
  final String? kabPertama;
  final String? kecPertama;
  final String? desaPertama;
  final String? ertPertama;
  final String? erwPertama;
  final String? jlnKedua;
  final String? provKedua;
  final String? kabKedua;
  final String? kecKedua;
  final String? desaKedua;
  final String? ertKedua;
  final String? erwKedua;
  final int? index;

  EditDataDiriForm(
      {Key? key,
      required this.index,
      required this.nama,
      required this.gender,
      required this.tempLahir,
      required this.tglLahir,
      required this.jlnPertama,
      required this.provPertama,
      required this.kabPertama,
      required this.kecPertama,
      required this.desaPertama,
      required this.ertPertama,
      required this.erwPertama,
      required this.jlnKedua,
      required this.provKedua,
      required this.kabKedua,
      required this.kecKedua,
      required this.desaKedua,
      required this.ertKedua,
      required this.erwKedua})
      : super(key: key);

  @override
  _EditDataDiriFormState createState() => _EditDataDiriFormState();
}

class _EditDataDiriFormState extends State<EditDataDiriForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  // TextEditingController _keyController = new TextEditingController();
  TextEditingController _namaController = new TextEditingController();
  TextEditingController _tempatController = new TextEditingController();
  TextEditingController jalanController = new TextEditingController();
  TextEditingController _getJalanController = new TextEditingController();
  // TextEditingController tglController = new TextEditingController();

  var provinsi = ["Jawa Tengah", "Jawa Timur", "Jawa Barat"];
  var kota = ["Purbalingga", "Purwokerto", "Kebumen"];
  var kecamatan = ["Bojongsari", "Kutasari", "Padamara"];
  var kelurahan = ["Candiwulan", "Karangcegak", "Candinata"];
  var rt = ["01", "02", "03", "04", "05"];
  var rw = ["001", "002", "003", "004", "005"];

  String jenisKelamin = "";
  String provinsiPertama = "";
  String kotaPertama = "";
  String kecamatanPertama = "";
  String kelurahanPertama = "";
  String rtPertama = "";
  String rwPertama = "";

  DateTime? tglController;

  String? getProvinsi;
  String? getKota;
  String? getKecamatan;
  String? getKelurahan;
  String? getRt;
  String? getRw;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(LoadDashboard());
    _namaController.text = widget.nama.toString();
    jalanController.text = widget.jlnPertama.toString();
    _getJalanController.text = widget.jlnKedua.toString();
    _tempatController.text = widget.tempLahir.toString();
    tglController = DateTime.parse(widget.tglLahir.toString());
    // var tanggal = DateTime.parse(tglLahir.toString());
    // tglController.text = DateTime.parse();
    jenisKelamin = widget.gender.toString();
    // _formKey.currentState?.fields['provinsi']?.value(provPertama.toString());
    // if (provinsi != Null) {
    //   setState(() {
    //     _formKey.currentState?.fields['provinsi']?.didChange(provPertama);
    //   });
    // }
    if (provinsiPertama == "") {
      provinsiPertama = widget.provPertama.toString();
    }
    if (kotaPertama == "") {
      kotaPertama = widget.kabPertama.toString();
    }
    if (kecamatanPertama == "") {
      kecamatanPertama = widget.kecPertama.toString();
    }
    if (kelurahanPertama == "") {
      kelurahanPertama = widget.desaPertama.toString();
    }
    if (rtPertama == "") {
      rtPertama = widget.ertPertama.toString();
    }
    if (rwPertama == "") {
      rwPertama = widget.erwPertama.toString();
    }
    if (tglController == null) {
      tglController = DateTime.parse(widget.tglLahir.toString());
    }

    ///////

    if (getProvinsi == null) {
      getProvinsi = widget.provKedua.toString();
    }
    if (getKota == null) {
      getKota = widget.kabKedua.toString();
    }
    if (getKecamatan == null) {
      getKecamatan = widget.kecKedua.toString();
    }
    if (getKelurahan == null) {
      getKelurahan = widget.desaKedua.toString();
    }
    if (getRt == null) {
      getRt = widget.ertKedua.toString();
    }
    if (getRw == null) {
      getRw = widget.erwKedua.toString();
    }

    // setState(() {
    // _formKey.currentState?.fields['provinsi']?.didChange(provPertama);
    //   _formKey.currentState?.fields['kota']?.didChange(kabPertama);
    //   _formKey.currentState?.fields['kecamatan']?.didChange(kecPertama);
    //   _formKey.currentState?.fields['kelurahan']?.didChange(desaPertama);
    //   _formKey.currentState?.fields['rt']?.didChange(ertPertama);
    //   _formKey.currentState?.fields['rw']?.didChange(erwPertama);

    //   _formKey.currentState?.fields['getProvinsi']?.didChange(provKedua);
    //   _formKey.currentState?.fields['getKota']?.didChange(kabKedua);
    //   _formKey.currentState?.fields['getKecamatan']?.didChange(kecKedua);
    //   _formKey.currentState?.fields['getKelurahan']?.didChange(desaKedua);
    //   _formKey.currentState?.fields['getRt']?.didChange(ertKedua);
    //   _formKey.currentState?.fields['getRw']?.didChange(erwKedua);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<DashboardBloc, DashboardState>(
        listener: (BuildContext context, state) {
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
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            children: [
              header(),
              setNama(),
              // setProvinsi(),
              setJk(),
              setTtl(),
              setAlamatKtp(),
              setJalan(),
              setProvinsi(),
              setKotaKabupaten(),
              setKecamatan(),
              setKelurahanDesa(),
              setRtRw(),
              setAlamatTempatTinggal(),
              setCheckBox(),
              setJalanFix(),
              setProvinsiFix(),
              setKotaKabupatenFix(),
              setKecamatanFix(),
              setKelurahanDesaFix(),
              setRtRwFix(),

              // Text(nama.toString()),
              // Text(gender.toString()),
              // Text(tempLahir.toString()),
              // Text(tglLahir.toString()),
              // Text(jlnPertama.toString()),
              // Text(provPertama.toString()),
              // Text(kabPertama.toString()),
              // Text(kecPertama.toString()),
              // Text(desaPertama.toString()),
              // Text(ertPertama.toString()),
              // Text(erwPertama.toString()),
              // Text(jlnKedua.toString()),
              // Text(provKedua.toString()),
              // Text(kabKedua.toString()),
              // Text(kecKedua.toString()),
              // Text(desaKedua.toString()),
              // Text(ertKedua.toString()),
              // Text(erwKedua.toString()),
              // btn
              setSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() => Container(
        width: MediaQuery.of(context).copyWith().size.height / 1.5,
        height: 195,
        color: ColorPalette.gray300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return DashboardPage();
                      }));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorPalette.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return DashboardPage();
                      }));
                    },
                    child: Text(
                      StringResources.TEXT_APP_TITLE,
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lengkapi Data Diri",
                    style: TextPalette.secondaryTxtStyle,
                  ),
                  Text(
                    "Mohon Untuk Melengkapi Data Diri Anda",
                    style: TextPalette.altTextStyle,
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget setNama() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderTextField(
                  controller: _namaController,
                  name: 'nama',
                  // initialValue: widget.nama,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.maxLength(context, 25),
                  ]),
                ),
              ],
            ),
          ),
        ],
      );

  Widget setJk() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jenis Kelamin",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderRadioGroup(
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  name: 'jenis_kelamin',
                  initialValue: widget.gender,
                  validator: FormBuilderValidators.required(context),
                  options: ['Laki - Laki', 'Perempuan']
                      .map((lang) => FormBuilderFieldOption(value: lang))
                      .toList(growable: false),
                  onChanged: (lang) {
                    setState(() {
                      jenisKelamin = lang.toString();
                    });
                  },
                ),
              ],
            ),
          )
        ],
      );

  Widget setTtl() => Padding(
        padding: const EdgeInsets.only(top: 15, left: 25),
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Text(
                      'Tempat',
                      style: TextPalette.fieldStyle,
                    ),
                  ),
                  FormBuilderTextField(
                    controller: _tempatController,
                    name: 'tempat',
                    // initialValue: widget.tempLahir,
                    decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.gray300),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.gray300,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray300,
                      filled: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.20,
              height: 20.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Text(
                      'Tanggal Lahir',
                      style: TextPalette.fieldStyle,
                    ),
                  ),
                  FormBuilderDateTimePicker(
                    onChanged: (tanggal) {
                      tglController = tanggal;
                    },
                    name: 'date',
                    // initialDate: DateTime.parse(widget.tglLahir.toString()),
                    initialValue: DateTime.parse(widget.tglLahir.toString()),
                    inputType: InputType.date,
                    decoration: new InputDecoration(
                      suffixIcon: Icon(
                        Icons.date_range,
                        color: Colors.black,
                        size: 30,
                      ),
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.gray300),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.gray300,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray300,
                      filled: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      );

  Widget setAlamatKtp() => Padding(
        padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
        child: Row(
          children: [
            Text(
              'Alamat KTP',
              style: TextPalette.fieldStyle,
            ),
            Expanded(
              child: Center(
                child: Divider(
                  color: ColorPalette.gray300,
                  thickness: 4,
                  indent: 10,
                  endIndent: 0,
                ),
              ),
            )
          ],
        ),
      );

  Widget setJalan() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jalan",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderTextField(
                  controller: jalanController,
                  name: 'jalan',
                  // initialValue: widget.jlnPertama,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.maxLength(context, 25),
                  ]),
                ),
              ],
            ),
          ),
        ],
      );

  Widget setProvinsi() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Provinsi",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderDropdown(
                  name: 'provinsi',
                  initialValue: widget.provPertama,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  allowClear: true,
                  hint: Text('Select Provinsi'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: provinsi
                      .map((provinsi) => DropdownMenuItem(
                            value: provinsi,
                            child: Text('$provinsi'),
                          ))
                      .toList(),
                  onChanged: (provinsi) {
                    provinsiPertama = provinsi.toString();
                    // _formKey.currentState?.fields['Provinsi']
                    //     ?.didChange(provPertama.toString());
                  },
                ),
              ],
            ),
          ),
        ],
      );

  Widget setKotaKabupaten() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kota/Kabupaten",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderDropdown(
                  name: 'kota',
                  initialValue: widget.kabPertama,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  allowClear: true,
                  hint: Text('Select Kota/Kabupaten'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: kota
                      .map((kota) => DropdownMenuItem(
                            value: kota,
                            child: Text('$kota'),
                          ))
                      .toList(),
                  onChanged: (kota) {
                    kotaPertama = kota.toString();
                  },
                ),
              ],
            ),
          ),
        ],
      );

  Widget setKecamatan() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kecamatan",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderDropdown(
                  name: 'kecamatan',
                  initialValue: widget.kecPertama,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  allowClear: true,
                  hint: Text('Select kecamatan'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: kecamatan
                      .map((kecamatan) => DropdownMenuItem(
                            value: kecamatan,
                            child: Text('$kecamatan'),
                          ))
                      .toList(),
                  onChanged: (kecamatan) {
                    kecamatanPertama = kecamatan.toString();
                  },
                ),
              ],
            ),
          ),
        ],
      );

  Widget setKelurahanDesa() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kelurahan/Desa",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderDropdown(
                  name: 'kelurahan',
                  initialValue: widget.desaPertama,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  allowClear: true,
                  hint: Text('Select Kelurahan/Desa'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: kelurahan
                      .map((kelurahan) => DropdownMenuItem(
                            value: kelurahan,
                            child: Text('$kelurahan'),
                          ))
                      .toList(),
                  onChanged: (kelurahan) {
                    kelurahanPertama = kelurahan.toString();
                  },
                ),
              ],
            ),
          ),
        ],
      );

  Widget setRtRw() => Padding(
        padding: const EdgeInsets.only(top: 15, left: 25),
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Text(
                      'RT',
                      style: TextPalette.fieldStyle,
                    ),
                  ),
                  FormBuilderDropdown(
                    name: 'rt',
                    initialValue: widget.ertPertama,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.gray300),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.gray300,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray300,
                      filled: true,
                    ),
                    allowClear: true,
                    hint: Text('Select RT'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: rt
                        .map((rt) => DropdownMenuItem(
                              value: rt,
                              child: Text('$rt'),
                            ))
                        .toList(),
                    onChanged: (rt) {
                      rtPertama = rt.toString();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.20,
              height: 20.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Text(
                      'RW',
                      style: TextPalette.fieldStyle,
                    ),
                  ),
                  FormBuilderDropdown(
                    name: 'rw',
                    initialValue: widget.erwPertama,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.gray300),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.gray300,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray300,
                      filled: true,
                    ),
                    allowClear: true,
                    hint: Text('Select RW'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: rw
                        .map((rw) => DropdownMenuItem(
                              value: rw,
                              child: Text('$rw'),
                            ))
                        .toList(),
                    onChanged: (rw) {
                      rwPertama = rw.toString();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      );

  Widget setAlamatTempatTinggal() => Padding(
        padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
        child: Row(
          children: [
            Text(
              'Alamat Tempat Tinggal',
              style: TextPalette.fieldStyle,
            ),
            Expanded(
              child: Center(
                child: Divider(
                  color: ColorPalette.gray300,
                  thickness: 4,
                  indent: 10,
                  endIndent: 0,
                ),
              ),
            )
          ],
        ),
      );

  Widget setCheckBox() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 25, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                FormBuilderCheckbox(
                  name: 'checkbox',
                  initialValue: false,
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Sama kan Denga Alamat KTP ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  validator: FormBuilderValidators.equal(
                    context,
                    true,
                  ),
                  onChanged: (checkbox) {
                    if (checkbox == true) {
                      _getJalanController.text = jalanController.text;

                      getProvinsi = provinsiPertama;
                      // getProvinsi = provPertama;
                      getKota = kotaPertama;
                      getKecamatan = kecamatanPertama;
                      getKelurahan = kelurahanPertama;
                      getRt = rtPertama;
                      getRw = rwPertama;

                      _formKey.currentState?.fields['getProvinsi']
                          ?.didChange(getProvinsi);
                      _formKey.currentState?.fields['getKota']
                          ?.didChange(getKota);
                      _formKey.currentState?.fields['getKecamatan']
                          ?.didChange(getKecamatan);
                      _formKey.currentState?.fields['getKelurahan']
                          ?.didChange(getKelurahan);
                      _formKey.currentState?.fields['getRt']?.didChange(getRt);
                      _formKey.currentState?.fields['getRw']?.didChange(getRw);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      );

  Widget setJalanFix() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jalan",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderTextField(
                  controller: _getJalanController,
                  name: 'jalanFix',
                  // initialValue: widget.jlnKedua,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.maxLength(context, 25),
                  ]),
                ),
              ],
            ),
          ),
        ],
      );

  Widget setProvinsiFix() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Provinsi",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderDropdown(
                  name: "getProvinsi",
                  initialValue: widget.provKedua,
                  onChanged: (provinsi) {
                    getProvinsi = provinsi.toString();
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  allowClear: true,
                  hint: Text('Select Provinsi'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: provinsi
                      .map((provinsi) => DropdownMenuItem(
                            value: provinsi,
                            child: Text('$provinsi'),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      );

  Widget setKotaKabupatenFix() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kota/Kabupaten",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderDropdown(
                  name: 'getKota',
                  initialValue: widget.kabKedua,
                  onChanged: (kota) {
                    getKota = kota.toString();
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  allowClear: true,
                  hint: Text('Select Kota/Kabupaten'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: kota
                      .map((kota) => DropdownMenuItem(
                            value: kota,
                            child: Text('$kota'),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      );

  Widget setKecamatanFix() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kecamatan",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderDropdown(
                  name: 'getKecamatan',
                  initialValue: widget.kecKedua,
                  onChanged: (kecamatan) {
                    getKecamatan = kecamatan.toString();
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  allowClear: true,
                  hint: Text('Select kecamatan'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: kecamatan
                      .map((kecamatan) => DropdownMenuItem(
                            value: kecamatan,
                            child: Text('$kecamatan'),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      );

  Widget setKelurahanDesaFix() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kelurahan/Desa",
                  style: TextPalette.fieldStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 8,
                ),
                FormBuilderDropdown(
                  name: 'getKelurahan',
                  initialValue: widget.desaKedua,
                  onChanged: (kelurahan) {
                    getKelurahan = kelurahan.toString();
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPalette.gray300),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPalette.gray300,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: ColorPalette.gray300,
                    filled: true,
                  ),
                  allowClear: true,
                  hint: Text('Select Kelurahan/Desa'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: kelurahan
                      .map((kelurahan) => DropdownMenuItem(
                            value: kelurahan,
                            child: Text('$kelurahan'),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      );

  Widget setRtRwFix() => Padding(
        padding: const EdgeInsets.only(top: 15, left: 25),
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Text(
                      'RT',
                      style: TextPalette.fieldStyle,
                    ),
                  ),
                  FormBuilderDropdown(
                    name: 'getRt',
                    initialValue: widget.ertKedua,
                    onChanged: (rt) {
                      getRt = rt.toString();
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.gray300),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.gray300,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray300,
                      filled: true,
                    ),
                    allowClear: true,
                    hint: Text('Select RT'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: rt
                        .map((rt) => DropdownMenuItem(
                              value: rt,
                              child: Text('$rt'),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.20,
              height: 20.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Text(
                      'RW',
                      style: TextPalette.fieldStyle,
                    ),
                  ),
                  FormBuilderDropdown(
                    name: 'getRw',
                    initialValue: widget.erwKedua,
                    onChanged: (rw) {
                      getRw = rw.toString();
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPalette.gray300),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPalette.gray300,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fillColor: ColorPalette.gray300,
                      filled: true,
                    ),
                    allowClear: true,
                    hint: Text('Select RW'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: rw
                        .map((rw) => DropdownMenuItem(
                              value: rw,
                              child: Text('$rw'),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      );

  //Btn
  Widget setSimpan() => SizedBox(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 25, right: 25, bottom: 35, left: 25),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 5.0)
              ],
              gradient: LinearGradient(
                stops: [0.0, 1.0],
                colors: [
                  Colors.redAccent.shade700,
                  Colors.red.shade400,
                ],
              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                // if (provinsiPertama == "") {
                //   provinsiPertama = widget.provPertama.toString();
                //   print(provinsiPertama);

                // }
                var data = DataDiri(
                    index: widget.index,
                    name: _namaController.text,
                    tempat: _tempatController.text,
                    jalan: _getJalanController.text,
                    jenisKelamin: jenisKelamin,
                    tanggalLahir: tglController!,
                    provinsiKtp: provinsiPertama,
                    kabupatenKtp: kotaPertama,
                    kecamatanKtp: kecamatanPertama,
                    desaKtp: kelurahanPertama,
                    rtKtp: rtPertama,
                    rwKtp: rwPertama,
                    provinsiRumah: getProvinsi.toString(),
                    kabupatenRumah: getKota.toString(),
                    kecamatanRumah: getKecamatan.toString(),
                    desaRumah: getKelurahan.toString(),
                    rtRumah: getRt.toString(),
                    rwRumah: getRw.toString(),
                    jalanRumah: _getJalanController.text);
                print(data);

                BlocProvider.of<DashboardBloc>(context).add(
                  EditDashboard(
                    data: data,
                  ),
                );
              },
              child: Text(
                StringResources.BTN_SEND_APP_TITLE,
                style: TextPalette.btnStyle,
              ),
            ),
          ),
        ),
      );
}
