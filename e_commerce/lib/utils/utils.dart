class Utils {
  
  static String capitalizeTitle(String s) {
    if (s.isEmpty) {
      return s;
    } else {
      return s
          .split(' ')
          .map((word) {
            if (word.isEmpty) {
              return word; // keep empty parts
            } else {
              return word[0].toUpperCase() + word.substring(1).toLowerCase();
            }
          })
          .join(' ');
    }
  }
}
