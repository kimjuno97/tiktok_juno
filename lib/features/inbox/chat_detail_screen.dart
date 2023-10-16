import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_juno/constants/gap.dart';
import 'package:tiktok_juno/constants/sizes.dart';
import 'package:tiktok_juno/utils.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: const CircleAvatar(
            radius: Sizes.size24,
            foregroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/3612017",
            ),
            child: Text('니꼬'),
          ),
          title: const Text(
            '니꼬',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text('Active now'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Theme.of(context).iconTheme.color,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Theme.of(context).iconTheme.color,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => Gaps.v10,
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size14,
            ),
            itemBuilder: (context, index) {
              final isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(Sizes.size14),
                    decoration: BoxDecoration(
                      color:
                          isMine ? Colors.blue : Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(Sizes.size20),
                        topRight: const Radius.circular(Sizes.size20),
                        bottomLeft: Radius.circular(
                          isMine ? Sizes.size20 : Sizes.size5,
                        ),
                        bottomRight: Radius.circular(
                          !isMine ? Sizes.size20 : Sizes.size5,
                        ),
                      ),
                    ),
                    child: const Text(
                      "this is a message!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
              color: isDarkMode(context) ? Colors.black : Colors.grey.shade50,
              child: const Row(
                children: [
                  Expanded(child: TextField()),
                  Gaps.h20,
                  FaIcon(FontAwesomeIcons.paperPlane),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
