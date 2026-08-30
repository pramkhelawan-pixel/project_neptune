import 'package:flutter/material.dart';

import '../../../catches/presentation/pages/catch_history_page.dart';
import '../../../maps/presentation/pages/maps_page.dart';
import '../../../marine/presentation/pages/marine_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../species/presentation/pages/species_list_page.dart';
import '../widgets/home_dashboard.dart';

class MainShellPage extends StatefulWidget {
  const MainShellPage({super.key});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _selectedIndex = 0;

  final List<Widget Function()> _pageBuilders = [
    () => const HomeDashboard(),
    () => const MarinePage(),
    () => const CatchHistoryPage(),
    () => const SpeciesListPage(),
    () => const MapsPage(),
    () => const ProfilePage(),
  ];

  // Built lazily, one slot per tab: a tab's page is only constructed the
  // first time it's selected, then kept here (and stays in IndexedStack's
  // children below) so its state survives switching away and back. This is
  // what stops all six tabs' providers (GPS, Supabase, live map tiles) from
  // firing at once immediately after login.
  late final List<Widget?> _pages =
      List<Widget?>.filled(_pageBuilders.length, null);

  Widget _tabAt(int index) => _pages[index] ??= _pageBuilders[index]();

  @override
  Widget build(BuildContext context) {
    _tabAt(_selectedIndex);

    return Scaffold(
      appBar: AppBar(
        title: Text(_titleForIndex(_selectedIndex)),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          for (final page in _pages) page ?? const SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.waves_outlined),
            selectedIcon: Icon(Icons.waves),
            label: 'Marine',
          ),
          NavigationDestination(
            icon: Icon(Icons.phishing_outlined),
            selectedIcon: Icon(Icons.phishing),
            label: 'Catches',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Species',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Maps',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  String _titleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Neptune';
      case 1:
        return 'Marine';
      case 2:
        return 'Catches';
      case 3:
        return 'Species';
      case 4:
        return 'Maps';
      case 5:
        return 'Profile';
      default:
        return 'Neptune';
    }
  }
}