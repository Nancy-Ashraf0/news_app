import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app0/domain/di/di.dart';
import 'package:news_app0/domain/entities/article_entity.dart';
import 'package:news_app0/ui/screens/article_details_screen/articles_details_Screen.dart';
import 'package:news_app0/ui/screens/news/article_widget.dart';
import 'package:news_app0/ui/screens/news/cubits/news_cubit.dart';
import 'package:news_app0/ui/screens/news/cubits/news_state.dart';
import 'package:news_app0/ui/widgets/error_widget.dart';
import 'package:news_app0/utils/widgets/choice_chip.dart';

class NewsPage extends StatefulWidget {
  static const String routeName = "news";

  const NewsPage({super.key});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsCubit newsCubit = getIt();
  late String sourceId;
  late String categoryId;
  int selectedChip = 0;
  late List<ArticleEntity> searchedArticles;
  bool isSearching = false;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        newsCubit.getSources(categoryId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    categoryId = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (BuildContext context) => newsCubit,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                height: 80,
                child: buildSourceNamesList()),
            buildArticlesList()
          ],
        ),
      ),
    );
  }

  Widget buildArticlesList() {
    return BlocBuilder<NewsCubit, NewsScreenState>(builder: (context, state) {
      if (state is ArticleState) {
        if (state.articleState.isSuccess) {
          return Expanded(
            child: ListView.builder(
                itemCount:
                    (state.articleState.getData as List<ArticleEntity>).length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ArticleDetailsScreen.routeName,
                            arguments: (state.articleState.getData
                                as List<ArticleEntity>)[index]);
                      },
                      child: ArticleWidget(
                          articleEntity: (state.articleState.getData
                              as List<ArticleEntity>)[index]),
                    )),
          );
        } else if (state.articleState.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.articleState.isError) {
          return MyError(
              errorMessage: state.articleState.error.errorMessage,
              onRetry: () {
                newsCubit.getArticles(sourceId);
              });
        }
      }
      return const Center(child: CircularProgressIndicator());
    });
  }

  Widget buildSourceNamesList() {
    return BlocBuilder<NewsCubit, NewsScreenState>(
        buildWhen: (previous, current) {
      return (current is SourcesState);
    }, builder: (context, state) {
      if (state is SourcesState) {
        if (state.sourceState.isSuccess) {
          if (selectedChip == 0) {
            sourceId = ((state.sourceState.getData)[0].id!);
            newsCubit.getArticles(sourceId);
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (state.sourceState.getData).length,
              itemBuilder: (context, index) => CustomChoiceChip(
                  label: (state.sourceState.getData)[index].name!,
                  onSelected: () {
                    selectedChip = index;
                    sourceId = (state.sourceState.getData)[index].id!;
                    newsCubit.getArticles(sourceId);
                    setState(() {});
                  },
                  isSelected: selectedChip == index));
        } else if (state.sourceState.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.sourceState.isError) {
          return MyError(
              errorMessage: state.sourceState.error.errorMessage,
              onRetry: () {
                newsCubit.getSources(categoryId);
              });
        }
      }
      return const Center(child: CircularProgressIndicator());
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      backgroundColor: Colors.green,
      title: isSearching ? buildSearchTextField() : buildAppBarTitle(),
      actions: buildAppBarActions(),
    );
  }

  Widget buildSearchTextField() {
    return TextField(
      controller: searchController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: context.tr("searchHint"),
        hintStyle: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
      ),
      style: const TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
      onChanged: (searchedArticle) {
        searchedFor(sourceId, searchedArticle);
      },
    );
  }

  void searchedFor(String sourceId, String q) {
    newsCubit.getFilteredArticles(sourceId, q);
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
          ),
          color: Colors.white,
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            startSearching();
          },
          icon: const Icon(
            Icons.search,
          ),
          color: Colors.white,
        )
      ];
    }
  }

  void startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
      stopSearching();
    }));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    isSearching = false;
    setState(() {});
  }

  void clearSearch() {
    searchController.clear();
    // setState(() {});
  }

  Widget buildAppBarTitle() {
    return Text(
      context.tr(categoryId),
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}
