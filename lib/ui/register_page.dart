import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../shared//theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    String url = 'https://belajar-api.renaldiyulvianda.my.id/api';
    TextEditingController nama = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController password2 = TextEditingController();

    Future<void> register() async {
      try {
        var response = await Dio().post(
          '$url/register',
          data: {
            'name': nama.text,
            'email': email.text,
            'password': password.text,
            'c_password': password2.text,
          },
        );

        if (response.statusCode == 201) {
          setState(
            () {
              Navigator.pushNamed(
                context,
                '/',
              );
            },
          );
        }
      } catch (e) {
        print(e);
      }
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Center(
          child: Text(
            'Buat Akun',
            style: blueTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget inputNama() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nama Lengkap'),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: nama,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Nama Lengkap Anda',
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

      Widget inputEmail() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email'),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: email,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Email Anda',
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

      Widget inputPassword() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Password'),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: password,
                cursorColor: kBlackColor,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password Anda',
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

      Widget inputKonfirmasiPassword() {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Konfirmasi Password'),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: password2,
                cursorColor: kBlackColor,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Konfirmasi Password Anda',
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
        return SizedBox(
          width: double.infinity,
          height: 55,
          child: TextButton(
            onPressed: register,
            style: TextButton.styleFrom(
              backgroundColor: kBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
            child: Text(
              'Get Started',
              style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
          ),
        );
      }

      Widget loginButton() {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 50,
              bottom: 73,
            ),
            child: Text(
              'Sudah punya akun? Login',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
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
            inputNama(),
            inputEmail(),
            inputPassword(),
            inputKonfirmasiPassword(),
            submitButton(),
            loginButton()
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
