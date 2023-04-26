import 'package:education_app_like_udemy/core/components/icon/icon_logo.dart';
import 'package:education_app_like_udemy/core/components/text-form-field/custom_text_form_field.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/extension/validator/email_validator.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/login/login_enum.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/login/view-model/login/login_cubit.dart';
import 'package:education_app_like_udemy/view/login/view-model/login/login_state.dart';
import 'package:education_app_like_udemy/view/login/view-model/validation/validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordCsontroller;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordCsontroller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordCsontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ValidateCubit, AutovalidateMode>(
        builder: (context, validateMode) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: context.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Form(
                      autovalidateMode: validateMode,
                      key: _formKey,
                      child: Column(
                        children: [
                          IconLogo(height: context.logoValue),
                          context.bigSpace,
                          _emailField(),
                          context.normalSpace,
                          _passwordField(),
                          context.normalSpace,
                          SizedBox(
                            width: context.textFieldWidht / 2.3,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<LoginCubit>()
                                      .login(email: _emailController.text, password: _passwordCsontroller.text);
                                } else {
                                  context.read<ValidateCubit>().validateMode();
                                }
                              },
                              child: BlocConsumer<LoginCubit, ILoginState>(
                                listener: (context, state) {
                                  if (state.status == LoginEnum.completed) {
                                    NavigationRoute.goRouteClear(RouteEnum.homePage.rawValue);
                                  } else if (state.status == LoginEnum.error) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AboutDialog();
                                      },
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  switch (state.status) {
                                    case LoginEnum.initial:
                                      return Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Login",
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                color: Colors.white,
                                                letterSpacing: 1.5,
                                              ),
                                        ),
                                      );
                                    case LoginEnum.loading:
                                      return const CircularProgressIndicator(color: Colors.white);
                                    case LoginEnum.completed:
                                      return const Text("Completed");
                                    case LoginEnum.error:
                                      return const Text("Login");
                                  }
                                },
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Create an account",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          context.largeSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  CustomTextField _passwordField() {
    return CustomTextField(
      controller: _passwordCsontroller,
      obscureText: true,
      label: "Password",
      icon: const Icon(Icons.key_outlined),
      function: (value) {
        if (value == null || value.isEmpty) {
          return "Password cannot be empty";
        }
        return null;
      },
    );
  }

  CustomTextField _emailField() {
    return CustomTextField(
      controller: _emailController,
      obscureText: false,
      label: "Email",
      icon: const Icon(Icons.email_outlined),
      function: (value) => (value != null && value.isValidEmail()) ? null : "Please enter a valid email address",
    );
  }
}
