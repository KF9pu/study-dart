class Player {
  String name;
  int xp;

  // Player(String name, int xp) {
  //   this.name = name;
  //   this.xp = xp;
  // }

  // Player(this.name, this.xp);

  Player.hello(this.name, this.xp){
    print("Start Player_hello constructor");
  }
}

void main() {
  // var player = Player('nico', 1500);
  var player2 = Player.hello('lynn', 2500);
}