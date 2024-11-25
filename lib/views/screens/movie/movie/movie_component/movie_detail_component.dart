
import '../../../../../model/cast.dart';
import '../../../../../ui.dart';
import '../../../../navigation/app_routes.dart';
import '../../../../widgets/app_image.dart';

class CastComponent extends StatelessWidget {
  const CastComponent({super.key, required this.cast,});
final Cast cast;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(CastDetailScreenRoute(id: cast.id).location);
        // Navigator.push(context,
        //     MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        //       return CastDetailScreen(id:cast.id,);
        //     }));
      },
      child:  Column(
          children: <Widget>[
            AppImage.network(cast.posterImage,),
            const SizedBox(
              width: 30,
              height: 300,
            ),
            AppText(
              cast.name,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
    );
  }
}
