import 'package:news_app0/utils/recources/api_state.dart';

abstract class NewsScreenState {}

class SourcesState extends NewsScreenState {
  late ApiState sourceState;

  SourcesState.initial() {
    sourceState = LoadingApiState();
  }

  SourcesState(this.sourceState);
}

class ArticleState extends NewsScreenState {
  late ApiState articleState;

  ArticleState.initial() {
    articleState = LoadingApiState();
  }

  ArticleState(this.articleState);
}
