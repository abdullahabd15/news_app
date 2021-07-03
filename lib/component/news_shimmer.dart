import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmer extends StatelessWidget {
  const NewsShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[200],
      baseColor: Colors.grey[400],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Container(
          height: 100,
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[400], width: 1),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 150,
                color: Colors.grey[400],
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 12,
                          width: MediaQuery.of(context).size.width * .6,
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 12,
                          width: MediaQuery.of(context).size.width * .6,
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 12,
                          width: MediaQuery.of(context).size.width * .4,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                    Container(
                      height: 12,
                      width: 120,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
