void main() {
  String? name;
  name ??= 'nico';
  name = null;
  name ??= 'another';
}