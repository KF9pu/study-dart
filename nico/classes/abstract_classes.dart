abstract class Human {
  void walk();
}

enum Team { red, blue }

enum XPLevel { beginner, medium, pro }

class Coach extends Human {
  void walk() {
    print('the coach is walking');
  }
}

class Player extends Human {
  void walk() {
    print('im walk');
  }
}