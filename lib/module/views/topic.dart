import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/helper/api_helper.dart';

import 'detail.dart';

class topic extends StatefulWidget {
  topic({super.key});

  @override
  State<topic> createState() => _topicState();
}

String? Search = "tesla";

class _topicState extends State<topic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                        Search = "tata";
                      });
                    },
                    child: Text("Tata"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        Search = "mahindra";
                      });
                    },
                    child: const Text("Mahindra"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        Search = "cricket";
                      });
                    },
                    child: const Text("Cricket"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        Search = "study";
                      });
                    },
                    child: const Text("Study"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: ApiHelper.apiHelper.topicdata(cat: Search!),
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
