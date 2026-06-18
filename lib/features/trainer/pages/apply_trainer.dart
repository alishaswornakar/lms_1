import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teaching_lms_adv/features/trainer/bloc/apply_trainer/apply_trainer_bloc.dart';


class TrainerApplyPage extends StatefulWidget {
  const TrainerApplyPage({super.key});

  @override
  State<TrainerApplyPage> createState() => _TrainerApplyPageState();
}

class _TrainerApplyPageState extends State<TrainerApplyPage> {
  final _bioController = TextEditingController();
  final _expertiseController = TextEditingController();
  final _experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply as Trainer'),
      ),
      body: BlocConsumer<TrainerApplyBloc, ApplyTrainerState>(
        listener: (context, state) {
          state.whenOrNull(
          loaded: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Application Submitted'),
                ),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final loading = state.maybeWhen(
  loading: () => true,
  orElse: () => false,
);

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _bioController,
                  decoration: const InputDecoration(
                    labelText: 'Bio',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _expertiseController,
                  decoration: const InputDecoration(
                    labelText: 'Expertise',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _experienceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Experience Years',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: loading
                      ? null
                      : () {
                          context.read<TrainerApplyBloc>().add(
                                ApplyTrainerEvent.submit(
                                  bio: _bioController.text,
                                  expertise:
                                      _expertiseController.text,
                                  experienceYears: int.tryParse(
                                        _experienceController.text,
                                      ) ??
                                      0,
                                ),
                              );
                        },

                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text('Submit'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}