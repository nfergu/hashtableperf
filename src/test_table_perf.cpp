#include <iostream>
#include <chrono>
#include <vector>
#include <algorithm>
#include <unordered_map>

using namespace std::chrono;

int main () {

  long warmUpIterations = 100000000;
  long mainIterations = 1000000000;
  int maxInt = 10000;

  std::unordered_map<int, int> map;

  long sum = 0;

  // Warm-up
  for (long i = 0; i < warmUpIterations; i++) {
    int num1 = (int)i % maxInt;
    int num2 = num1 * 2;
    int num3 = num1 + 1;
    map[num1] = num2;
    int value = map[num3];
    if (value) {
      // Make sure we do something with the result so that it is not optimized away
      sum += value;
    }
  }

  std::cout << "Map size is " << map.size() << std::endl;;

  // Main execution
  auto start = std::chrono::high_resolution_clock::now();
  for (long i = 0; i < mainIterations; i++) {
    int num1 = (int)i % maxInt;
    int num2 = num1 * 2;
    int num3 = num1 + 1;
    map[num1] = num2;
    int value = map[num3];
    if (value) {
      // Make sure we do something with the result so that it is not optimized away
      sum += value;
    }
  }
  auto stop = std::chrono::high_resolution_clock::now();
  auto testTime = duration_cast<duration<double>>(stop - start);

  // Just to be extra sure nothing can be optimized away at compilation or run-time
  // we print the sum here.
  std::cout << "Sum (ignore this): " << sum << std::endl;;

  std::cout << "Test time: " << testTime.count() << " seconds" << std::endl;

}