import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsnew/modules/search_screen.dart';

import 'package:whatsnew/shared/cubit/news_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusinessNews()
        ..getscienceNews()
        ..getSportsNews(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Whats New'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SearchScreen();
                    }));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 5,
              selectedItemColor: Colors.orange,
              currentIndex: BlocProvider.of<NewsCubit>(context).currentIndex,
              onTap: (index) async {
                BlocProvider.of<NewsCubit>(context).changeNavBar(index);
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business_center_outlined),
                    label: 'Business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science_outlined), label: 'Science'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_baseball_outlined),
                    label: 'Sports'),
              ],
            ),
            body: BlocProvider.of<NewsCubit>(context)
                .screens[BlocProvider.of<NewsCubit>(context).currentIndex],
          );
        },
      ),
    );
  }
}
