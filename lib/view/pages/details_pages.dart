import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/controller/future_provider.dart';
import 'package:newsapp/model/detailsdata.dart';
import 'package:newsapp/view/pages/home_pages.dart';
import 'package:newsapp/view/widgets/colors.dart';
import 'package:share_plus/share_plus.dart';

List data = [
  ["comment.png", Appcolors.comment_bg, Appcolors.deep_blue],
  ["share.png", Appcolors.share_bg, Color(0xFFAB85E9)],
  ["star.png", Appcolors.star_bg, Colors.yellow],
  ["menu.png", Appcolors.menu_bg, Color(0xFF4FE4D1)]
];

class Details_page extends StatelessWidget {
  final Detailspagedata detailspagedata;
  const Details_page({Key? key, required this.detailspagedata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //nav var
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Home_page()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 50, left: 20),
              child: Icon(
                Icons.arrow_back,
                color: Appcolors.deep_blue,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: detailspagedata.publishedAt,
                      style: TextStyle(color: Colors.black54, fontSize: 18.sp)),
                  TextSpan(
                      text: "",
                      style: TextStyle(color: Colors.black54, fontSize: 18.sp)),
                ])),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  detailspagedata.title,
                  textAlign: TextAlign.justify,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 200.h,
                margin: EdgeInsets.only(left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                        image: NetworkImage(detailspagedata.urlToImage))),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    detailspagedata.description + detailspagedata.content,
                    //"In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.available.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 19.sp),
                  ))
            ],
          ))),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(data.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 50,
                        width: index == 0 ? 190 : 50,
                        decoration: BoxDecoration(
                            color: data[index][1],
                            borderRadius: BorderRadius.circular(50.r)),
                        child: index == 0
                            ? Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assets/images/" + data[index][0]),
                                      color: data[index][2],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Add a comment',
                                      style: TextStyle(
                                          color: data[index][2],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  if (index == 1) {
                                     Share.share(detailspagedata.url);
                                  }
                                },
                                child: Center(
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/" + data[index][0]),
                                    color: data[index][2],
                                  ),
                                ),
                              ),
                      );
                    }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
