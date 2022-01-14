class Util {
  static double getHeight({
    required double width,
    required double height,
    required double targetWidth,
  }) {
    if (width == targetWidth) {
      return height;
    }

    if (width > targetWidth) {
      //diminui proporcionalmente
      var rate = (targetWidth * 100) / width;
      return (height / 100) * rate;
    } else {
      //aumenta proporcionalmente
      var rate = (width * 100) / targetWidth;
      return height + ((height / 100) * rate);
    }
  }
}
