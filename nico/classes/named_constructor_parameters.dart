class Player {
  final String name;
  int xp;
  String team;
  int age;

  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player(name: "hogreed", xp: 1200, team: 'black', age: 32,);
  player.sayHello();
  var player2 = Player(name: "lynn", xp: 2500, team: 'white', age: 28,);
  player2.sayHello();
}