import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsnew/shared/components/article_item.dart';
import '../shared/components/custome_text_form_field.dart';
import '../shared/cubit/news_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var list = BlocProvider.of<NewsCubit>(context).search;
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: customeTextFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChanged: (value) {
                    BlocProvider.of<NewsCubit>(context).searchNews(value);
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return ' serch must not be empty';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'serch for something',
                  prefixIcon: Icons.search,
                ),
              ),
              articleBuilder(list),
            ],
          ),
        );
      },
    );
  }
}
