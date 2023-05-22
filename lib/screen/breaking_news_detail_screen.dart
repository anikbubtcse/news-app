import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/news_model.dart';

class BreakingNewsDetail extends StatelessWidget {
  final NewsModel newsDetail;

  BreakingNewsDetail(this.newsDetail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(newsDetail.title.toString()),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(newsDetail.urlToImage.toString()),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                  child: Text(newsDetail.source!.name.toString()),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Flexible(
                    child: FittedBox(
                        child: Text(
                  newsDetail.publishedAt.toString(),
                  maxLines: 1,
                ))),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(newsDetail.description.toString()),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () async {
                    final Uri _url = Uri.parse(newsDetail.url.toString());
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
                  },
                  child: const Text(
                    'Read More ...',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
