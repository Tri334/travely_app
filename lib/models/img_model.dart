class BucketList {
  String img;
  String title;
  int follower;
  String titleDsc;
  String dsc;

  BucketList({
    required this.img,
    required this.title,
    required this.follower,
    required this.titleDsc,
    required this.dsc,
  });
}

var bucketList = [
  BucketList(
      img: 'assets/imgs/bucket_content1.png',
      title: 'Ultimate Bali',
      follower: 20,
      titleDsc: 'Here\'s the ultimate Bali budget 200\$++',
      dsc: 'Enjoy a luxury stay in a villa with your nearest and dearest. '),
  BucketList(
      img: 'assets/imgs/bucket_content1.png',
      title: 'Bali Cheap',
      follower: 15,
      titleDsc: 'Here\'s the ultimate Bali budget 150\$++',
      dsc: 'Enjoy a luxury stay in a villa with your nearest and dearest. '),
  BucketList(
      img: 'assets/imgs/bucket_content1.png',
      title: 'Ultimate Blue Eyes of Bali',
      follower: 25,
      titleDsc: 'Here\'s the ultimate Bali budget 600\$++',
      dsc: 'Enjoy a luxury stay in a villa with your nearest and dearest. '),
];
