import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'my_divider.dart';

Widget articleItem(article) => Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: article['urlToImage'] != null
                    ? NetworkImage('${article['urlToImage']}')
                    : NetworkImage(
                        'https://play-lh.googleusercontent.com/jVTh8R0XQ_B0qFpG9T8kh-zaYRALvTLNsKNb_F-MbZOOCBlW4C04HaDPf5EBBlDSzg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

Widget articleBuilder(
  list,
) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => articleItem(list[index]),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );
