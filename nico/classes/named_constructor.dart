class Player {
  final String name;
  int xp, age;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  Player.createBluePlayer({
    required String name, 
    required int age
  }) :  this.age = age,
        this.name = name,
        this.team = "blue",
        this.xp = 0;

  Player.createRedPlayer({
    required String name, 
    required int age
  }) :  this.age = age,
        this.name = name,
        this.team = "red",
        this.xp = 0;


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