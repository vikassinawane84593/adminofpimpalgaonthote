import 'package:adminpanelofpimpalgaonthtevilage/customwidgets/lighttimetable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lighttimetablemodel {

  final String  dayStart;
  final String  dayEnd;
  final String  nightStart;
  final String  nightEnd;
  final String  selectedDate;

  Lighttimetablemodel({
    required this.dayStart,
    required this.dayEnd,
    required this.nightStart,
    required this.nightEnd,
    required this.selectedDate,
  });

  Map<String, dynamic> toMap(){

    return {
      'dayStart': dayStart,
      'dayEnd': dayEnd,
      'nightStart': nightStart,
      'nightEnd': nightEnd,
      'selectedDate': selectedDate,
    };

  }
}

