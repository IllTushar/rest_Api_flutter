import "package:rest_frame_work/model/model_class.dart";
abstract class ApiServiceInterface{
  Future<ModelClass> fetchDate();
}