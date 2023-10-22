import 'package:netflix_clone/model/movie.dart';
import 'package:netflix_clone/model/series.dart';
import 'package:netflix_clone/model/user.dart';
import 'package:netflix_clone/model/watch.dart';

class DumpData {
  static Movie theHidden = Movie(
    "The Hidden",
    "the_hidden.jpg",
    2020,
    true,
    "The Hidden is a mysterious thriller that keeps you on the edge of your seat. With unexpected plot twists and brilliant acting, it's a must-watch for suspense enthusiasts.",
  );

  static Movie theMam = Movie(
    "The Mam",
    "the_mam.jpg",
    2021,
    false,
    "The Mam is a gripping drama that explores the complexities of family dynamics and human emotions. The powerful storytelling will leave you emotionally moved.",
  );

  static Movie spiderHead = Movie(
    "SpiderHead",
    "spider_head.jpg",
    2019,
    true,
    "SpiderHead is a thrilling adventure that takes you on a journey through uncharted territories. Join the brave explorers as they face danger and mystery.",
  );

  static Movie love = Movie(
    "Love",
    "love.jpg",
    2018,
    true,
    "Love is a heartwarming tale of romance and the enduring power of love. It beautifully captures the essence of human relationships and the magic of love.",
  );

  static Series lincoln = Series(
    "Lincoln",
    "lincoln.jpg",
    2022,
    true,
    "Lincoln is a thrilling series that follows the journey of a detective as he unravels complex cases. With compelling storytelling, it keeps you engaged for hours. The character development and plot twists are remarkable.",
    seasonCount: [10, 9, 8],
  );

  static Series old = Series(
    "Old",
    "old.jpg",
    2021,
    true,
    "Old is an intriguing series that explores the mysteries of a secluded island. The characters' lives intersect in unexpected ways, leading to gripping drama and suspense.",
    seasonCount: [4, 5, 5],
  );

  static Series snowflake = Series(
    "Snowflake",
    "snowflake.jpg",
    2020,
    false,
    "Snowflake is a dramatic series that delves into the lives of individuals from diverse backgrounds. As their stories unfold, you'll be immersed in a world of emotion, conflict, and human connections.",
    seasonCount: [4, 9, 12],
  );

  static List<User> userList = [
    User('ibrahim', 'assets/user/user_blue.png'),
    User('merve', 'assets/user/user_red.png'),
    User('elif', 'assets/user/user_yellow.png'),
    User('cafer', 'assets/user/user_kid.png'),
    User('Add Profile', 'assets/user/plus.png'),
  ];

  static List<String> continueWatchList = [
    'assets/watch/sthings.png',
    'assets/watch/manvsbee.png',
    'assets/watch/theavengers.png.png',
    'assets/watch/snowflakemountain.png',
  ];

  static List<Watch> onAgendaWatchList = [spiderHead, lincoln, love, snowflake];

  static List<Watch> watchList = [theHidden, old, theMam, snowflake];
}
