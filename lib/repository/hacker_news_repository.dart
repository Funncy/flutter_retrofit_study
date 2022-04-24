import 'dart:io';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_study/model/news_model.dart';

part 'hacker_news_repository.g.dart';

@RestApi(baseUrl: 'https://hacker-news.firebaseio.com/v0')
abstract class HackerNewsRepository {
  factory HackerNewsRepository(Dio dio, {String? baseUrl}) =
      _HackerNewsRepository;

  @GET('/topstories.json')
  Future<List<int>> getTopNews();

  @GET('/item/{id}.json')
  Future<NewsModel> getNewsModelDetail(@Path() int id);
}
