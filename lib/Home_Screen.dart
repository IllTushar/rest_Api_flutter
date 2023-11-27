import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rest_frame_work/Controller/api_service_interface.dart';

class HomeScreen extends StatefulWidget{
  final ApiServiceInterface apiService;
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  HomeScreen(this.apiService);
}

class _HomeScreenState extends State<HomeScreen> {
  late Dio _dio;
  late Future<Response> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.apiService.fetchDate() as Future<Response>;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
       appBar: AppBar(title: const Text("Flutter RestApi"),),
      body: FutureBuilder(future: _future, builder: (context,AsyncSnapshot<Response>snapShot){
        if (snapShot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapShot.hasError) {
          return Text('Error: ${snapShot.error}');
        }else{
          List<dynamic> todos = snapShot.data!.data;
          return ListView.builder(itemCount: todos.length,itemBuilder: (ctx,index){
            return ListTile(title: Text(todos[]),);
          },);
        }
      }),
    );
  }
}