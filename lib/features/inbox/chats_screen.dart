import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_juno/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final List<int> _items = [];

  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _items.length,
        duration: const Duration(milliseconds: 500),
      );
      _items.add(_items.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Direct messages'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(FontAwesomeIcons.plus),
          ),
        ],
      ),
      // AnimatedList builder의 animation parameter를 공유하여 애니메이션 확장 예
      body: AnimatedList(
          key: _key,
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              key: UniqueKey(),
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/101643220?v=4",
                    ),
                    child: Text('Rogan'),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Rogan",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "2:16 PM",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: Sizes.size12,
                        ),
                      ),
                    ],
                  ),
                  subtitle: const Text("Don't forget to make video"),
                ),
              ),
            );
          }),
    );
  }
}
