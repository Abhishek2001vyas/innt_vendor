import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

import '../../../../innt_delivery/Controllers/constant.dart';

class ChatScreen extends StatefulWidget {
  // ChatModel model;
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final now = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: true,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(color: logocolo, blurRadius: 0.5)]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/rashmika.jpg",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: w / 90,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: w / 3,
                  child: Text(
                    "Rashmika Mandana Shop Rashmika Mandana Shop Rashmika Mandana Shop",
                    maxLines: 1,
                    style: TextStyle(
                        //letterSpacing: 2,
                        overflow: TextOverflow.ellipsis,
                        color: logocolo,
                        fontFamily: "Amazon_med",
                        fontSize: 18),
                  ),
                ),
                Text(
                  "11:27 PM",
                  style: TextStyle(
                      color: logocolo,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const Spacer(
              flex: 5,
            ),
            Image.asset(
              "assets/images/shops.png",
              height: 25,
              width: 25,
              color: logocolo,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BubbleNormalAudio(
                  color: logocolo,
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
                  color: logocolo,
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
                  color: logocolo,
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
                  color: logocolo,
                  tail: false,
                  sent: true,
                  seen: true,
                  delivered: true,
                ),
                BubbleSpecialOne(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  isSender: false,
                  color: logocolo,
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
                  color: logocolo,
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
                  color: logocolo,
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                BubbleSpecialOne(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  tail: false,
                  color: logocolo,
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  sent: true,
                ),
                BubbleSpecialTwo(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  isSender: false,
                  color: logocolo,
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
                  color: logocolo,
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
                  color: logocolo,
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
                  color: logocolo,
                  delivered: true,
                ),
                BubbleSpecialThree(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  color: logocolo,
                  tail: false,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                BubbleSpecialThree(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  color: logocolo,
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
                  color: logocolo,
                  tail: false,
                  isSender: false,
                ),
                BubbleSpecialThree(
                  text: 'Lorem Ipsum is simply dummy text of the printing',
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  color: logocolo,
                  tail: true,
                  isSender: false,
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          MessageBar(
            // onSend: (){},
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic,
                        color: Colors.black,
                      ))
                ],
              ),
            ],
          ),
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
