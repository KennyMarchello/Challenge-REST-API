import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../shared//theme.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)?.settings.arguments;
    String url = 'https://belajar-api.renaldiyulvianda.my.id/api';
    TextEditingController judul = TextEditingController();
    TextEditingController edisi = TextEditingController();
    TextEditingController penerbit = TextEditingController();
    Future<void> tambahData() async {
      try {
        var response = await Dio().post(
          '$url/master/buku/tambah',
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${user['token']}'
            },
          ),
          data: {
            'judul': judul.text,
            'edisi_ke': edisi.text,
            'penerbit_id': penerbit.text,
          },
        );
        print(response);
      } catch (e) {
        print(e);
      }
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Center(
          child: Text(
            'Tambah Buku Baru',
            style: blueTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget inputNamaBuku() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Judul Buku'),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: judul,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Masukkan Judul Buku',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    borderSide: BorderSide(
                      color: kBlueColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget inputEdisi() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Edisi'),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: edisi,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Masukkan Edisi Buku',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    borderSide: BorderSide(
                      color: kBlueColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget inputPenerbit() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Penerbit'),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: penerbit,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Masukkan Penerbit Buku',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      defaultRadius,
                    ),
                    borderSide: BorderSide(
                      color: kBlueColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget submitButton() {
        return Container(
          width: double.infinity,
          height: 55,
          margin: const EdgeInsets.only(bottom: 10),
          child: TextButton(
            onPressed: () {
              tambahData();
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              backgroundColor: kBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
            child: Text(
              'Submit',
              style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
          ),
        );
      }

      Widget cancelButton() {
        return SizedBox(
          width: double.infinity,
          height: 55,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              backgroundColor: kRedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
            child: Text(
              'Cancel',
              style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            inputNamaBuku(),
            inputEdisi(),
            inputPenerbit(),
            submitButton(),
            cancelButton(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
