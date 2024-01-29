class Player {
  final String name = 'nico'; // property 변경을 막고 싶은 경우 final 사용
  int xp = 1500;

  void sayHello() {
    print("Hi my name is ${name}");
  }
}

void main(){
  var player = Player();
  player.sayHello();
}