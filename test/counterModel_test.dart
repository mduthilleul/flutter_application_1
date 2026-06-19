import 'package:flutter_application_1/counterModel.dart';
import 'package:test/test.dart';

void main() {
  group('Test start, increment, decrement', () {
    test('value should start at 0', () {
      expect(CounterModel().counter, 0);
    });

    test('value should be incremented', () {
      final counter = CounterModel();
      counter.increment();
      expect(counter.counter, 1);
    });

    test('value should reset', () {
      final counter = CounterModel();
      counter.increment();
      counter.reset();
      expect(counter.counter, 0);
    });
  });
}
