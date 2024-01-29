void main() {
  String? name;
  name ??= 'nico'; // 초기 할당 값이 null 이기 때문에 'nico' 할당
  name = null;
  name ??= 'another'; // name 이 null 로 변경되었기 때문에 'another' 할당
}