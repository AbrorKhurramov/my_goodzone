import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_goodzone/data/models/news/news.dart';

class NewsDetailPage extends StatelessWidget {
  final News news;

  const NewsDetailPage(this.news);

  checkNull(BuildContext context) {
    if (news.title != null) {
      return ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(news.previewImage!, height: double.infinity, fit: BoxFit.fill),
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              news.title!,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              DateFormat("dd MMM yyyy").format(DateTime.parse(news.formattedDate.toString())),
              maxLines: 1,
              style: const TextStyle(fontSize: 17, color: Colors.grey),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                child: Html(
                  style: {
                    "full_text": Style(
                      fontSize: const FontSize(20.0),
                    ),
                  },
                  data: news.fullText ?? '',
                ),
              ))
        ],
      );
    } else
      return Container(
        child: Center(
          child: Text('Malumot yoq'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          title: Center(
            child: Text(
              'Новости',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
        body: checkNull(context));
  }
}
