import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoweb_test/constant/app_colors.dart';
import 'package:tokoweb_test/constant/queue.dart';
import 'package:tokoweb_test/features/home/presentation/cubit/issues/issues_data_cubit.dart';
import 'package:tokoweb_test/features/home/presentation/cubit/repositories/repos_data_cubit.dart';
import 'package:tokoweb_test/features/home/presentation/cubit/user/user_data_cubit.dart';
import 'package:tokoweb_test/features/home/presentation/view/section/issue_content.dart';
import 'package:tokoweb_test/features/home/presentation/view/section/repos_content.dart';
import 'package:tokoweb_test/features/home/presentation/view/section/user_content.dart';
import 'package:tokoweb_test/widget/button/default_button_widget.dart';
import 'package:tokoweb_test/widget/button/default_radio_button_widget.dart';
import 'package:tokoweb_test/widget/field/default_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scrollController = ScrollController();
  final textController = TextEditingController();

  String values = "users";

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    textController.dispose();
    super.dispose();
  }

  Future fetchData() async {}

  @override
  Widget build(BuildContext context) {
    Widget searchButton() {
      final userC = context.watch<UserDataCubit>();
      final issuesC = context.watch<IssuesDataCubit>();
      final reposC = context.watch<ReposDataCubit>();

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
        child: DefaultTextField(
          hintText: 'Cari',
          prefixWidget: const Icon(
            Icons.search,
          ),
          controller: textController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (values == Queue.users) {
                userC.getUserData(values, value);
              } else if (values == Queue.issues) {
                issuesC.getUserData(values, value);
              } else {
                reposC.getUserData(values, value);
              }
            }
            if (values.isEmpty) {
              return;
            }
          },
        ),
      );
    }

    Widget menuButton() {
      return Container(
        color: AppColors.primaryColor,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                DefaultRadioButtonWidget(
                  values: "users",
                  title: 'User',
                  onChanged: (p0) {
                    if (mounted) {
                      setState(() {
                        values = p0!;
                      });
                    }
                  },
                  selectValue: values,
                ),
                DefaultRadioButtonWidget(
                  values: "issues",
                  title: 'Issues',
                  onChanged: (p1) {
                    if (mounted) {
                      setState(() {
                        values = p1!;
                      });
                    }
                  },
                  selectValue: values,
                ),
                DefaultRadioButtonWidget(
                  values: "repositories",
                  title: 'Repositories',
                  onChanged: (p2) {
                    if (mounted) {
                      setState(() {
                        values = p2!;
                      });
                    }
                  },
                  selectValue: values,
                ),
              ],
            ),
            Row(
              children: [
                DefaultButtonWidget(
                  title: 'Lazy Loading',
                  isSelected: true,
                  onTap: () {},
                ),
                const SizedBox(width: 10),
                DefaultButtonWidget(
                  title: 'With Index',
                  isSelected: false,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: searchButton(),
              ),
              SliverAppBar(
                backgroundColor: AppColors.primaryColor,
                surfaceTintColor: AppColors.primaryColor,
                pinned: true,
                elevation: 0,
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: menuButton(),
                ),
              ),
            ];
          },
          body: values == Queue.users
              ? userContent(values, scrollController)
              : values == Queue.issues
                  ? issueContent(values)
                  : reposContent(values),
        ),
      ),
    );
  }
}
