import '../postModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostData {
  Future<List<PostModel>> fetchPost() async {
    List<PostModel> posts = [];
    var response = await http.get('https://jsonplaceholder.typicode.com/posts');
    if(response.statusCode == 200) {
      var data = json.decode(response.body);
      data.map((post) => posts.add(PostModel.fromJson(post))).toList();
      return posts;
    }
  }
}