import 'package:dio/dio.dart';
import 'package:fan_simple_app/data/remote/wrapper/api_response.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import '../../model/user.dart';
import '../../utils/helper/secure_storage_manager.dart';
import 'environment.dart';
import 'interceptor/dio.dart';

part 'api_services.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static Future<RestClient> create({
    Map<String, dynamic> headers = const {},
    Duration connectTimeout = const Duration(milliseconds: 30000),
    Duration receiveTimeout = const Duration(milliseconds: 30000),
  }) async {
    final defHeader = Map<String, dynamic>.from(headers);
    defHeader["Accept"] = "application/json";

    // String? token = await SecureStorageManager().getToken();
    // defHeader["Authorization"] = "Bearer ${token ?? ""}";
    // debugPrint("header $defHeader");

    return RestClient(
      await AppDio().getDIO(
          headers: defHeader,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout),
      baseUrl: ConfigEnvironments.getEnvironments().toString(),
    );
  }

  @PUT("/users/{id}.json")
  Future<User> addUser(
    @Path("id") String id,
    @Body() Map<String, dynamic> loginRequest,
  );

  @GET("/users/{id}.json")
  Future<User> getUser(
    @Path("id") String id,
  );
}

const client = RestClient.create;
