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
    return BlocBuilder<CountryCubit, String>(
      builder: (context, state) {
        return MaterialApp(
            home: MultiBlocProvider(providers: [
          BlocProvider<GeneralCubit>(
            create: (context) => GeneralCubit()..getnews(state),
          ),
          BlocProvider<TechnologyCubit>(
            create: (context) => TechnologyCubit()..getnews(state),
          ),
          BlocProvider<BusinessCubit>(
            create: (context) => BusinessCubit()..getnews(state),
          ),
          BlocProvider<EntertainmentCubit>(
            create: (context) => EntertainmentCubit()..getnews(state),
          ),
          BlocProvider<HealthCubit>(
            create: (context) => HealthCubit()..getnews(state),
          ),
          BlocProvider<SportsCubit>(
            create: (context) => SportsCubit()..getnews(state),
          ),
          BlocProvider<ScienceCubit>(
            create: (context) => ScienceCubit()..getnews(state),
          ),
        ], child: NewsView()));
      },
    );
  }
}
