import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news.dart';

class NavCubit extends Cubit<News> {
  NavCubit() : super(null);

  void showPostDetails(News post) => emit(post);

  void popToPosts() => emit(null);
}
