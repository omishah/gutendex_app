import 'dart:developer';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gutendex_app/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';

abstract class Helper {
  // open link in external browser
  static Future<void> openLink(String url) async {
    if (!await launchUrlString(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  // make http GET request call
  static Future<ApiResponse> httpGetRequest(String url) async {
    final headers = {HttpHeaders.acceptHeader: 'application/json'};

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return ApiResponse.fromJson(body);
      } else {
        throw HttpException(
          'Http request failed: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      log('HTTP Error: $e');
      throw Exception('Failed to fetch books: $e');
    }
  }

  // show snackbar at ease
  static void showSnackbar(BuildContext context, {String? text}) {
    final snackBar = SnackBar(content: Text(text ?? 'Something went wrong!'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
