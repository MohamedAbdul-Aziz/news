import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/view.dart';

import 'business_logic/Country_cubit.dart';
import 'business_logic/business_cubit.dart';
import 'business_logic/entertainment.cubit.dart';
import 'business_logic/general_cubit.dart';
import 'business_logic/health_cubit.dart';
import 'business_logic/science_cubit.dart';
import 'business_logic/sports_cubit.dart';
import 'business_logic/technology_cubit.dart';

void main() {
  runApp(BlocProvider<CountryCubit>(
      child: MyApp(), create: (context) => CountryCubit()..getnews("eg")));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(providers: [
      BlocProvider<GeneralCubit>(
        lazy: false,
        create: (context) => GeneralCubit()..getnews("eg"),
      ),
      BlocProvider<TechnologyCubit>(
        lazy: false,
        create: (context) => TechnologyCubit()..getnews("eg"),
      ),
      BlocProvider<BusinessCubit>(
        lazy: false,
        create: (context) => BusinessCubit()..getnews("eg"),
      ),
      BlocProvider<EntertainmentCubit>(
        create: (context) => EntertainmentCubit()..getnews("eg"),
      ),
      BlocProvider<HealthCubit>(
        create: (context) => HealthCubit()..getnews("eg"),
      ),
      BlocProvider<SportsCubit>(
        create: (context) => SportsCubit()..getnews("eg"),
      ),
      BlocProvider<ScienceCubit>(
        create: (context) => ScienceCubit()..getnews("eg"),
      ),
    ], child: NewsView()));
  }
}
