
class Numbers {
  static String getSeconds (int time) {
    if (time < 10) {
      return "00:0$time";
    }

    return "00:$time";
  }

  static double getPercents (int inSeconds) {
    double total = 29;

    return (inSeconds / total) ;
  }
}