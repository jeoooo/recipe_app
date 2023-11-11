import 'package:flutter/material.dart';

String formatTime(TimeOfDay timeOfDay) {
  return "${timeOfDay.hour.toString().padLeft(2, '0')}hr ${timeOfDay.minute.toString().padLeft(2, '0')}m";
}
