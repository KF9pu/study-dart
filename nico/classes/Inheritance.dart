class Human {
  final String name;
  Human({required String this.name});
  void sayHello() {
    print("Hi my name is $name");
  }
}

enum Team { red, blue }

class Player extends Human {
  final Team team;

  Player({
    required this.team,
    required String name,
  }) : super(name: name); // super : 부모 클래스에 접근하기 위해서 사용한다.

  @override
  void sayHello() {
    super.sayHello();
    print('and I play for ${team}');
  }
}

void main() {
  var player = Player(name: "hogreed", team: Team.red);
  // player.name;
  player.sayHello();
}
