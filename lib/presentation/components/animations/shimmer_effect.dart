import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400, // daha koyu zemin
      highlightColor: Colors.grey.shade600, // daha az parlak vurgu
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade800,
      ),
    );
  }
}
