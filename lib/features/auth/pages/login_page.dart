import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:teaching_lms_adv/core/routes/route_name.dart';
import 'package:teaching_lms_adv/core/utils/snackbar_util.dart';
import 'package:teaching_lms_adv/core/widgets/app_text.dart';
import 'package:teaching_lms_adv/core/widgets/buttons.dart';
import 'package:teaching_lms_adv/core/widgets/custom_text_field.dart';
import 'package:teaching_lms_adv/features/auth/blocs/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 12,
            children: [
              Gap(200),

              AppText.heading("Welcome back"),

              CustomTextField(controller: _emailController, labelText: "Email"),
              CustomTextField(
                controller: _passwordController,
                labelText: "Password",
                obscureText: true,
              ),

              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.whenOrNull(
                    loaded: (msg) {
                      AppSnackBar.success(context, message: msg);
                      context.goNamed(RouteName.home);
                    },

                    failure: (f) {
                      AppSnackBar.error(context, message: f.toString());
                    },
                  );
                },
                builder: (context, state) {
                  return AppButton(
                    text: "Login",
                    isLoading: state.isLoading,
                    onPressed: () {
                      context.read<LoginBloc>().add(
                        LoginEvent.login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
