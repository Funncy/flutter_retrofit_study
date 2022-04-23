import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_study/repository/hacker_news_repository.dart';

import '../model/news_model.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late final HackerNewsRepository _hackerNewsRepository;

  @override
  void initState() {
    Dio dio = Dio();

    _hackerNewsRepository = HackerNewsRepository(dio);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _hackerNewsRepository.getTopNews(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final ids = snapshot.data as List<int>;

          return ListView.builder(
            itemBuilder: (_, index) {
              return FutureBuilder(
                  future: _hackerNewsRepository.getNewsModelDetail(ids[index]),
                  builder: ((_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data is NewsModel) {
                      return _newsCardWidget(snapshot.data as NewsModel);
                    }

                    return Text("${snapshot.data}");
                  }));
            },
            itemCount: ids.length,
          );
        },
      ),
    );
  }

  Widget _newsCardWidget(NewsModel news) {
    return Column(children: [
      Text(news.id.toString()),
      Text(news.title),
      Text(news.url),
    ]);
  }
}
