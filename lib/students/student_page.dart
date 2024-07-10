import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                CustomButton(context, 'Sign out', accent3,
                    context.read<AuthCubit>().signOut, 0.6, 0.08)
              ],
            ),
          );
        },
      ),
    );
  }
}
