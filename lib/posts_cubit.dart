import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data_service.dart';
import 'package:news/datanews.dart';
import 'package:news/news.dart';

class PostsCubit extends Cubit<List<dynamic>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getData());
}
