import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant/app_text.dart';
import '../../cubit/issues/issues_data_cubit.dart';
import '../../widget/list_data_widget.dart';

Widget issueContent(String values) {
  return BlocBuilder<IssuesDataCubit, IssuesDataState>(
    builder: (context, state) {
      if (state is IssuesDataLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is IssuesDataError) {
        return Center(
          child: Text(
            'Tidak ditemukan data',
            style: AppText.text18,
          ),
        );
      }

      if (state is IssuesDataLoaded) {
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
                title: data[index].user.login,
                imageUrl: data[index].user.avatarUrl,
                subtitle: '${data[index].updatedAt}',
                trailing1: '${data[index].state}',
                trailing2: data[index].stateReason ?? '-',
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
