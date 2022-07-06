// ignore_for_file: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/components/cubit/cubit.dart';
import 'package:news_app/shared/components/cubit/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStatus>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var list=NewsCubit.get(context).health;
        return  articleBuilder(list,context);
      },

    );
  }
}
