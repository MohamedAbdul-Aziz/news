import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/data_service.dart';

class BusinessCubit extends Cubit<List<dynamic>?> {
  final _dataService = DataService();

  BusinessCubit() : super([]);

  void getnews(country) async =>
      emit(await _dataService.getData(country, "business"));
}
