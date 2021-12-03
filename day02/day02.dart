import 'dart:io';

void main() {
  List<String> list = File('day02.txt').readAsLinesSync();
  print(part1(list));
  print(part2(list));
}

int part1(List<String> list) {
  var commands = <String, int>{};
  list.forEach((e) {
    List<String> c = e.split(' ');
    int units = int.parse(c[1]);
    switch (c[0]) {
      case 'forward':
        commands.update(
          'horizontal',
          (value) => value + units,
          ifAbsent: () => units,
        );
        break;
      case 'down':
        commands.update(
          'depth',
          (value) => value + units,
          ifAbsent: () => units,
        );
        break;
      case 'up':
        commands.update(
          'depth',
          (value) => value - units,
          ifAbsent: () => units,
        );
        break;
    }
  });
  return commands['horizontal']! * commands['depth']!;
}

int part2(List<String> list) {
  var commands = <String, int>{'aim': 0, 'horizontal': 0, 'depth': 0};
  list.forEach((e) {
    List<String> c = e.split(' ');
    int units = int.parse(c[1]);
    switch (c[0]) {
      case 'forward':
        commands.update(
          'horizontal',
          (value) => value + units,
        );
        commands.update(
          'depth',
          (value) => value + (commands['aim']! * units),
        );
        break;
      case 'down':
        commands.update(
          'aim',
          (value) => value + units,
        );
        break;
      case 'up':
        commands.update(
          'aim',
          (value) => value - units,
        );
        break;
    }
  });
  return commands['horizontal']! * commands['depth']!;
}
