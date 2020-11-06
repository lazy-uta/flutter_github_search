
import 'package:github_search/user.dart';

class SearchResult{
  final List<SearchResultItem> items;

  const SearchResult({this.items});

  static SearchResult fromJson(Map<String, dynamic> json){
    final items = (json['items'] as List<dynamic>)
    .map((dynamic item) => 
    SearchResultItem.fromJson(item as Map<String, dynamic> ))
    .toList();
    return SearchResult(items: items);
  }

}

class SearchResultItem{
  final String fullName;
  final String htmlUrl;
  final GithubUser owner;

  const SearchResultItem({this.fullName, this.htmlUrl, this.owner});

  static SearchResultItem fromJson(dynamic json){
    return SearchResultItem(
      fullName: json['full_name'] as String,
      htmlUrl: json['html_url'] as String,
      owner : GithubUser.fromJson(json['owner']),
    );
  }
}