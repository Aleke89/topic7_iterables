void main(List<String> arguments) {
  // Task 1:
  // var list = [1,2,3,5,6];
  // print(list.map((e) => e*e));

  // Task 2:
  // var list = [1, 2, 3, 5, 6];
  // int max = list[0];
  // int min = list[0];
  // for (int i = 0; i < list.length; i++) {
  //   if (max < list[i]) {
  //     max = list[i];
  //   } else if (min > list[i]) {
  //     min = list[i];
  //   }
  // }
  // print(max);
  // print(min);

  // Task 3:
  // var list = [1, 2, 3, 5, 2, 1, 3, 4, 123, 4, 6];
  // int step = 2;
  // int startIndex = 1;
  // for (int i = 0; i < list.length; i++) {
  //   step++;
  //   if (startIndex <=i) {
  //     if (step.isEven) {
  //       print(list[i]);
  //     }
  //   }
  // }

  // Task 4:
  // var list = [1, -2, 3, -5, 2, -1, 3, -4, 123, 4, 6];
  // var resList = list.takeWhile((value) => value>=0);
  // print(resList);

  // Task 5:
  // var list = [1, -2, 3, -5, 2, -1, 3, -4, 123, 4, 6];
  // int numberOfPereustanovok = 6;
  // for (int i = 0; i < list.length; i++) {
  //   if (i == list.length) {
  //     break;
  //   }
  //   numberOfPereustanovok--;
  //   if (numberOfPereustanovok > 0) {
  //     int first = list[i];
  //     list[i] = list[i + 1];
  //     list[i + 1] = first;
  //   }
  // }
  // print(list);

  // Task 6:
  // final inputString = "aaabbbbccddddddeeeee";
  // final compressedString = compressString(inputString);
  // print("Original String: $inputString");
  // print("Compressed String: $compressedString");

  // Task 7:
  // int number = 90;
  // int i = 1;
  // while(i<number){
  //   if(i%5==0 && i%3==0){
  //     print("Fizz");
  //   }else if(i%5==0){
  //     print("Buzz");
  //   }else if(i%3==0){
  //     print("FizzBuzz");
  //   }
  //   i++;
  // }

  // Task 8:
  // for(int year = 2000;year<=2150;year++){
  //   final date = DateTime(year,12,25);
  //   if(date.weekday == DateTime.sunday){
  //     print("December 25, $year is a Sunday!");
  //   }
  // }

  // Task 9:
  // final digits = [6, 1, 1, 5];
  // final permutations = findValidTimePermutations(digits);
  // if (permutations.isNotEmpty) {
  //   final lastTime = permutations.last;
  //   final hours = lastTime[0] * 10 + lastTime[1];
  //   final minutes = lastTime[2] * 10 + lastTime[3];

  //   print(
  //       "valid time: ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}");
  // }

  // Task 10:
  // var soz = "asddascvasqrewdvaskqefgvzxq";
  // var list = [];
  // var target = "k";
  // StringBuffer stringBuffer = StringBuffer(soz);

  // for (int i = 0; i < stringBuffer.length; i++) {
  //   list.add(stringBuffer.toString()[i]);
  // }
  // for (int i = 0; i < list.length; i++) {
  //   if(list[i] == target){
  //     print(list.length-i);
  //     break;
  //   }
  // }

  // Task 11:
  // final inputString = "aaabbbbbcccdddeeeeee";
  // final maxSubstringLength = findMaxSameCharacterSubstring(inputString);
  // print(
  //     "Maximum length of a substring with all same characters: $maxSubstringLength");


  // Task 12:
  // int needSum = 5;
  // var list = [1, -2, 3, -5, 2, -1, 3, -4, 123, 4, 6];
  //  final result = findTwoElementsWithSum(list, needSum);

  // if (result.isNotEmpty) {
  //   print("The first two elements with the sum $needSum are: ${result[0]} and ${result[1]}");
  // } else {
  //   print("No two elements with the sum $needSum were found.");
  // }

  // Task 13:
  var list = [1, -2, 3, -5, 2, -1, 3, -4, 123, 4, 6];
  int difference = 0;
  for(int i = 0;i<list.length;i++){
    for(int j = i+1;j<list.length;j++){
      if(difference<list[i]-list[j]){
        difference = list[i]-list[j];        
      }
    }
    
  }
  print(difference);
}

List<int> findTwoElementsWithSum(List<int> numbers, int targetSum) {
  final Map<int, int> seenNumbers = {};
  for (int i = 0; i < numbers.length; i++) {
    final int complement = targetSum - numbers[i];
    
    if (seenNumbers.containsKey(complement)) {
      return [numbers[i], numbers[seenNumbers[complement]!]];
    } 
    seenNumbers[numbers[i]] = i;
  }
  return [];
}



int findMaxSameCharacterSubstring(String input) {
  if (input.isEmpty) {
    return 0;
  }
  int maxSubstringLength = 1;
  int currentSubstringLength = 1;
  for (int i = 1; i < input.length; i++) {
    if (input[i] == input[i - 1]) {
      currentSubstringLength++;
    } else {
      if (currentSubstringLength > maxSubstringLength) {
        maxSubstringLength = currentSubstringLength;
      }
      currentSubstringLength = 1;
    }
  }
  if (currentSubstringLength > maxSubstringLength) {
    maxSubstringLength = currentSubstringLength;
  }

  return maxSubstringLength;
}

List<List<int>> findValidTimePermutations(List<int> digits) {
  final List<List<int>> validTimes = [];

  for (int i = 0; i < digits.length; i++) {
    for (int j = 0; j < digits.length; j++) {
      for (int k = 0; k < digits.length; k++) {
        for (int l = 0; l < digits.length; l++) {
          if (i != j && i != k && i != l && j != k && j != l && k != l) {
            final time = [digits[i], digits[j], digits[k], digits[l]];
            if (isValidTime(time)) {
              validTimes.add(time);
            }
          }
        }
      }
    }
  }

  return validTimes;
}

bool isValidTime(List<int> time) {
  final hours = time[0] * 10 + time[1];
  final minutes = time[2] * 10 + time[3];
  return hours >= 0 && hours <= 23 && minutes >= 0 && minutes <= 59;
}

String compressString(String input) {
  if (input == null || input.isEmpty) {
    return input;
  }

  final StringBuffer compressed = StringBuffer();
  int count = 1;
  final int length = input.length;

  for (int i = 0; i < length; i++) {
    if (i < length - 1 && input[i] == input[i + 1]) {
      count++;
    } else {
      compressed.write(input[i]);
      if (count > 1) {
        compressed.write(count.toString());
      }
      count = 1;
    }
  }

  return compressed.toString();
}
