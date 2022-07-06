// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/components/cubit/cubit.dart';
import 'package:news_app/shared/components/cubit/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
var searchController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStatus>(
      listener: (context,state){},
      builder: (context,state){
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onValidate: onValidateSearch,
                  label:'Search',
                  prefix: Icons.search,
                  onChanged: (value) {
                    onChangedValue(value,context);
                  },


                ),
              ),
              Expanded(child: articleBuilder(list, context,isSearch: true)),
            ],
          ),
        );
      },

    );
  }
}
String? onValidateSearch(String? text) {
  if (text == null || text.isEmpty) {
    return 'Search can\'t be empty';
  }
  return null;
}
void onChangedValue(value,context) {
 NewsCubit.get(context).getSearch(value);
}