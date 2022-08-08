part of '../../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _homeSelector = [
    Home(),
    const Center(child: Text('Location')),
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
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Text('Home')),
        ],
      ),
    );
  }
}
