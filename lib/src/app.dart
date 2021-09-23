import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jurta_app/l10n/l10n.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/business_logic/home/bloc/home_bloc.dart';
import 'package:jurta_app/src/business_logic/search/bloc/search_bloc.dart';
import 'package:jurta_app/src/business_logic/sort/cubit/sort_cubit.dart';
import 'package:jurta_app/src/data/repository/i_address_repository.dart';
import 'package:jurta_app/src/data/repository/i_dictionary_repository.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/data/repository/i_settings_repository.dart';
import 'package:jurta_app/src/ui/home_page/home_page_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'business_logic/hots/hots.dart';
import 'business_logic/news/news.dart';
import 'business_logic/search_mini/search_mini.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.propertyRepository,
    required this.dictionaryRepository,
    required this.settingsRepository,
    required this.addressRepository,
  }) : super(key: key);

  final IPropertyRepository propertyRepository;
  final IDictionaryRepository dictionaryRepository;
  final ISettingsRepository settingsRepository;
  final IAddressRepository addressRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IPropertyRepository>(
          create: (context) => propertyRepository,
        ),
        RepositoryProvider<IDictionaryRepository>(
          create: (context) => dictionaryRepository,
        ),
        RepositoryProvider<ISettingsRepository>(
          create: (context) => settingsRepository,
        ),
        RepositoryProvider<IAddressRepository>(
          create: (context) => addressRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SortCubit>(create: (context) => SortCubit()),
          BlocProvider<FilterBloc>(
            create: (context) => FilterBloc(
              dictionaryRepository: dictionaryRepository,
            )..add(ObjectTypesLoad()),
          ),
          BlocProvider<HotsBloc>(
            create: (context) => HotsBloc(
              propertyRepository: propertyRepository,
            )..add(LoadHots()),
          ),
          BlocProvider<NewsBloc>(
            create: (context) => NewsBloc(
              propertyRepository: propertyRepository,
            )..add(LoadNews()),
          ),
          BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(
              addressRepository: addressRepository,
              dictionaryRepository: dictionaryRepository,
              propertyRepository: propertyRepository,
              sortCubit: BlocProvider.of<SortCubit>(context),
            )
              ..add(GetOrLoadObjectTypes())
              ..add(LoadCities())
              ..add(LoadConditions()),
          ),
          BlocProvider<SearchMiniBloc>(
            create: (context) => SearchMiniBloc(
              dictionaryRepository: dictionaryRepository,
              propertyRepository: propertyRepository,
              sortCubit: BlocProvider.of<SortCubit>(context),
            )..add(SearchMiniGetObjectTypes()),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              propertyRepository: propertyRepository,
              settingsRepository: settingsRepository,
              filterBloc: BlocProvider.of<FilterBloc>(context),
            )..add(LoadProperties()),
          ),
        ],
        child: AppView(),
      ),
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.locales,
      home: HomePageWidget(),
    );
  }
}
