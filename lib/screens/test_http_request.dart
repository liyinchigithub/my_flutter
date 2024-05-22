import 'package:flutter/material.dart';
import 'dart:io';
import '../utils/http_request.dart';
import '../widgets/show_toast.dart';
// import 'package:file_picker/file_picker.dart';

class TestHttpRequest extends StatefulWidget {
  @override
  _TestHttpRequestState createState() => _TestHttpRequestState();
}

class _TestHttpRequestState extends State<TestHttpRequest> {
  // 控制器
  final TextEditingController _urlController = TextEditingController(text: "https://awgapi.homeking365.com/StaffWear/CheckStaffPhone");
  final TextEditingController _paramsController = TextEditingController(text: "phone=15900000000");
  final TextEditingController _queryController = TextEditingController(text: "phone=15900000000");
  final TextEditingController _jsonController = TextEditingController(text: '{"phone":"15900000000"}');
  final TextEditingController _formDataController = TextEditingController(text: "phone=15900000000");
  final HttpRequest _httpRequest = HttpRequest();

  @override
  void dispose() {
    _urlController.dispose();// 
    _paramsController.dispose();
    _queryController.dispose();
    _jsonController.dispose();
    _formDataController.dispose();
    super.dispose();
  }

  // Future<void> _pickFileAndUpload() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //     _performPostMultipart(file);  // 直接调用上传方法
  //   } else {
  //     print('未选择文件。');
  //   }
  // }

  // 执行带参数的GET请求
  void _performGetWithParams() async {
    try {
      var response = await _httpRequest.getWithParams(_urlController.text, { 'phone': _paramsController.text });
      print('GET with Params Response: ${response.data}');
      showToast('GET with Params Response: ${response.data}');
    } catch (e) {
      print('Failed to make GET request with params: $e');
      showToast('Failed to make GET request with params: $e');
    }
  }
  // 执行带查询字符串的GET请求
  void _performGetWithQuery() async {
    try {
      var response = await _httpRequest.getWithQuery(_urlController.text, _queryController.text);
      print('GET with Query Response: ${response.data}');
      showToast('GET with Query Response: ${response.data}');
    } catch (e) {
      print('Failed to make GET request with query: $e');
      showToast('Failed to make GET request with query: $e');
    }
  }
  // 执行JSON类型的POST请求
  void _performPostJson() async {
    try {
      var response = await _httpRequest.postJson(_urlController.text, _jsonController.text);
      print('POST JSON Response: ${response.data}');
      showToast('POST JSON Response: ${response.data}');
    } catch (e) {
      print('Failed to make POST JSON request: $e');
      showToast('Failed to make POST JSON request: $e');
    }
  }

   // 执行form-data类型的POST请求
  void _performPostFormData() async {
    try {
      var response = await _httpRequest.postFormData(_urlController.text, { 'file': _formDataController.text });
      print('POST FormData Response: ${response.data}');
      showToast('POST FormData Response: ${response.data}');
    } catch (e) {
      print('Failed to make POST FormData request: $e');
      showToast('Failed to make POST FormData request: $e');
    }
  }

  // 执行multipart类型的POST请求
  // void _performPostMultipart(File file) async {
  //   try {
  //     var multipartFile = await MultipartFile.fromFile(file.path, filename: file.path.split('/').last);
  //     var response = await _httpRequest.postMultipart(_urlController.text, {'file': multipartFile});
  //     print('POST Multipart 响应: ${response.data}');
  //     showToast('POST Multipart 响应: ${response.data}');
  //   } catch (e) {
  //     print('POST Multipart 请求失败: $e');
  //     showToast('POST Multipart 请求失败: $e');
  //   }
  // }
  // 布局
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Request Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter URL',
                suffixIcon:IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _urlController.clear(),
                ),
              ),
            ),
            TextField(
              controller: _paramsController,
              decoration: InputDecoration(
                labelText: 'Enter Params (key=value)',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _paramsController.clear(),
                ),
              ),
            ),
            TextField(
              controller: _queryController,
              decoration: InputDecoration(
                labelText: 'Enter Query (key=value)',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _queryController.clear(),
                ),
              ),
            ),
            TextField(
              controller: _jsonController,
              decoration: InputDecoration(
                labelText: 'Enter JSON Data',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _jsonController.clear(),
                ),
              ),
            ),
            TextField(
              controller: _formDataController,
              decoration: InputDecoration(
                labelText: 'Enter Form Data or File Path',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _formDataController.clear(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _performGetWithParams,
              child: Text('Perform GET with Params'),
            ),
            ElevatedButton(
              onPressed: _performGetWithQuery,
              child: Text('Perform GET with Query'),
            ),
            ElevatedButton(
              onPressed: _performPostJson,
              child: Text('Perform POST with JSON'),
            ),
            ElevatedButton(
              onPressed: _performPostFormData,
              child: Text('Perform POST with Form Data'),
            ),
          //  ElevatedButton(
          //   onPressed: _pickFileAndUpload,
          //   child: Text('选择图片并上传'),
          // ),
          ],
        ),
      ),
    );
  }
}