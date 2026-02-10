// import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

// class NewsCubit extends Cubit<NewsState> {
//   NewsCubit(this.service) : super(NewsInitial());
//   List<ArticleModel>? news;
//   NewsService service;
//   // final String category;
//   void getTopHeadlines({required String category}) async {
//     emit(NewsLoading());
//     try {
//       news = await service.getTopHeadlines(category: category);
//       // await Future.delayed(Duration(seconds: 2));
//       emit(NewsSuccess(newsArticle: news!));
//     } catch (e) {
//       emit(NewsFailure());
//       print(e.toString());
//     }
//   }
// }
