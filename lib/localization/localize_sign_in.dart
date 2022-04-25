import 'package:flutterfire_ui/i10n.dart';

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'Mailinizi Girin';

  @override
  String get passwordInputLabel => 'Şifrenizi Girin';

  @override
  String get signInActionText => "Giriş yap";

  @override
  String get registerActionText => "Kayıt Ol";

  @override
  String get signInButtonText => "Giriş yap";

  @override
  String get signInWithGoogleButtonText => "Google ile giriş yap";

  @override
  String get registerButtonText => "Kayıt ol";

  // @override
  // String get linkEmailButtonText => "";
  @override
  String get signInText => "Giriş yap";

  @override
  String get signInHintText => "Zaten hesabın var mı?";

  @override
  String get registerText => "Kaydol";

  @override
  String get registerHintText => "Hesabın yok mu?";

  // @override
  // String get signInHintText => "Hesabın";
  @override
  String get forgotPasswordButtonLabel => "Şifremi unuttum";

  @override
  String get forgotPasswordViewTitle => "Şifre sıfırlama";

  @override
  String get forgotPasswordHintText =>
      "Emailinizi girin ve size gönderilen maildeki linke tıklayarak şifrenizi sıfırlayın";

  @override
  String get resetPasswordButtonLabel => "Şifreyi sıfırla";

  @override
  String get passwordResetEmailSentText =>
      "Sana bir şifre sıfırlama maili gönderdik maildeki linke tıklayıp şifreni sıfırlayabilirsin.";

  @override
  String get goBackButtonLabel => "Geri dön";

  // Errors
  // String get confirmPasswordIsRequiredErrorText;
  // String get confirmPasswordDoesNotMatchErrorText;
  @override
  String get confirmPasswordInputLabel => "Şifrenizi onaylayın";

  @override
  String get unknownError => "Bilinmeyen hata";

  @override
  String get smsAutoresolutionFailedError => "Sms çözümleme hatası";

  @override
  String get emailIsRequiredErrorText => "Email girin";

  @override
  String get isNotAValidEmailErrorText => "Geçerli bir email girin";

  @override
  String get userNotFoundErrorText => "Kullanıcı bulunamadı";

  @override
  String get emailTakenErrorText;

  @override
  String get accessDisabledErrorText => "İzin reddedildi";

  @override
  String get wrongOrNoPasswordErrorText => "Hatalı veya geçersiz şifre";

  @override
  String get phoneNumberIsRequiredErrorText => "Telefon numarası girin";

  @override
  String get phoneNumberInvalidErrorText => "Geçersiz telefon numarası";

  @override
  String get passwordIsRequiredErrorText => "Şifre gerekli";

  @override
  String get confirmPasswordIsRequiredErrorText => "Şifrenizi onaylayın";

  @override
  String get confirmPasswordDoesNotMatchErrorText => "Şifreler eşleşmiyor";

  @override
  String get codeRequiredErrorText => "Kod gerekli";
}
