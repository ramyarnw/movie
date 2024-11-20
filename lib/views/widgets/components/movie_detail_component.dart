import 'package:flutter/material.dart';

import '../../../model/cast.dart';
import '../../screens/app/cast_detail_screen.dart';

class CastComponent extends StatelessWidget {
  const CastComponent({super.key, required this.cast,});

  // final String castName;
  // final String imageURL;
final Cast cast;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return CastDetailScreen(id:cast.id,);
            }));
      },
      child:  Column(
          children: <Widget>[
            Image.network(cast.posterImage,width: 100,height: 100,),
            const SizedBox(
              width: 30,
              height: 300,
            ),
            Text(
              cast.name,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
    );
  }
}
