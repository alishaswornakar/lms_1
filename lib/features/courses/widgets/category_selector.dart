// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teaching_lms_adv/core/blocs/base_state/base.dart';


import 'package:teaching_lms_adv/core/widgets/app_text.dart';

import 'package:teaching_lms_adv/core/widgets/progrss_indicator.dart';

import 'package:teaching_lms_adv/features/courses/blocs/category_bloc/category_bloc.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key, required this.onChange});
  final Function(String categoryId) onChange;

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(CategoryEvent.get());
  }

  String? currentSelectedId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => AppLoading(),
          loaded: (data) {
            return DropdownButtonFormField(
            
              initialValue: currentSelectedId,
              hint: AppText("Select a category"),

              items: data
                  .map(
                    (e) =>
                        DropdownMenuItem(value: e.id, child: AppText(e.name)),
                  )
                  .toList(),
              onChanged: (value) {
                currentSelectedId = value;
                setState(() {});
                widget.onChange(currentSelectedId!);
              },
            );
          },
        );
      },
    );
  }
}
