import 'package:flutter/material.dart';
import 'package:jurta_app/src/app.dart';
import 'package:jurta_app/src/data/remote/property_remote_data_source_impl.dart';
import 'package:jurta_app/src/data/repository/property_repository.dart';

void main() async {
  final propertyRemoteDataSource = PropertyRemoteDataSourceImpl();
  final propertyRepository = PropertyRepositoryImpl(propertyRemoteDataSource);

  runApp(App(propertyRepository: propertyRepository));
}
