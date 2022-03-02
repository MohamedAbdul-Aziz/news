import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/data_service.dart';

class HealthCubit extends Cubit<List<dynamic>?> {
  final _dataService = DataService();

  HealthCubit() : super([]);

  void getnews(country) async =>
      emit(await _dataService.getData(country, "health"));
}
