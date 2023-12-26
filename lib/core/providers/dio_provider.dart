
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider=Provider(
  (ref) => Dio( BaseOptions(baseUrl: "https://651057b03ce5d181df5d2a2c.mockapi.io/app")
  ),
  );