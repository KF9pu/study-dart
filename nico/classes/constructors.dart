// class Player {
//   String name;
//   int xp;

//   // Player(String name, int xp) {
//   //   this.name = name;
//   //   this.xp = xp;
//   // }

//   Player(this.name, this.xp);
// }

// void main() {
//   var player = Player('nico', 1500);
//   var player2 = Player('lynn', 2500);
// }

// --------------------------------------

// class Player {
//   String name;
//   int xp;

//   Player.hello(this.name, this.xp){
//     print("Start Player_hello constructor");
//   }
// }

// void main() {
//   var player2 = Player.hello('lynn', 2500);
// }

// --------------------------------------

class Logger {
  static final Map<String, Logger> _cache = {};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  final String name;
}