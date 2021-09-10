import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/home/bloc/home_bloc.dart';
import 'package:jurta_app/src/data/repository/i_file_repository.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/ui/home_page/home_page_widget.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.propertyRepository,
    required this.fileRepository,
  }) : super(key: key);

  final IPropertyRepository propertyRepository;
  final IFileRepository fileRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => propertyRepository,
      child: BlocProvider(
          create: (context) => HomeBloc(
                propertyRepository: propertyRepository,
                // fileRepository: fileRepository,
              )..add(LoadProperties()),
          child: AppView()),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageWidget(),
    );
  }
}
