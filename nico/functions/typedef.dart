// typedef ListOfInts = List<int>;

// List<int> reverseListOfNumbers(ListOfInts list) {
//   var reversed = list.reversed; // revesed 메소드를 사용할 경우 타입이 Iterable<int>가 된다.
//   return reversed.toList(); // Iterable 타입을 list 로 다시 변환하여 리턴한다.
// }

// void main() {
//   reverseListOfNumbers([1,2,3]);
// }

typedef UserInfo = Map<String, String>;

String sayHi(UserInfo userInfo) {
  return "Hi ${userInfo['name']}";
}

void main() {
  sayHi({"name" : "hongs"});
}