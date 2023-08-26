import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_auth/presentation/page/navigator_page.dart';
import 'package:test_auth/res/assets/colors.gen.dart';
import 'package:test_auth/presentation/widgets/form_field.dart';
import 'package:test_auth/presentation/widgets/button_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bg,
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Авторизация'),
        centerTitle: true,
        //backgroundColor: Color(0xff424242),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: ColorName.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    AuthField(
                      controller: emailController,
                      hintText: 'Логин или почта',
                      validator: _validateName,
                    ),
                    const Divider(
                      color: ColorName.textIcon,
                    ),
                    AuthField(
                      controller: passwordController,
                      hintText: 'Пароль',
                      validator: _validatePassword,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const NavigationScreen()));
                  });
                } else if (state is ErrorState) {
                  showSnackBar(state.message);
                }
                return ButtonApp(
                  text: 'Войти',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(SignIn(
                          emailController.text, passwordController.text));
                    } else {}
                  },
                );
              },
            ),
            const SizedBox(height: 19),
            ButtonApp(
              text: 'Зарегистрироваться',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return 'Заполни поле';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Заполни поле';
    } else {
      return null;
    }
  }

  showSnackBar(String text) {
    print(text);
    final snackBar = SnackBar(
      content: Text('Status kod = $text'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
