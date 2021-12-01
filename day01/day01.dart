import 'dart:io';

void main() {
  List<int> l =
      File("day01.txt").readAsLinesSync().map((e) => int.parse(e)).toList();
  print(part1(l));
  print(part2(l));
}

int part1(List<int> l) {
  int c = 0;

  l.asMap().forEach((key, value) {
    if (key > 0) value > l[key - 1] ? c++ : null;
  });

  return c;
}

int part2(List<int> l) {
  int c = 0;
  List<int> sums = [];

  l.asMap().forEach((key, value) {
    if (key + 3 <= l.length) {
      int sum = l[key] + l[key + 1] + l[key + 2];
      sums.add(sum);
    }
    ;
  });

  sums.asMap().forEach((key, value) {
    if (key > 0) value > sums[key - 1] ? c++ : null;
  });

  return c;
}
