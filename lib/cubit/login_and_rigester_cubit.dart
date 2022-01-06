import 'package:bloc/bloc.dart';
import 'package:cs/cubit/state.dart';
import 'package:cs/model/create_user.dart';
import 'package:cs/shared/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginCubit extends Cubit<app> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  IconData isPasswordIcon = Icons.remove_red_eye;


  void userLogin({required String email, required String password}) {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(SocialLoginErrorState(error.toString()));
    });
  }

  void showPassword() {
    isPassword = !isPassword;
    if (isPassword == true) {
      isPasswordIcon = Icons.remove_red_eye;
    } else {
      isPasswordIcon = Icons.remove_red_eye_outlined;
    }
    emit(SocialLoginShowPassword());
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(FirebaseAuth.instance.currentUser!.uid);
      uId =FirebaseAuth.instance.currentUser!.uid;
      userCreate(
        phone: phone,
        name: name,
        email: email,
        uId: FirebaseAuth.instance.currentUser!.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,

  }) {
    UserCreate model = UserCreate(
      name: name,
      email: email,
      phone: phone,
      uId: uId,

    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState(uId));
    }).catchError((error) {
      emit(SocialCreateUserErrorState(error));
    });
  }
}