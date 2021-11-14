import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data_service.dart';
import 'package:news/datanews.dart';
import 'package:news/news.dart';

// class PostsCubit extends Cubit<List<dynamic>> {
//   final _dataService = DataService();

//   PostsCubit() : super([]);

//   void getPosts() async => emit(await _dataService.getData());
// }

import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<List<dynamic>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getData());
}

abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<dynamic> news;
  LoadedPostsState({this.news});
}

class FailedToLoadPostsState extends PostsState {
  Error error;
  FailedToLoadPostsState({this.error});
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  PostsBloc() : super(LoadingPostsState());

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if (event is LoadPostsEvent || event is PullToRefreshEvent) {
      yield LoadingPostsState();

      try {
        final getNews = await _dataService.getData();
        yield LoadedPostsState(news: getNews);
      } catch (e) {
        yield FailedToLoadPostsState(error: e);
      }
    }
  }
}
