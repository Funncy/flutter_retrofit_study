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

  @GET("/NewsModels/{id}")
  Future<NewsModel> getNewsModel(@Path("id") String id);

  @GET('/demo')
  Future<String> queries(@Queries() Map<String, dynamic> queries);

  @GET("https://httpbin.org/get")
  Future<String> namedExample(
      @Query("apikey") String apiKey,
      @Query("scope") String scope,
      @Query("type") String type,
      @Query("from") int from);

  @PATCH("/NewsModels/{id}")
  Future<NewsModel> updateNewsModelPart(
      @Path() String id, @Body() Map<String, dynamic> map);

  @PUT("/NewsModels/{id}")
  Future<NewsModel> updateNewsModel(
      @Path() String id, @Body() NewsModel NewsModel);

  @DELETE("/NewsModels/{id}")
  Future<void> deleteNewsModel(@Path() String id);

  @POST("/NewsModels")
  Future<NewsModel> createNewsModel(@Body() NewsModel NewsModel);

  @POST("http://httpbin.org/post")
  Future<void> createNewNewsModelFromFile(@Part() File file);

  @POST("http://httpbin.org/post")
  @FormUrlEncoded()
  Future<String> postUrlEncodedFormData(@Field() String hello);
}
