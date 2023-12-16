import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant/app_text.dart';
import '../../cubit/repositories/repos_data_cubit.dart';
import '../../widget/list_data_widget.dart';

Widget reposContent(String values) {
  return BlocBuilder<ReposDataCubit, ReposDataState>(
    builder: (context, state) {
      if (state is ReposDataLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is ReposDataError) {
        return Center(
          child: Text(
            'Tidak ditemukan data',
            style: AppText.text18,
          ),
        );
      }

      if (state is ReposDataLoaded) {
        final data = state.data;

        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListDataWidget(
                title: data[index].name,
                imageUrl: data[index].owner.avatarUrl,
                subtitle: '${data[index].createdAt}',
                trailing1: data[index].watchersCount.toString(),
                trailing2: data[index].stargazersCount.toString(),
                trailing3: data[index].forksCount.toString(),
                isUser: values,
              );
            },
          ),
        );
      }

      return Center(
        child: Text(
          'Mari mulai pencarian',
          style: AppText.text18,
        ),
      );
    },
  );
}
