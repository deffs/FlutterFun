
main(List<String> arguments) {

  print('Hello world');

  String bob = "John";
  String last = "Doe";
  int age = 40;

  print("$bob $last $age");
  print("Hello $bob ${last.toUpperCase()}");

  print(age is String);
  print(last is! int);

  doStuff();
}

void doStuff(
    {List<int> list = const [1, 2, 3],
      Map<String, String> gifts = const {
        'first': 'paper',
        'second': 'cotton',
        'third': 'leather'
      }}) {
  print('list:  $list');
  print('gifts: $gifts');
}