import 'package:flutter/material.dart';
import 'package:tokoweb_test/constant/app_colors.dart';
import 'package:tokoweb_test/constant/app_text.dart';
import 'package:tokoweb_test/constant/queue.dart';

class ListDataWidget extends StatelessWidget {
  const ListDataWidget({
    super.key,
    required this.title,
    this.isUser,
    this.subtitle,
    this.imageUrl =
        'https://i.pinimg.com/originals/e2/7f/e5/e27fe5b06bc777a7832b9b9e8e5ce291.png',
    this.trailing1,
    this.trailing2,
    this.trailing3,
  });

  final String title;
  final String? subtitle;
  final String? imageUrl;
  final String? isUser;
  final String? trailing1;
  final String? trailing2;
  final String? trailing3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  '$imageUrl',
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppText.text18,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (isUser != "users") Text('$subtitle', style: AppText.text14),
              ],
            ),
          ),
          if (isUser == Queue.issues) ...[
            const SizedBox(width: 15),
            Column(
              children: [
                Text(
                  '$trailing1',
                  style: AppText.text10,
                  maxLines: 3,
                ),
                Text(
                  '$trailing2',
                  style: AppText.text10,
                  maxLines: 3,
                ),
              ],
            ),
          ],
          if (isUser == Queue.repository) ...[
            const SizedBox(width: 15),
            Column(
              children: [
                Text(
                  '$trailing1',
                  style: AppText.text8,
                  maxLines: 3,
                ),
                Text(
                  '$trailing2',
                  style: AppText.text8,
                  maxLines: 3,
                ),
                Text(
                  '$trailing2',
                  style: AppText.text8,
                  maxLines: 3,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
