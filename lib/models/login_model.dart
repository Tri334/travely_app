class LoginImage {
  String img;

  LoginImage({required this.img});
}

var loginImage = LoginImage(img: 'assets/imgs/login_img.png');

class SignInWith {
  String google;
  String facebook;

  SignInWith({
    required this.google,
    required this.facebook,
  });
}

var signInWith = SignInWith(
    google: 'assets/imgs/google.png', facebook: 'assets/imgs/facebook.png');
