otpValidator(String name) {
  if (name.isEmpty) {
    return 'Please enter OTP';
  }
  if (name.isNotEmpty && name.length < 4) {
    return 'Please enter OTP';
  }
}
