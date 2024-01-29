// String sayHello({String name = 'name', int age = 0, String country = 'country' }) { // default 값 설정을 해준다.
String sayHello({String name = 'name', int age = 0, String country = 'country' }) {
  return "Hello $name, you are $age, and you come from $country";
}

void main(){
  print(sayHello(
    name : 'nico', 
    age : 19, 
    country:'korea'
  ));
}