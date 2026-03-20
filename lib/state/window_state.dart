import 'package:flutter/material.dart';

int deskIdx = 0;

List<Map<String, dynamic>> deskApps = [
  {
    "name": "Desk 1",
    "current": null,
    "apps": <Widget>[]
  },
];

// 👇 notifier qui déclenche un rebuild quand l'état change
final windowStateNotifier = ValueNotifier<int>(0);

// Appelle cette fonction à chaque fois que tu modifies deskApps
void notifyWindowChange() {
  windowStateNotifier.value++;
}