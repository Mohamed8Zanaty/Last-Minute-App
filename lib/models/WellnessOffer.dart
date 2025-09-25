
import 'package:flutter/material.dart';

class WellnessOffer {
  final String title;
  final String subtitle;
  final  bool featured;
  final IconData icon;
  final String category;
  final String discount;
  final String validUntil;
  final String description;
  final String oldPrice;
  final String newPrice;

  WellnessOffer({
    required this.title,
    required this.subtitle,
    required this.featured,
    required this.icon,
    required this.category,
    required this.discount,
    required this.validUntil,
    required this.description,
    required this.oldPrice,
    required this.newPrice,
  });
}
