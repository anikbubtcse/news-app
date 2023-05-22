import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/news_provider.dart';
import 'breaking_news_detail_screen.dart';

class BreakingNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
        child: Column(
          children: [
            Consumer<NewsProvider>(builder: (context, value, child) {
              value.getBreakingNews();
              return Expanded(
                child: ListView.builder(
                  itemCount: value.breakingNews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                BreakingNewsDetail(value.breakingNews[index])));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 5.w, right: 5.w, top: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.network(value
                                  .breakingNews[index].urlToImage
                                  .toString()),
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
                                  child: Text(value
                                      .breakingNews[index].source!.name
                                      .toString()),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Flexible(
                                    child: FittedBox(
                                        child: Text(
                                  value.breakingNews[index].publishedAt
                                      .toString(),
                                  maxLines: 1,
                                ))),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(value.breakingNews[index].title.toString()),
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
