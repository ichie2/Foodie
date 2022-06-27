import 'package:fooddelivery/core/exports.dart';
import 'package:fooddelivery/presentation/screens/dashboard.dart';
import 'package:fooddelivery/presentation/screens/favorite.dart';
import 'package:fooddelivery/presentation/screens/history.dart';
import 'package:fooddelivery/presentation/screens/profile.dart';

class Home extends StatefulWidget {
  final Function? onPressed;

  const Home({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // current page index
  int _currentIndex = 0;

  // Page controller
  final PageController _pageController = PageController();

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  onItemTapped(index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: PageView(
          // key: _globalKey,
          children: [
            Dashboard(
              onPressed: () {},
            ),
            const Favorite(),
            const Profile(),
            const History()
          ],
          controller: _pageController,
          onPageChanged: onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // key: _globalKey,
          currentIndex: _currentIndex,
          onTap: onItemTapped,
          selectedItemColor: primaryColor,
          unselectedItemColor: greyColor,
          backgroundColor: theme.backgroundColor,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
