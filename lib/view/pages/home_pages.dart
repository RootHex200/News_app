import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:newsapp/controller/future_provider.dart';
import 'package:newsapp/model/detailsdata.dart';
import 'package:newsapp/view/pages/details_pages.dart';
import 'package:newsapp/view/widgets/colors.dart';
import 'package:newsapp/view/widgets/heading_title.dart';

List list1_data = [
  ["world.png", Appcolors.deep_blue, "World"],
  ['tech.png', Appcolors.red, "Tech"],
  ['music.png', Appcolors.sky, "Music"]
];
List list2_data = [
  ['travel.png', Appcolors.orange, "Travel"],
  ['kitchen.png', Appcolors.tron_blue, "Kitchen"],
  ['fashion.png', Appcolors.deep_pureple, "Fashions"]
];

class Home_page extends HookConsumerWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var queary = useState('all');
    var config = ref.watch(NewsProvider(queary.value));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, right: 20, left: 20),
              child: Text(
                'Explore',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),

            //search bar
            Padding(
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              child: CupertinoSearchTextField(
                onSubmitted: (value) {
                  queary.value = value;
                  print(queary.value.runtimeType);
                },
                itemSize: 25.0,
                style: TextStyle(color: Colors.black, fontSize: 20.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.2)),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),

            Padding(
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              child: Row(
                children: [
                Container(
                  height: 164,
                  width: 185,
                  decoration: BoxDecoration(
                      color: Appcolors.deep_pureple,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("What i learned by shining shoes in San Francisco",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Center(
                                    child: Text(
                                  "FASHION",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17.sp),
                                )),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.star_border,
                                size: 30.sp,
                                color: Colors.grey,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  height: 150,
                  width: 150,
                  padding: EdgeInsets.only(left: 15, top: 20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 170, 169, 163),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("What i learned by shining shoes in San Francisco",
                            maxLines: 4,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 239, 71, 5)
                                      .withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                  child: Text(
                                "FASHION",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                              )),
                            ),
                            Expanded(child: Container()),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.star_border,
                                size: 25.sp,
                                color: Colors.yellow,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),

            SizedBox(
              height: 20.h,
            ),
            Row_title(string1: "Hot topics", string2: "see all"),
            SizedBox(
              height: 15.h,
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: list1_data[index][1],
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage(
                                    "assets/images/" + list1_data[index][0])),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              list1_data[index][2].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      );
                    })),

            SizedBox(
              height: 10.h,
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: list2_data[index][1],
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage(
                                    "assets/images/" + list2_data[index][0])),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              list2_data[index][2].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      );
                    })),

            SizedBox(
              height: 20.h,
            ),

            Row_title(string1: "Your news", string2: "see all"),

            config.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Text("Error $err"),
                data: (config) {
                  return Container(
                    height: 600,
                    child: ListView.builder(
                        itemCount: config.articles!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              final data = Detailspagedata(
                                  author:
                                      config.articles![index].author.toString(),
                                  title:
                                      config.articles![index].title.toString(),
                                  description: config
                                      .articles![index].description
                                      .toString(),
                                  url: config.articles![index].url.toString(),
                                  urlToImage: config.articles![index].urlToImage
                                      .toString(),
                                  publishedAt: config
                                      .articles![index].publishedAt
                                      .toString(),
                                  content: config.articles![index].content
                                      .toString());

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details_page(
                                            detailspagedata: data,
                                          )));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 20, left: 20, right: 20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          image: DecorationImage(
                                              image: NetworkImage(config
                                                  .articles![index].urlToImage
                                                  .toString()),
                                              fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 170,
                                          child: Text(
                                            config.articles![index].title
                                                .toString(),
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 190,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 15.h,
                                                width: 60.w,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 249, 230, 203),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    "TRAVEL",
                                                    style: TextStyle(
                                                        color:
                                                            Appcolors.orange),
                                                  ),
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              Container(
                                                  child: Text(
                                                "2m",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16.sp),
                                              ))
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
