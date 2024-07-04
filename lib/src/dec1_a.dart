import '../utils/files.dart';

(int, int) firstAndLastDigits(String value) {
  final matches = RegExp(r'\d').allMatches(value);
  if(matches.isEmpty) {
    throw Exception('No digits found in $value');
  }
  return (int.parse(matches.first.group(0)!), int.parse(matches.last.group(0)!));
}

int concatenateNumbers(int first, int last) {
  return int.parse('$first$last');
}

int solve(List<String> values) {
  final List<int> numbers = values.map((value) {
    final (first, last) = firstAndLastDigits(value);
    return concatenateNumbers(first, last);
  }).toList();
  return numbers.reduce((value, element) => value + element);
}

const useGroundTruth = false;
final String inputPath = useGroundTruth ? '../../resources/dec1_a_ground_truth.txt' : '../../resources/dec1_a_input.txt';

void main() async {
  final List<String> values = await readLinesFromFile(inputPath);
  final int result = solve(values);
  print(result);
}
