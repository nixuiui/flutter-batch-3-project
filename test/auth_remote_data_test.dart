import 'package:dio/dio.dart';
import 'package:flutter_batch_3_project/data/remote_data/auth_remote_data.dart';
import 'package:flutter_batch_3_project/data/remote_data/network_service/network_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_remote_data_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {

  late MockNetworkService mockNetworkService;
  late AuthRemoteDataImpl authRemoteData;

  setUp(() {
    mockNetworkService = MockNetworkService();
    authRemoteData = AuthRemoteDataImpl(mockNetworkService);
  });

  group("AuthRemoteData.login()", () {

    test("Return AuthResponseModel when login is successfull", () async {
      const email = "admin@gmail.com";
      const password = "123456";
      const path = "/api/auth/login";

      final mockResponseData = {
        "data": {
          "user": {
            "name": "Admin",
            "email": "admin@gmail.com"
          },
          "access_token": "random_access_token",
        }
      };

      final mockResponse = Response(
        requestOptions: RequestOptions(path: path),
        statusCode: 200,
        data: mockResponseData
      );

      when(mockNetworkService.post(
        url: path,
        data: anyNamed("data"),
      )).thenAnswer((_) async => mockResponse);

      final result = await authRemoteData.postLogin(email, password);

      expect(result.accessToken, "random_access_token");
      expect(result.user?.email, "admin@gmail.com");
      expect(result.user?.name, "Admin");
      verify(mockNetworkService.post(
        url: path,
        data: {
          "email": email,
          "password": password
        }
      )).called(1);
    });

    test("throw Exception when login Failed", () async {
      const email = "admin@gmail.com";
      const password = "123456";
      const path = "/api/auth/login";

      when(mockNetworkService.post(
        url: path,
        data: anyNamed("data"),
      )).thenThrow(Exception("Login Failed"));

      expect(() => authRemoteData.postLogin(email, password), throwsException);
      verify(mockNetworkService.post(
        url: path,
        data: {
          "email": email,
          "password": password
        }
      )).called(1);
      
    });

  });

}