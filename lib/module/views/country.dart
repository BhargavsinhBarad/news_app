import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/module/views/detail.dart';

import '../../utils/helper/api_helper.dart';

class country extends StatefulWidget {
  country({super.key});

  @override
  State<country> createState() => _countryState();
}

class _countryState extends State<country> {
  String? Search = "us";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        Search = "in";
                      });
                    },
                    child: const Text("India"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        Search = "us";
                      });
                    },
                    child: const Text("USA"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        Search = "sa";
                      });
                    },
                    child: const Text("South Africa"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        Search = "nz";
                      });
                    },
                    child: const Text("New Zealand"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: ApiHelper.apiHelper.countrydata(con: Search!),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List? data = snapshot.data;
                    return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(details(), arguments: data[i]['url']);
                              },
                              child: Row(
                                children: [
                                  (data[i]['urlToImage'] == null)
                                      ? Container(
                                          margin: const EdgeInsets.all(15),
                                          height: Get.height * 0.15,
                                          width: Get.width * 0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: const DecorationImage(
                                              image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVOJzzZHSMoGvzJeDLNIZ2pRUDTvvq4h4ZyyUGoN2ZPS2IbJ1YcUtchOearLLvjlzD6v4&usqp=CAU",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.all(15),
                                          height: Get.height * 0.15,
                                          width: Get.width * 0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "${data[i]['urlToImage']}",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 12, top: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${data[i]['title']}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          (data[i]['author'] == null)
                                              ? const Text("")
                                              : Text(
                                                  "${data[i]['author']}",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Divider(),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
