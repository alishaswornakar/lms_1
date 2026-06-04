// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:go_router/go_router.dart';
// import 'package:teaching_lms_adv/core/routes/route_name.dart';
// import 'package:teaching_lms_adv/core/utils/snackbar_util.dart';
// import 'package:teaching_lms_adv/core/widgets/app_text.dart';
// import 'package:teaching_lms_adv/core/widgets/buttons.dart';
// import 'package:teaching_lms_adv/core/widgets/custom_text_field.dart';
// import 'package:teaching_lms_adv/features/auth/blocs/login/login_bloc.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             spacing: 12,
//             children: [
//               Gap(200),

//               AppText.heading("Welcome back"),

//               CustomTextField(controller: _emailController, labelText: "Email"),
//               CustomTextField(
//                 controller: _passwordController,
//                 labelText: "Password",
//                 obscureText: true,
//               ),

//               BlocConsumer<LoginBloc, LoginState>(
//                 listener: (context, state) {
//                   state.whenOrNull(
//                     loaded: (msg) {
//                       AppSnackBar.success(context, message: msg);
//                       context.goNamed(RouteName.home);
//                     },

//                     failure: (f) {
//                       AppSnackBar.error(context, message: f.toString());
//                     },
//                   );
//                 },
//                 builder: (context, state) {
//                   return AppButton(
//                     text: "Login",
//                     isLoading: state.isLoading,
//                     onPressed: () {
//                       context.read<LoginBloc>().add(
//                         LoginEvent.login(
//                           email: _emailController.text,
//                           password: _passwordController.text,
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
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
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    context.read<LoginBloc>().add(
          LoginEvent.login(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Gap(120),

                AppText.heading("Welcome Back"),

                const Gap(8),

                const Text(
                  "Login to continue",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                const Gap(40),

                CustomTextField(
                  controller: _emailController,
                  labelText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }

                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return "Enter a valid email";
                    }

                    return null;
                  },
                ),

                const Gap(16),

                CustomTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }

                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }

                    return null;
                  },
                ),

                const Gap(10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // context.pushNamed(
                      //   RouteName.forgotPassword,
                      // );
                    },
                    child: const Text("Forgot Password?"),
                  ),
                ),

                const Gap(20),

                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.whenOrNull(
  loaded: (email) {
    AppSnackBar.success(context, message: "Login Successful");

    context.goNamed(
  RouteName.home,
  extra: _emailController.text.trim(),
);
                      },
                      failure: (f) {
                        AppSnackBar.error(
                          context,
                          message: f.toString(),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        text: "Login",
                        isLoading: state.isLoading,
                        onPressed: _login,
                      ),
                    );
                  },
                ),

                const Gap(20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                    ),
                    TextButton(
                      onPressed: () {
                        // context.pushNamed(
                        //   RouteName.register,
                        // );
                      },
                      child: const Text(
                        "Register",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}