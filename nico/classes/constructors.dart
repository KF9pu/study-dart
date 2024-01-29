class Player {
  final String name;
  int xp;

  // Player(String name, int xp) {
  //   this.name = name;
  //   this.xp = xp;
  // }

  Player(this.name, this.xp);
}

void main() {
  var player = Player('nico', 1500);
  var player2 = Player('lynn', 2500);
}