import 'package:news_app0/domain/entities/source_entity.dart';
import 'package:news_app0/utils/recources/api_state.dart';

abstract class NewsScreenState{}
class SourceState extends NewsScreenState{
 late ApiState sourceState;
  SourceState.initial(){
    sourceState=LoadingApiState();
  }
  SourceState(this.sourceState);
}
class ArticleState extends NewsScreenState{
  late ApiState articleState;
  ArticleState.initial(){
    articleState=LoadingApiState();
  }
  ArticleState(this.articleState);
}