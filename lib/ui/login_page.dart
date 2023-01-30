import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../shared//theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    String url = 'https://belajar-api.renaldiyulvianda.my.id/api';
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    Future<void> login() async {
      try {
        var response = await Dio().post(
          '$url/login',
          data: {
            'email': email.text,
            'password': password.text,
          },
        );
        print(response);
        if (response.statusCode == 201) {
          setState(
            () {
              Navigator.pushNamed(
                context,
                '/home',
                arguments: jsonDecode(
                  response.toString(),
                ),
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
            'Login',
            style: blueTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
        ),
      );
    }

    Widget inputSection() {
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

      Widget submitButton() {
        return SizedBox(
          width: double.infinity,
          height: 55,
          child: TextButton(
            onPressed: login,
            style: TextButton.styleFrom(
              backgroundColor: kBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
            child: Text(
              'Login',
              style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
          ),
        );
      }

      Widget registerButton() {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 50,
              bottom: 73,
            ),
            child: Text(
              'Belum punya akun? Login',
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
            inputEmail(),
            inputPassword(),
            submitButton(),
            registerButton()
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
