import 'package:flutter/material.dart';

Widget articleItem(article, context) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(article['urlToImage']),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(0.1),
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('${article['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

void navigateTo(context, widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
}
