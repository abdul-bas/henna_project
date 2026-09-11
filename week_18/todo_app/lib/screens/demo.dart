import 'dart:convert';

import 'package:http/http.dart' as http;

demo() async {
  final uri = '';
  final url = Uri.parse(uri);
  final response =
      await http.post(url, headers: {'Content-Type': 'application/json'},body: jsonEncode({
        'name':'basith', 'place':''
      }));
}
