import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant/app_text.dart';
import '../../cubit/user/user_data_cubit.dart';
import '../../widget/list_data_widget.dart';

Widget userContent(String values, scrollController) {
  return BlocBuilder<UserDataCubit, UserDataState>(
    builder: (context, state) {
      if (state is UserDataLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is UserDataError) {
        return Center(
          child: Text(
            'Tidak ditemukan data',
            style: AppText.text18,
          ),
        );
      }

      if (state is UserDataLoaded) {
        final data = state.data;

        return Container(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          width: double.infinity,
          child: ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListDataWidget(
                title: data[index].login,
                imageUrl: data[index].avatarUrl,
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
