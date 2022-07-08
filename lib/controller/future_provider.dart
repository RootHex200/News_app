import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/model/newdata.dart';
import '../config/config.dart';
final NewsProvider =
    StreamProvider.family<Newdata, String>((ref, value) async* {
  final date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  var response = await Dio().get(
      "https://newsapi.org/v2/everything?q=${value}&from=${date}&sortBy=publishedAt&apiKey=${API_KEY}");
  if (response.statusCode == 200 && response.data != null) {
    yield Newdata.fromJson(response.data);
  }
});


// var response = Dio().get(
 //     "https://newsapi.org/v2/everything?q=tesla&from=2022-06-07&sortBy=publishedAt&apiKey=5b26466a8f61479e84d5b4929da86e99");
