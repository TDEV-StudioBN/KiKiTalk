class AppAsset {
  static const AppAssetsPath path = AppAssetsPath._();
}

class AppAssetsPath {
  const AppAssetsPath._();

  ImagesAssets get images => const ImagesAssets._();
}

class ImagesAssets {
  const ImagesAssets._();

  Login get login => const Login._();
  AnimationAssets get animation => const AnimationAssets._();
  KiKiAssets get kiki => const KiKiAssets._();
}

class Login {
  const Login._();

  String get logoGoogle => 'assets/images/login/google.png';
}

class AnimationAssets {
  const AnimationAssets._();

  String get hellokitty1 => 'assets/images/animation/hellokitty1.png';
  String get hellokitty2 => 'assets/images/animation/hellokitty2.png';
  String get hellokitty3 => 'assets/images/animation/hellokitty3.png';
}

class KiKiAssets {
  const KiKiAssets._();

  DoraemonAssets get doraemon => const DoraemonAssets._();
  HelloKittyAssets get hellokitty => const HelloKittyAssets._();
}

class DoraemonAssets {
  const DoraemonAssets._();
  String get hello => 'assets/images/kiki/doraemon/hello.gif';
}

class HelloKittyAssets {
  const HelloKittyAssets._();
  String get hello => 'assets/images/kiki/hellokitty/hello.gif';
}