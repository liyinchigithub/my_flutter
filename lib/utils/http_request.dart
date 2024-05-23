import 'package:dio/dio.dart';  // 导入 Dio 库
import 'dart:io';  // 导入 Dart 的 IO 库，用于文件操作


//工具类-http请求
class HttpRequest {
  Dio _dio = Dio();  // 初始化 Dio 对象

  // 构造函数
  HttpRequest() {
    _dio.options.headers = {
      'Content-Type': 'application/json',  // 设置内容类型为 JSON
      'Accept-Encoding': 'gzip, deflate, br, zstd',  // 设置接受的编码方式
      'Accept': '*/*',  // 设置接受所有类型的响应
      'Connection': 'keep-alive',  // 设置连接为持久连接
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.1106 Safari/537.3',  // 设置用户代理
      'Host': 'awgapi.homeking365.com',  // 设置请求的主机名
      'Origin': 'https://awgapi.homeking365.com',  // 设置请求的源地址
      'Referer': 'https://awgapi.homeking365.com/',  // 设置引用页
      'Sec-Fetch-Dest': 'empty',  // 设置请求的目的地为 empty
      'Sec-Fetch-Mode': 'cors',  // 设置请求的模式为跨源资源共享
      'Sec-Fetch-Site': 'cross-site',  // 设置请求的站点为跨站
      // 移除 Content-Length
    };
  }

  // GET请求方法，带参数
  Future<Response> getWithParams(String url, Map<String, dynamic> params) async {
    try {
      Response response = await _dio.get(url, queryParameters: params);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // GET请求方法，只带查询字符串
  Future<Response> getWithQuery(String url, String query) async {
    try {
      Response response = await _dio.get(url + '?' + query);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // POST请求方法
  // JSON 类型的 POST 请求
  Future<Response> postJson(String url, dynamic data) async {
    try {
      Response response = await _dio.post(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // form-data 类型的 POST 请求
  Future<Response> postFormData(String url, Map<String, dynamic> data) async {
    try {
      FormData formData = FormData.fromMap(data);
      Response response = await _dio.post(url, data: formData);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // multipart 类型的 POST 请求
  Future<Response> postMultipart(String url, Map<String, dynamic> data) async {
    try {
      FormData formData = FormData();
      data.forEach((key, value) {
        if (value is MultipartFile) {
          formData.files.add(MapEntry(key, value));
        } else {
          formData.fields.add(MapEntry(key, value.toString()));
        }
      });
      Response response = await _dio.post(url, data: formData);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // 文件上传方法
  Future<Response> uploadFile(String url, File file, {Map<String, dynamic>? data}) async {
    try {
      String fileName = file.path.split('/').last;  // 从文件路径中获取文件名
      FormData formData = FormData.fromMap({
        ...data ?? {},  // 将额外数据添加到 FormData
        "file": await MultipartFile.fromFile(file.path, filename: fileName),  // 将文件添加到 FormData
      });

      Response response = await _dio.post(url, data: formData);  // 发送 POST 请求进行文件上传
      return response;  // 返回响应
    } catch (e) {
      rethrow;  // 如果发生异常，重新抛出
    }
  }
}