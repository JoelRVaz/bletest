void main() {
  String hello = """
0x7b 0x0a 0x22 0x74 0x79 0x70 0x65 0x22 0x3a 0x20 0x22 0x63 0x6f 0x6d 0x6d 0x61 0x6e 0x64 0x22 0x2c 0x0a 0x22 0x63 0x6f 0x6d 0x6d 0x61 0x6e 0x64 0x22 0x3a 0x20 0x22 0x63 0x22 0x0a 0x7d
  """;
  List<String> split = hello.split(' ');
  split.removeRange(split.length - 2, split.length);
  print(split);
}
