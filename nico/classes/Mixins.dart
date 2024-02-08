// Mixin : 생성자가 없는 클래스
mixin Strong {
  final double strenghtLevel = 1500.99;
}

mixin QuickRunner {
  void runQuick() {
    print("ruuuuuuuuuun!");
  }
}

mixin Tall {
  final double height = 1.99;
}

enum Team { red, blue }

class Player with Strong, QuickRunner, Tall {}

class Horse with Strong, QuickRunner {}

void main() {}
