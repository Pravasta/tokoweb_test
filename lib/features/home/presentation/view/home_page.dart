import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoweb_test/features/home/presentation/cubit/issues/issues_data_cubit.dart';
import 'package:tokoweb_test/features/home/presentation/cubit/repositories/repos_data_cubit.dart';
import 'package:tokoweb_test/features/home/presentation/cubit/user/user_data_cubit.dart';
import 'home_view.dart';
import 'package:tokoweb_test/injection.dart' as di;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserDataCubit>(
          create: (context) => di.locator<UserDataCubit>(),
        ),
        BlocProvider<IssuesDataCubit>(
          create: (context) => di.locator<IssuesDataCubit>(),
        ),
        BlocProvider<ReposDataCubit>(
          create: (context) => di.locator<ReposDataCubit>(),
        ),
      ],
      child: const HomeView(),
    );
  }
}
