import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
//للحصول على المسار
Future<String> get localPath async{
  final path=await getApplicationDocumentsDirectory();
  return path.path;
}
//انشاء الملف
Future<File> get localFile async{
  //مسار الفايل
  final file=await localPath;
  //انشاء الفايل
  return File('$file/data.txt');
}


Future<File> writeData(String value) async{
  //مسار الفايل
  final file=await localFile;
  //انشاء الفايل
  return file.writeAsString(value);
}


Future<String> readData() async{
  try {
    final file = await localFile;
    String data =await file.readAsString();
  return data;
  }catch(e){
    return 'erroe: empty file';
  }
}