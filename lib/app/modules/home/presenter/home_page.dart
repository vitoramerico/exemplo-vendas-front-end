import 'package:flutter/material.dart';
import 'package:flutter_vendas/app/modules/home/presenter/home_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final controller = Get.find<HomeController>();

  late AnimationController _animationController;

  final _animationDuration = Duration(milliseconds: 300);

  var _selectedIndex = 0;
  var _extended = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: _animationDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: <Widget>[
              MouseRegion(
                onHover: (_) {
                  if (_extended) return;
                  setExpanded();
                },
                onExit: (_) {
                  if (!_extended) return;
                  setCollapse();
                },
                child: NavigationRail(
                  elevation: 14,
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    _selectedIndex = index;
                    //setCollapse();
                    //Get.toNamed(Get.currentRoute + Routes.ORDER);
                  },
                  extended: _extended,
                  leading: Center(
                    child: AnimatedCrossFade(
                      firstChild: CircleAvatar(
                        child: Text(controller.sharedStore.name.substring(0, 1).toUpperCase()),
                      ),
                      secondChild: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.sharedStore.name,
                          style: Get.textTheme?.headline6,
                        ),
                      ),
                      crossFadeState: _extended ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: _animationDuration,
                    ),
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.post_add_outlined),
                      selectedIcon: Icon(Icons.post_add),
                      label: Text('Pedidos'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person_add_alt_1_outlined),
                      selectedIcon: Icon(Icons.person_add_alt_1),
                      label: Text('Clientes'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.qr_code_outlined),
                      selectedIcon: Icon(Icons.qr_code),
                      label: Text('Produtos'),
                    ),
                  ],
                ),
              ),
              VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: Center(
                  child: Lottie.asset(
                    'assets/animations/home_anim.json',
                    repeat: false,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void setExpanded() {
    setState(() {
      _animationController.forward();
      _extended = true;
    });
  }

  void setCollapse() {
    setState(() {
      _animationController.reverse();
      _extended = false;
    });
  }
}
