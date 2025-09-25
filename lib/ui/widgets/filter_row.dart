import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class FilterRow extends StatelessWidget {
  final List<String> filters;
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;

  const FilterRow({
    required this.filters,
    required this.selectedFilter,
    required this.onFilterSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 24, right: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final f = filters[index];
          return FilterChipWidget(
            text: f,
            isSelected: f == selectedFilter,
            onTap: () => onFilterSelected(f),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: filters.length,
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final double bottomRadius;
  final double topRadius;

  const FilterChipWidget({
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.bottomRadius = 22.0,
    this.topRadius = 22.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(topRadius),
      topRight: Radius.circular(topRadius),
      bottomLeft: Radius.circular(bottomRadius),
      bottomRight: Radius.circular(bottomRadius),
    );

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? purple : Colors.white,
          borderRadius: borderRadius,
          border: Border.all(color: purple),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : purple,
                fontSize: 14,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
