import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teaching_lms_adv/features/user_profile/bloc/profile/profile_me_bloc.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();

    context.read<ProfileBloc>().add(
      const ProfileEvent.getProfile(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileMeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),

            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),

            loaded: (profile) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),

                    const SizedBox(height: 20),

                    _buildInfoTile(
                      title: 'Name',
                      value: profile.name,
                    ),

                    _buildInfoTile(
                      title: 'Username',
                      value: profile.username,
                    ),

                    _buildInfoTile(
                      title: 'Email',
                      value: profile.email,
                    ),

                    _buildInfoTile(
                      title: 'Roles',
                      value: profile.roles.join(', '),
                    ),

                    _buildInfoTile(
                      title: 'Trainer Profile',
                      value: profile.hasTrainerProfile
                          ? 'Yes'
                          : 'No',
                    ),
                  ],
                ),
              );
            },

            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoTile({
    required String title,
    required String value,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}