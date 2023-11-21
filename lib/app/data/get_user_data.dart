import 'package:dio/dio.dart';

class GetUserDataService {
  Future getData() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      // print(response.data);
      var responseBody = response.data;
      return responseBody;
    } on DioException catch (e) {
      var error = e.response!.data;
      return error;
    }
  }

  Future addData() async {
    try {
      var response =
          await Dio().post('https://jsonplaceholder.typicode.com/users',
          data:{
  "id": 1,
  "name": "kalvin Graham",
  "username": "gert",
  "email": "kalvin@april.biz",
  "address": {
    "street": "bhulas Light",
    "suite": "Apt. 342",
    "city": "Jackie chan",
    "zipcode": "*&^&&&-3874",
    "geo": {
      "lat": "-37.3159",
      "lng": "81.1496"
    }
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegerd.org",
  "company": {
    "name": "Romaguetta-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
}
          );
        print(response.statusCode);
      var responseBody = response.data;
      print('response body : $responseBody');
    } on DioException catch (e) {
      var error = e.response!.data;
      return error;
    }
  }

  Future deleteData(int i) async {
    try {
      print('try');
      var response =
          await Dio().delete('https://jsonplaceholder.typicode.com/users/$i');
      print(response.statusCode);
      var responseBody = response.data;
      print('response body : $responseBody');

      return responseBody;
    } on DioException catch (e) {
      print('error : ${e.message}');

      var error = e.response?.data;
      print('error : $error');
      return error;
    }
  }

Future updateData(int i) async {
    try {
      print('try');
      var response =
          await Dio().put('https://jsonplaceholder.typicode.com/users/$i',data: {
  "id": 1,
  "name": "kalvin Graham",
  "username": "gert",
  "email": "kalvin@april.biz",
  "address": {
    "street": "bhulas Light",
    "suite": "Apt. 342",
    "city": "Jackie chan",
    "zipcode": "*&^&&&-3874",
    "geo": {
      "lat": "-37.3159",
      "lng": "81.1496"
    }
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegerd.org",
  "company": {
    "name": "Romaguetta-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
} );
      print(response.statusCode);
      var responseBody = response.data;
      print('response body : $responseBody');

      return responseBody;
    } on DioException catch (e) {
      print('error : ${e.message}');

      var error = e.response?.data;
      print('error : $error');
      return error;
    }
  }  
}
