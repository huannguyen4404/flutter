import 'dart:convert';

import 'package:infinite_app/models/comment.dart';
import 'package:http/http.dart' as http;

Future<List<Comment>> fetchComments(int limit, int offset) async {
  final endPoint =
      'https://jsonplaceholder.typicode.com/comments?_start=$offset&_limit=$limit';
  final http.Client httpClient = http.Client();
  List<Comment> comments = List<Comment>();
  try {
    final response = await httpClient.get(endPoint);
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      // convert data to List of Comments.
      // TODO: how to apply parser/setter instead of below?
      comments = data
          .map((comment) => Comment(
              id: comment['id'],
              name: comment['name'],
              email: comment['email'],
              body: comment['body']))
          .toList();
    }
    return comments;
  } catch (exception) {
    print('Fetch comments failed: ${exception.toString()}');
    return comments;
  }
}
