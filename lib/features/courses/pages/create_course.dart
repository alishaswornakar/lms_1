import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:teaching_lms_adv/core/widgets/buttons.dart';
import 'package:teaching_lms_adv/core/widgets/custom_text_field.dart';
import 'package:teaching_lms_adv/features/courses/blocs/create_course/course_create_bloc.dart';




import 'package:teaching_lms_adv/features/courses/model/create_course.dart';
import 'package:teaching_lms_adv/features/courses/widgets/category_selector.dart';

class CreateCourseFormPage extends StatefulWidget {
  const CreateCourseFormPage({super.key});

  @override
  State<CreateCourseFormPage> createState() => _CreateCourseFormPageState();
}

class _CreateCourseFormPageState extends State<CreateCourseFormPage> {
  final TextEditingController _titleController = TextEditingController();
  String? _categoryId;

  @override
  void dispose() {
    _titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            CustomTextField(
              controller: _titleController,
              labelText: "Course title",
              hintText: "How to make noodles?",
            ),
            CategorySelector(
              onChange: (categoryId) {
                _categoryId = categoryId;
              },
            ),

            AppButton(
              text: "Create course",
              onPressed: () {
                final form = CourseCreateForm(
                  categoryId: _categoryId!,
                  title: _titleController.text,
                );
                context.read<CourseCreateBloc>().add(
                  CourseCreateEvent.create(form),
                );
              },
            ),
         ],
        ),
      ),
    );
  }
}
