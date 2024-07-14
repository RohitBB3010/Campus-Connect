import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/auth/select_page.dart';
import 'package:campus_connecy/committees/committee_page.dart';
import 'package:campus_connecy/students/student_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()
        ..checkSignIn()
        ..getCommitteesList(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Futura"),
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthUnAuthenticatedState) {
              return const SelectPage();
            } else if (state is AuthAuthenticatedState) {
              if (state.isStudent != null && state.isStudent!) {
                return const StudentHome();
              } else {
                return CommitteePage();
              }
            }

            return const AutoSizeText("Main default");
          },
        ),
      ),
    );
  }
}
