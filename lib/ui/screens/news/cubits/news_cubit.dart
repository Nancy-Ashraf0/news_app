import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app0/domain/entities/article_entity.dart';
import 'package:news_app0/domain/entities/source_entity.dart';
import 'package:news_app0/domain/repositories/news_repo/news_repo.dart';
import 'package:news_app0/ui/screens/news/cubits/news_state.dart';
import 'package:news_app0/utils/recources/api_state.dart';

@injectable
class NewsCubit extends Cubit<NewsScreenState> {
  NewsRepository newsRepository;
  late List<SourceEntity> sources;
  late List<ArticleEntity> articles;

  NewsCubit(this.newsRepository) : super(SourcesState.initial());

  Future<void> getSources(String categoryId) async {
    emit(SourcesState(LoadingApiState()));
    try {
      sources = await newsRepository.getSources(categoryId);
      emit(SourcesState(SuccessApiState<List<SourceEntity>>(sources)));
    } catch (e) {
      emit(SourcesState(ErrorApiState(e.toString())));
    }
  }

  Future<void> getArticles(String sourceId) async {
    emit(ArticleState(LoadingApiState()));
    try {
      articles = await newsRepository.getArticles(sourceId);
      emit(ArticleState(SuccessApiState<List<ArticleEntity>>(articles)));
    } catch (e) {
      emit(ArticleState(ErrorApiState(e.toString())));
    }
  }

  Future<void> getFilteredArticles(String sourceId, String q) async {
    emit(ArticleState(LoadingApiState()));
    try {
      articles = await newsRepository.getArticlesByQ(sourceId, q);
      emit(ArticleState(SuccessApiState<List<ArticleEntity>>(articles)));
    } catch (e) {
      emit(ArticleState(ErrorApiState(e.toString())));
    }
  }
}
