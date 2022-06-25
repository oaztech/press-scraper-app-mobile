import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrapi/bloc/category.bloc.dart';
import 'package:scrapi/ui/pages/widgets/drawer.item.widget.dart';
import 'package:scrapi/ui/pages/widgets/main.drawer.header.widget.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const MainDrawerHeader(),
          Expanded(
            child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
              if (state is CategorySuccessState || state is CategoryInitialState) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return DrawerItemWidget(
                        title: state.categories![index].wording,
                        onAction: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/');
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 6,
                      );
                    },
                    itemCount: state.categories.length);
              } else {
                return Column(
                  children: const [Text('No data fetched')],
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
