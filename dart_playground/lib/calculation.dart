String s1 = 'Hello, this is my first code with Flutter.\n';
String s2 = 'And this is second line.';
var s = '$s1 - $s2'; // s1 + s2;

int x = 10;
int y = x * 2;

List<int> numbers = [1, 4, 5, 7, 9, 10];

List<String> stringNumbers = numbers.map((num) => 'value = $num').toList();
