import 'package:flutter/material.dart';

class PostCellWidget extends StatelessWidget {
  final String title;
  final String image;
  final String author;
  final String date;
  final Function onClick;
  const PostCellWidget(
      {Key? key, required this.title,
      required this.author,
      required this.image,
      required this.date,
      required this.onClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick(),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 75,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$author, $date',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
