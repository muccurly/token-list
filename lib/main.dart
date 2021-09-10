import 'package:flutter/material.dart';
import 'package:jurta_app/src/app.dart';
import 'package:jurta_app/src/data/remote/file_remote_data_source.dart';
import 'package:jurta_app/src/data/remote/property_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/repository/file_repository_impl.dart';
import 'package:jurta_app/src/data/repository/property_repository_impl.dart';

void main() async {
  final propertyRemoteDataSource = PropertyRemoteDataSourceImpl();
  final propertyRepository = PropertyRepositoryImpl(propertyRemoteDataSource);

  final fileRemoteDataSource = FileRemoteDataSource();
  final fileRepository = FileRepositoryImpl(fileRemoteDataSource);

  runApp(App(
    propertyRepository: propertyRepository,
    fileRepository: fileRepository,
  ));
}
