import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserChat extends StatefulWidget {
  // ChatModel model;
  final userid;
  final userimage;
  final username;

  UserChat({Key? key, this.userid, this.userimage, this.username})
      : super(key: key);

  @override
  _UserChatState createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              color: const Color(0xff020223),
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
            ),
            const Spacer(),
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/man.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                )),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Amit",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "11:27 PM",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BubbleNormalImage(
                  id: 'id001',
                  image: _image(),
                  tail: true,
                  delivered: true,
                ),
                BubbleNormalAudio(
                  color: const Color(0xfff1cb0b),
                  duration: duration.inSeconds.toDouble(),
                  position: position.inSeconds.toDouble(),
                  isPlaying: isPlaying,
                  isLoading: isLoading,
                  isPause: isPause,
                  onSeekChanged: _changeSeek,
                  onPlayPauseButtonClick: _playAudio,
                  sent: true,
                ),
                BubbleNormal(
                  text: 'Hey! How are You',
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  isSender: true,
                  color: Get.theme.primaryColor,
                  tail: true,
                  sent: true,
                ),
                DateChip(
                  date: DateTime(now.year, now.month, now.day - 2),
                ),
                BubbleNormal(
                  text:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
                  isSender: false,
                  color: Get.theme.primaryColor,
                  tail: false,
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                BubbleNormal(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  color: Get.theme.primaryColor,
                  tail: false,
                  sent: true,
                  seen: true,
                  delivered: true,
                ),
                BubbleSpecialOne(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  isSender: false,
                  color: Get.theme.primaryColor,
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                DateChip(
                  date: DateTime(now.year, now.month, now.day - 1),
                ),
                BubbleSpecialOne(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  color: Get.theme.primaryColor,
                  seen: true,
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                BubbleSpecialOne(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  isSender: false,
                  tail: false,
                  color: Get.theme.primaryColor,
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                BubbleSpecialOne(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  tail: false,
                  color: Get.theme.primaryColor,
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  sent: true,
                ),
                BubbleSpecialTwo(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  isSender: false,
                  color: Get.theme.primaryColor,
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                DateChip(
                  date: now,
                ),
                BubbleSpecialTwo(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  isSender: true,
                  color: Get.theme.primaryColor,
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  sent: true,
                ),
                BubbleSpecialTwo(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  isSender: false,
                  tail: false,
                  color: Get.theme.primaryColor,
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                BubbleSpecialTwo(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  tail: false,
                  color: Get.theme.primaryColor,
                  delivered: true,
                ),
                BubbleSpecialThree(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  color: Get.theme.primaryColor,
                  tail: false,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                BubbleSpecialThree(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  color: Get.theme.primaryColor,
                  tail: true,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                BubbleSpecialThree(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  color: Get.theme.primaryColor,
                  tail: false,
                  isSender: false,
                ),
                BubbleSpecialThree(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  color: Get.theme.primaryColor,
                  tail: true,
                  isSender: false,
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          // MessageBar(
          //   onSend: () => print(),
          //   actions: [
          //     InkWell(
          //       child: const Icon(
          //         Icons.add,
          //         color: Colors.black,
          //         size: 24,
          //       ),
          //       onTap: () {},
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
        constraints: const BoxConstraints(
          minHeight: 20.0,
          minWidth: 20.0,
        ),
        child: Image.asset("assets/images/man.png"));
  }

  void _changeSeek(double value) {
    setState(() {});
  }

  void _playAudio() async {
    'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3';
    if (isPause) {
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });

      setState(() {
        isPlaying = true;
      });
    }
  }
}
