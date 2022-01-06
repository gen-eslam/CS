import 'package:cs/cubit/login_and_rigester_cubit.dart';
import 'package:cs/cubit/state.dart';
import 'package:cs/module/register_screen.dart';
import 'package:cs/shared/cache_helper.dart';
import 'package:cs/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(create:(context)=>SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, app>(
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                snakBar(text: '${state.error}', state: SnackState.ERROR));
          }
          if(state is SocialLoginSuccessState)
          {
            CacheHelper.saveData(key: 'uId', value:state.uId ).then((value)
            {
              navigateAndKill(context, HomeScreen());
            }).catchError((error){});
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                              fontWeight: FontWeight.w900, fontSize: 30),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'login now to communicat other friends',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                              fontStyle: FontStyle.italic,
                              fontSize: 30,
                              color: Colors.grey[400]),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        defaultFormField(
                          context: context,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          label: 'Email Address',
                          prefix: Icons.email,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          context: context,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: SocialLoginCubit.get(context).isPassword,
                          controller: passwordController,
                          label: 'password',
                          prefix: Icons.password,
                          suffix: SocialLoginCubit.get(context).isPasswordIcon,
                          suffixPressed: () {
                            SocialLoginCubit.get(context).showPassword();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate())
                            {
                              SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Conditional.single(
                            context: context,
                            conditionBuilder: (context) => state is! SocialLoginLoadingState,
                            widgetBuilder: (context) => Container(
                              width: double.infinity,
                              height: 50,
                              child: OutlinedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    SocialLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                child: Text('LOGIN'),
                              ),
                            ),
                            fallbackBuilder: (context) =>
                                Center(child: CircularProgressIndicator())),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Don\'t have an account ?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black),
                            ),
                            defaultTextButton(
                              context: context,
                              text: 'Register',
                              onPressed: () {
                                navigateTo(context, RegisterScreen());
                              },
                              isUpper: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}