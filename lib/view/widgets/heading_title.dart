import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Row_title extends StatelessWidget {
  final String string1;
  final String string2;

  const Row_title({Key? key,required this.string1,required this.string2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w,left: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            string1,
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            string2,
            style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
