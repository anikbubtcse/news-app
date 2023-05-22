import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:news_app/screen/all_news_detail_screen.dart';
import 'package:provider/provider.dart';
import '../provider/news_provider.dart';

class AllNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
        child: Column(
          children: [
            Consumer<NewsProvider>(builder: (context, value, child) {
              value.getAllNews();
              return Expanded(
                child: ListView.builder(
                  itemCount: value.allNews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                AllNewsDetail(value.allNews[index])));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 5.w, right: 5.w, top: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.network(
                                  value.allNews[index].urlToImage.toString()),
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
                                  child: Text(value.allNews[index].source!.name
                                      .toString()),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Flexible(
                                    child: FittedBox(
                                        child: Text(
                                  value.allNews[index].publishedAt.toString(),
                                  maxLines: 1,
                                ))),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(value.allNews[index].title.toString()),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
