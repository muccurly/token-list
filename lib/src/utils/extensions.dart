
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String priceSpace() {
    String number = "";
    String price = "";
    int counter = 0;
    bool used3 = false;
    if (used3 == false) {
      for (int i = 0; i < this.length; i++) {
        counter++;
        if (counter == 3) {
          counter = 0;
          price = price + this[this.length - 1 - i] + " ";
        } else {
          price = price + this[this.length - 1 - i];
        }
      }
      for (int i = 0; i < price.length; i++) {
        number = number + price[price.length - 1 - i];
      }
      price = number;
      used3 = true;
    }
    return price;
  }

  String splitAddress(){
    List<String> l = this.split(', ');
    return '${l[0]}, Район ${l[1]},\nУл. ${l[l.length-1]}';
  }

  String splitStreet(){
    List<String> l = this.split(', ');
    return l[l.length-1];
  }

  String splitComplexOrStreet(){
    List<String> l = this.split(', ');
    return l.length>3?l[2] : l[l.length-1];
  }

  String noWhiteSpaces() => this.replaceAll(' ', '');

}
