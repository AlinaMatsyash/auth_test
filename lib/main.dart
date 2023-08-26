import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_auth/presentation/page/login_page.dart';
import 'package:test_auth/data/repositorys/auth_repository.dart';
import 'package:test_auth/res/assets/colors.gen.dart';
import 'package:test_auth/theme/app_typography.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) =>
            AuthBloc(RepositoryProvider.of<AuthRepository>(context)),
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) => LoginPage(),
          ),
          theme: ThemeData.light().copyWith(
              //backgroundColor: Color(0xffF3F4F6),
              appBarTheme: AppBarTheme(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  titleTextStyle: AppTypography.manropeMedium15.copyWith(color: ColorName.black))),
          //  builder: (ctx, child) {
          //    return BlocListener<AuthBloc, AuthState>(
          //      listener: (context, state) {
          //        // opens auth page
          //        if (state is Authenticated) {
          //          _navigator.push(
          //            MaterialPageRoute(builder: (_) => MainScreen()),
          //          );
          //        } else {
          //          // opens auth page
          //          _navigator.push(
          //            MaterialPageRoute(builder: (_) => RegisterFormPage()),
          //          );
          //        }
          //      },
          //      child: child,
          //    );
          // }
        ),
      ),
    );
    // routes: {
    // // When navigating to the "/" route, build the FirstScreen widget.
    // '/': (context) => BlocProvider(
    // create: (context) => AuthBloc(),
    // child: RegisterFormPage(),
    // ),
    // // When navigating to the "/second" route, build the SecondScreen widget.
    // // '/second': (context) => const SecondScreen(),
    // },
    // theme: ThemeData.dark(),
    // // home: BlocProvider<AuthBloc>(
    // //   create: (context) => AuthBloc(),
    // //   child: RegisterFormPage(),
    // // ),
    // );
  }
}
