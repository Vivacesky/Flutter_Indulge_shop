import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [0, 1, 3]
          .map(
            (_) => Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  width: (MediaQuery.of(context).size.width - 60) / 2,
                  height: (MediaQuery.of(context).size.width) / 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
