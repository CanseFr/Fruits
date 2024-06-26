
import 'dart:ui';

import 'package:flutter/material.dart';

bool isPrime(int number) {
  if (number <= 1) return false;
  if (number == 2 || number == 3) return true;

  if (number % 2 == 0 || number % 3 == 0) return false;

  int i = 5;
  while (i * i <= number) {
    if (number % i == 0 || number % (i + 2) == 0) return false;
    i += 6;
  }
  return true;
}

int getCounterType(value) {
  if (isPrime(value)) {
    return 0;
  } else if (value % 2 == 0) {
    return 2;
  } else {
    return 1;
  }
}

String getCounterTypeStr(value) {
  if (isPrime(value)) {
    return "premier";
  } else if (value % 2 == 0) {
    return "paire";
  } else {
    return 'impaire';
  }
}

Color? getColorOddOrNot(value){
  return value % 2 == 0 ? Colors.indigo[500] : Colors.blue[500];
}
