import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter_exp/data/network/webservice/post_service.dart';
import 'package:flutter_exp/domain/model/Post.dart';

class PostRepository {
  PostRepository();

  Future<List<Post>> retrivePosts() async {
    final Response response = await PostService.getPost();
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List?)
              ?.map((post) => Post.fromJson(post))
              .toList() ??
          List.empty();
    } else {
      throw "Api call error";
    }
    /*return response.statusCode == 200
        ? (jsonDecode(response.body) as List?)
                ?.map((post) => Post.fromJson(post))
                .toList() ??
            List.empty()
        : throw "Api error";*/
  }
}
