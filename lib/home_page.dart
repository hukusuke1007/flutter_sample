import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int? _selectedIndex;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
      ),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            reverse: true,
            controller: _scrollController,
            slivers: [
              SliverMainAxisGroup(
                slivers: [
                  SliverPadding(padding: EdgeInsets.only(bottom: 56)),

                  SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final bool isSelected = _selectedIndex == index;
                      return Directionality(
                        textDirection: TextDirection.ltr,
                        child: LayoutBuilder(
                          builder: (context, constants) {
                            final width = constants.maxWidth;
                            final height = constants.maxHeight;
                            return Stack(
                              children: [
                                SizedBox(
                                  width: width,
                                  height: height,
                                  child: Card(
                                    color: isSelected
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.primaryContainer
                                        : null,
                                    elevation: 2,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        setState(() {
                                          _selectedIndex = index;
                                        });
                                      },
                                      child: Center(
                                        child: Text(
                                          'Item $index',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }, childCount: 100),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
