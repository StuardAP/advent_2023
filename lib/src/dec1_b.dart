import '../utils/files.dart';

const Map<String, String> wordToNumberMapping = {
  'zero': '0',
  'one': '1',
  'two': '2',
  'three': '3',
  'four': '4',
  'five': '5',
  'six': '6',
  'seven': '7',
  'eight': '8',
  'nine': '9',
  '0': '0',
  '1': '1',
  '2': '2',
  '3': '3',
  '4': '4',
  '5': '5',
  '6': '6',
  '7': '7',
  '8': '8',
  '9': '9',
};

String reverseString(String str) {
  return str.split('').reversed.join();
}

String firstDigit(String str) {
  RegExp regex = RegExp('(${wordToNumberMapping.keys.join("|")})');
  final matches = regex.firstMatch(str);
  if (matches == null) {
    throw Exception("No match found for value $str");
  }
  return matches.group(0)!;
}

String lastDigit(String str) {
  str = reverseString(str);
  RegExp regex = RegExp(
      '(${wordToNumberMapping.keys.map((e) => reverseString(e)).join("|")})');
  final matches = regex.firstMatch(str);
  if (matches == null) {
    throw Exception("No match found for value $str");
  }
  return reverseString(matches.group(0)!);
}

int solve(List<String> values) {
  int sum = 0;
  for (final value in values) {
    final String first = firstDigit(value);
    final String last = lastDigit(value);
    if (!wordToNumberMapping.containsKey(first) ||
        !wordToNumberMapping.containsKey(last)) {
      throw Exception("No mapping for $first or $last");
    }
    sum +=
        int.parse("${wordToNumberMapping[first]}${wordToNumberMapping[last]}");
  }
  return sum;
}

const useGroundTruth = false;
final String inputPath = useGroundTruth
    ? '../../resources/dec1_b_ground_truth.txt'
    : '../../resources/dec1_b_input.txt';

void main() async {
  final List<String> values = await readLinesFromFile(inputPath);
  final int result = solve(values);
  print(result);
}
