import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_auth/res/assets/assets.gen.dart';
import 'package:test_auth/res/assets/colors.gen.dart';
import 'package:test_auth/theme/app_typography.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        title: Text(
          'Профиль',
          style: AppTypography.manropeMedium15,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return Column(
              children: [
                const SizedBox(height: 38),
                Assets.images.image1.image(),
                const SizedBox(height: 15),
                Text(
                  state.model.user.nickname,
                  style: AppTypography.manropeSemiBold24,
                ),
                const SizedBox(height: 12),
                Text(
                  state.model.user.email,
                  style: AppTypography.manropeRegular16.copyWith(
                    color: ColorName.textIcon,
                  ),
                ),
                const SizedBox(height: 27),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 29),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'Выйти',
                            style: AppTypography.manropeRegular16
                                .copyWith(color: ColorName.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              const SizedBox(height: 38),
              Assets.images.image1.image(),
              const SizedBox(height: 15),
              Text(
                'Марипбек Чингиз',
                style: AppTypography.manropeSemiBold24,
              ),
              const SizedBox(height: 12),
              Text(
                'maripbekoff@gmail.com',
                style: AppTypography.manropeRegular16.copyWith(
                  color: ColorName.textIcon,
                ),
              ),
              const SizedBox(height: 27),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 29),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'Выйти',
                          style: AppTypography.manropeRegular16
                              .copyWith(color: ColorName.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
