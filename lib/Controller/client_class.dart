import 'package:dio/dio.dart';
import 'package:rest_frame_work/Controller/api_service_interface.dart';
import 'package:rest_frame_work/model/model_class.dart';

class ApiService implements ApiServiceInterface {
  late Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(
        baseUrl: "https://reqres.in/",
        connectTimeout: Duration(milliseconds: 5000),
        receiveTimeout: Duration(milliseconds: 5000)));
  }

  @override
  Future<ModelClass> fetchDate() async{
    // TODO: implement fetchDate
    try {
      final response = await _dio.get('/your_endpoint'); // Replace with your actual endpoint

      // Check if the response status code is 200
      if (response.statusCode == 200) {
        // Assuming ModelClass.fromJson is a factory method to convert JSON to ModelClass
        return ModelClass.fromJson(response.data);
      } else {
        throw Exception('Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }
}
