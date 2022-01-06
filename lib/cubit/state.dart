abstract class app {}

class InitialState extends app {}

class ChangeBottomNavBarItem extends app {}

class SocialLoginInitialState extends app {}

class SocialLoginLoadingState extends app {}

class SocialLoginSuccessState extends app {
  final String uId;

  SocialLoginSuccessState(this.uId);
}

class SocialLoginErrorState extends app {
  late final String error;

  SocialLoginErrorState(this.error);
}

class SocialRegisterInitialState extends app {}

class SocialRegisterLoadingState extends app {}

class SocialRegisterSuccessState extends app {}

class SocialRegisterErrorState extends app {
  late final String error;

  SocialRegisterErrorState(this.error);
}

class SocialCreateUserSuccessState extends app {
  final String uId;

  SocialCreateUserSuccessState(this.uId);
}

class SocialCreateUserErrorState extends app {
  late final String error;

  SocialCreateUserErrorState(this.error);
}

class SocialLoginShowPassword extends app {}
