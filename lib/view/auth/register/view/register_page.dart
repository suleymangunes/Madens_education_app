import 'package:education_app_like_udemy/view/auth/register/view-model/register/register_cubit.dart';
import 'package:education_app_like_udemy/view/auth/register/view-model/validation/validation_register_cubit.dart';
import 'package:education_app_like_udemy/view/auth/register/view-model/wait/waited_button.dart';
import 'package:education_app_like_udemy/view/auth/register/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RegisterCubit()),
          BlocProvider(create: (context) => WaitedRegisterCubit()),
          BlocProvider(create: (context) => ValidateRegisterCubit())
        ],
        child: RegisterView(
          role: role,
        ));
  }
}
