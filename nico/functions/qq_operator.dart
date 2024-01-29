String capitalizeName (String? name) => name?.toUpperCase() ?? "ANON";

void main() {
  capitalizeName('home');
  capitalizeName(null);
}