import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = 'https://belajar-api.renaldiyulvianda.my.id/api';
  List<dynamic> buku = [];

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)?.settings.arguments;

    Future.delayed(
      const Duration(seconds: 3),
      () async {
        Dio()
            .get(
              '$url/master/buku',
              options: Options(
                headers: {
                  'Accept': 'application/json',
                  'Authorization': 'Bearer ${user['token']}'
                },
              ),
            )
            .then(
              (res) => setState(
                () {
                  buku = res.data['data']['data'];
                },
              ),
            );
      },
    );
    print(buku);

    Future<void> hapusData(id) async {
      try {
        var response = await Dio().delete(
          '$url/master/buku/hapus/$id',
          options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${user['token']}'
            },
          ),
        );

        print(response);
      } catch (e) {
        print(e);
      }
    }

    Widget header() {
      return Container(
          margin: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, top: 30),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, ${user['data']['name']}',
                    style: blueTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${user['data']['email']}',
                    style:
                        greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
                  )
                ],
              ),
            )
          ]));
    }

    Widget dataBuku() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Data Buku',
                  style: blueTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/add', arguments: user);
                  },
                  child: Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tambah',
                          style: whiteTextStyle.copyWith(fontWeight: semiBold),
                        ),
                        Icon(
                          CupertinoIcons.add,
                          color: kWhiteColor,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: buku
                  .map(
                    (buku) => Container(
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: kBlueColor, width: 2)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${buku['judul']}',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: semiBold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Edisi Ke - ${buku['edisi_ke']}',
                                  style:
                                      greyTextStyle.copyWith(fontWeight: light),
                                ),
                                Text(
                                  '${buku['penerbit_id']}',
                                  style:
                                      greyTextStyle.copyWith(fontWeight: light),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/edit',
                                        arguments: {
                                          'buku': buku,
                                          'token': user
                                        });
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: kBlueColor,
                                      borderRadius:
                                          BorderRadius.circular(defaultRadius),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.pencil,
                                          color: kWhiteColor,
                                          size: 25,
                                        ),
                                        Text(
                                          'Edit',
                                          style: whiteTextStyle.copyWith(
                                              fontWeight: semiBold),
                                        )
                                      ],
                                    ),
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  hapusData(buku['id']);
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: kRedColor,
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.delete,
                                        color: kWhiteColor,
                                        size: 25,
                                      ),
                                      Text(
                                        'Delete',
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: semiBold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          header(),
          dataBuku(),
        ],
      ),
    );
  }
}
