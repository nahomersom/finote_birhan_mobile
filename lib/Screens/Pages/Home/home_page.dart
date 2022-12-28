
import 'package:finote_birhan_mobile/Screens/Pages/Home/Component/avatar.dart';
import 'package:finote_birhan_mobile/Screens/Pages/Home/Component/content_title.dart';
import 'package:finote_birhan_mobile/Screens/Pages/Home/Component/weketawi_mezmurate_container.dart';
import 'package:finote_birhan_mobile/blocs/mezmursCategoyBloc/mezmurs_category_bloc.dart';
import 'package:finote_birhan_mobile/blocs/mezmursCategoyBloc/mezmurs_category_event.dart';
import 'package:finote_birhan_mobile/blocs/mezmursCategoyBloc/mezmurs_category_state.dart';
import 'package:finote_birhan_mobile/blocs/recommendationBloc/recommendation_bloc.dart';
import 'package:finote_birhan_mobile/blocs/zemarianBloc/zemarian_bloc.dart';
import 'package:finote_birhan_mobile/blocs/zemarianBloc/zemarian_event.dart';
import 'package:finote_birhan_mobile/blocs/zemarianBloc/zemarian_state.dart';
import 'package:finote_birhan_mobile/repository/models/category.dart';
import 'package:finote_birhan_mobile/repository/models/recomended.dart';
import 'package:finote_birhan_mobile/repository/models/zemarian.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/WerebCategoryBloc/wereb_category_bloc.dart';
import '../../../blocs/WerebCategoryBloc/wereb_category_event.dart';
import '../../../blocs/WerebCategoryBloc/wereb_category_state.dart';
import '../../../blocs/recommendationBloc/recommendation_event.dart';
import 'Component/tiny_card.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return  Scaffold(

      appBar: AppBar(

        leading:  Center(

          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 5),
            child: Text('ፍኖተ ብርሀን',style: _textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18
            )
        ),
          )),


        leadingWidth: 300,
      ),
      body:  RefreshIndicator(
        onRefresh: () async{
           context.read<RecommendationMezmurBloc>().add(RefreshRecommend());
           context.read<MezmursCategoryBloc>().add(RefreshMezmursCategory());
           context.read<WerebCategoryBloc>().add(RefreshWerebCategory());
           context.read<ZemarainBloc>().add(RefreshZemarian());
        },

        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:     [
             const ContentTitle(text: 'ወቅታዊ'),
             BlocBuilder<RecommendationMezmurBloc,RecommendationState>(

                builder: (context,state) {
                  return state.status.isLoading ?

                  WektawiMezmurCard(recommended: state.recommended) :

                  state.status.isSuccess ?
                  WektawiMezmurCard(recommended: state.recommended) :
                  state.status.hasError ?

                  const Center(
                    child: Text('error'),
                  ) : Container();
                }
                  ),


             const ContentTitle(text: 'መዝሙሮች'),
              BlocBuilder<MezmursCategoryBloc,MezmursCategoryState>(

                  builder: (context,state) {
                    if(state is LoadingCategoryState){
                      List<CategoryModel>? mezmursCategory = state.mezmursCategory;
                      return TinyCard(category: mezmursCategory);
                    }
                    if (state is LoadedMezmurCategoryState) {
                      List<CategoryModel> mezmursCategory = state.mezmursCategory;
                      return TinyCard(category: mezmursCategory);
                    }
                    if(state is ErrorMezmurCategoryState){
                      return const Center(
                        child: Text('error'),
                      );
                    }
                    return Container();
                  }
              ),
              const ContentTitle(text: 'ዘማርያን'),
              BlocBuilder<ZemarainBloc,ZemarianState>(
                   builder: (context,state) {
                     if(state is LoadingZemarianState){
                       List<ZemarianModel>? zemarians = state.zemarian;
                       return Avatar(zemarians:zemarians);
                     }
                     if(state is LoadedZemarianState){
                       List<ZemarianModel> zemarians = state.zemarian;
                       return Avatar(zemarians:zemarians);
                     }
                     return Container();
                   }
              ),

              const ContentTitle(text: 'ወረቦች'),
              BlocBuilder<WerebCategoryBloc,WerebCategoryState>(

                  builder: (context,state) {
                    if(state is LoadingWerebCategoryState){
                      List<CategoryModel>? mezmursCategory = state.werebCategory;
                      return TinyCard(category: mezmursCategory);
                    }
                    if (state is LoadedWerebCategoryState) {
                      List<CategoryModel> mezmursCategory = state.werebCategory;
                      return TinyCard(category: mezmursCategory);
                    }
                    if(state is ErrorWerebCategoryState){
                      return const Center(
                        child: Text('error'),
                      );
                    }
                    return Container();
                  }
              ),
             // const TinyCard()
            ],
          )
        ),
      )
    );
  }
}
