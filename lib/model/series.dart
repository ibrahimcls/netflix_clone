
import 'package:netflix_clone/model/watch.dart';

class Series extends Watch {
  List<int> seasonCount;
  Series(
    super.name,
    super.image,
    super.year,
    super.isVision,
    super.description,{
      required this.seasonCount,
    }
  );

}