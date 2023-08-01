import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whatsnew/shared/cubit/news_cubit.dart';
import '../shared/components/article_item.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = BlocProvider.of<NewsCubit>(context).business;
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return articleBuilder(list);
      },
    );
  }
}
