import 'package:flutter/material.dart';

import '../review/tv_review_screen.dart';

class TvDetailScreen extends StatefulWidget {
  const TvDetailScreen({super.key});

  @override
  State<TvDetailScreen> createState() => _TvDetailScreenState();
}
late final int tvId;
class _TvDetailScreenState extends State<TvDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        children: <Widget>[
          const Text('Tv Show details here'),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext c) =>
                      TvReviewScreen(tvId: tvId,),
                ),
              );
            },
            child: const Text('Review'),
          ),
        ],
      ),
    );
    
  }
}
