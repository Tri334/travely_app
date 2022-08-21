part of '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _homeSelector = [
    Home(),
    Center(child: Text('Location')),
    const Center(child: Text('+')),
    const Center(child: Text('Feed')),
    const Center(child: Text('Profile')),
  ];

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    // log(index.toString());
    // log(selectedIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                backgroundColor: colorStyles.blue40,
                icon: const Icon(TravelyIcons.home_fill),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: colorStyles.blue40,
                icon: const Icon(TravelyIcons.location_fill),
                label: 'Location'),
            BottomNavigationBarItem(
                backgroundColor: colorStyles.blue40,
                icon: const Icon(Icons.add_circle_rounded),
                label: ''),
            BottomNavigationBarItem(
                backgroundColor: colorStyles.blue40,
                icon: const Icon(TravelyIcons.feed_fill),
                label: 'Feed'),
            BottomNavigationBarItem(
                backgroundColor: colorStyles.blue40,
                icon: const Icon(TravelyIcons.profile_fill),
                label: 'Profile'),
          ],
          elevation: 20, iconSize: 20.sp,
          // fixedColor: colorStyles.blue40,
          selectedLabelStyle: GoogleFonts.comfortaa(
              height: 1.5, fontWeight: FontWeight.w700, fontSize: 9.sp),
          selectedItemColor: colorStyles.accentPurple,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
          currentIndex: selectedIndex,
        ),
      ),
      body: _homeSelector.elementAt(selectedIndex),
    );
  }
}

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  GetSize tesSize = GetSize(size: 10.sp);

  @override
  Widget build(BuildContext context) {
    tesSize.setSize(18.sp);
    bool isSelected = true;
    List<String> bucketListCategory = [
      'All',
      'Popular',
      'Recomended',
      'Rating',
      'Lastest'
    ];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 2.h),
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: TopSection1(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.w, bottom: 2.h),
                  color: Colors.transparent,
                  child: TopSection2(),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: TopSection3(tesSize: tesSize),
                ),
                Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 3.h),
                            child: BucketListContent(
                                bucketListCategory: bucketListCategory,
                                isSelected: isSelected),
                          ),
                          FavoriteListContent()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopSection3 extends StatelessWidget {
  const TopSection3({
    Key? key,
    required this.tesSize,
  }) : super(key: key);

  final GetSize tesSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(26),
      elevation: 10,
      child: TextField(
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(26)),
            prefixIcon: const Icon(Icons.search),
            hintText: '${tesSize.getInfo()}',
            suffixIcon: const Icon(Icons.settings_input_composite_sharp)),
      ),
    );
  }
}

class TopSection2 extends StatelessWidget {
  const TopSection2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.location_history,
              size: 22.sp,
            ),
            SizedBox(
              width: 1.w,
            ),
            Text(
              'Jakarta',
              style: GoogleFonts.poppins(
                  color: colorStyles.black90,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp),
            ),
            Text(', Indonesia',
                style: GoogleFonts.poppins(
                    color: colorStyles.black70,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp))
          ],
        ),
        Text('1,890km traveling',
            style: GoogleFonts.poppins(
                color: colorStyles.black70,
                fontWeight: FontWeight.w400,
                fontSize: 11.sp))
      ],
    );
  }
}

class TopSection1 extends StatelessWidget {
  const TopSection1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.short_text_rounded,
          size: 30.sp,
        ),
        const Text('User Image'),
      ],
    );
  }
}

class FavoriteListContent extends StatelessWidget {
  const FavoriteListContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.h),
          child: Text('Favorite place',
              style: GoogleFonts.comfortaa(
                  color: colorStyles.black70,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp)),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 50.w,
                height: 23.h,
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              width: 190,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: AssetImage(bucketList[0].img),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                              bottom: 8.sp,
                              right: 8.sp,
                              child: CircleAvatar(
                                  radius: 10.sp,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.8),
                                  child: Center(
                                    child: Icon(
                                      size: 17.sp,
                                      Icons.favorite,
                                      color: const Color(0xffF66E6E),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Handara Gate'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(Icons.location_history),
                                Text('Jakarta'),
                                Text(', Indonesia')
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class BucketListContent extends StatelessWidget {
  const BucketListContent({
    Key? key,
    required this.bucketListCategory,
    required this.isSelected,
  }) : super(key: key);

  final List<String> bucketListCategory;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: Text('Bucketlist',
              style: GoogleFonts.comfortaa(
                  color: colorStyles.black70,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp)),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Wrap(
              children: bucketListCategory.map<Widget>((e) {
                return Padding(
                  padding: EdgeInsets.only(right: 3.w),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.7.h),
                    decoration: BoxDecoration(
                        color: isSelected
                            ? colorStyles.blue40
                            : colorStyles.grey10,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      e,
                      style: GoogleFonts.comfortaa(
                          color:
                              isSelected ? Colors.white : colorStyles.black10,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 45.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(bucketList[0].img),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    right: 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                          child: Column(
                            children: [
                              Text(bucketList[0].title),
                              Text('${bucketList[0].follower}k follow this')
                            ],
                          ),
                        ),
                        Container(
                          width: 40.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      child: Text(bucketList[0].titleDsc)),
                                ),
                                Expanded(
                                  flex: 2,
                                  child:
                                      Container(child: Text(bucketList[0].dsc)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Text('Read More..'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
