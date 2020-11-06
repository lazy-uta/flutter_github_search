
import 'dart:convert';

import 'package:github_search/search_result.dart';
import 'package:github_search/search_result_error.dart';
import 'package:http/http.dart'as http;

class GithubClient{
  final String baseUrl;
  final http.Client httpClient;

  GithubClient({
    http.Client httpClient,
    this.baseUrl = "https://api.github.com/search/repositories?q="
  }) : this.httpClient = httpClient ?? http.Client();

  Future<SearchResult> search (String term) async {
    final response = await httpClient.get(Uri.parse("$baseUrl$term"));
    final result = json.decode(response.body);

    if(response.statusCode == 200){
      return SearchResult.fromJson(result);
    }else{
      throw SearchResultError.fromJson(result);
    }
  }


}