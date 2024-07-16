// import 'package:chat_bubbles/chat_bubbles.dart';
// import 'package:flutter/material.dart';
//
// import '../../Controllers/constant.dart';
import 'dart:async';
import 'dart:io';

// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vengamo_chat_ui/theme/app_color.dart';
import 'package:video_player/video_player.dart';
import '../../../innt_vendor/view/Api/meassage_api.dart';
import 'package:vengamo_chat_ui/vengamo_chat_ui.dart';

import '../../../ulits/constant.dart';
import '../../Api/chatapidelivery.dart';
import '../../Controllers/constant.dart';


late AudioPlayer audioPlayer = AudioPlayer();

class ChatScreendelivery extends StatefulWidget {
  final userid;
  final userimage;
  final username;

  ChatScreendelivery({Key? key, this.userid, this.userimage, this.username})
      : super(key: key);

  @override
  _ChatScreendeliveryState createState() => _ChatScreendeliveryState();
}

class _ChatScreendeliveryState extends State<ChatScreendelivery> {
  ScrollController _scrollController = ScrollController();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;
  final chat_api1 = Get.put(chat_apii());
  late VideoPlayerController controllervideo1;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollToBottom();
    });
    super.initState();
  }


  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.devicePixelRatio,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }


  @override
  void dispose() {
    _scrollController.dispose();
    controllervideo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery
        .of(context)
        .size
        .width;
    final h = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(

      appBar: AppBar(
          toolbarHeight: 60,
          // forceMaterialTransparency: true,
          automaticallyImplyLeading: true,
          title: Row(
            children: [
              CircleAvatar(radius: 25, backgroundImage:
              NetworkImage(
                "${image_url}${widget.userimage}",
                scale: 4,


              ),)
              ,
              SizedBox(
                width: w / 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.username}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Ember"),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "11:27 PM",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Ember"),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          )

      ),
      body:

      Stack(
        children: [
          StreamBuilder(
            stream: chat_api1.uservenderchat(widget.userid),
            builder: (context, snapshot) {
              return
                snapshot.hasData == "true" ||
                    chat_api1.uservenderchatlist.isEmpty ?
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(height: h / 1.25,
                      child: Center(child: Text("NO Message"),)),
                ) :
                SizedBox(
                  height: h / 1.25,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: chat_api1.uservenderchatlist[0]["data"].length,
                    itemBuilder: (context, index) {
                      var findvideo1 = chat_api1.uservenderchatlist.elementAt(
                          0)["data"][index]["text"]
                          .split('.')
                          .last
                          .toLowerCase();
                      print("hgfuihuihguih ${findvideo1} ${chat_api1
                          .uservenderchatlist.elementAt(
                          0)["data"][index]["send_status"].toString()}");

                      return
                        chat_api1.uservenderchatlist.elementAt(
                            0)["data"][index]["send_status"].toString() ==
                            "4" &&
                            findvideo1 == "jpg" ||
                            findvideo1 == "png" ||
                            findvideo1 == "jpeg" ?

                        BubbleNormalImage(
                          image: Image.network("$image_url${chat_api1
                              .uservenderchatlist.elementAt(
                              0)["data"][index]["text"].toString()}"),
                          color: logocolo,
                          tail: false,
                          sent: true,
                          isSender: false,
                          seen: true,
                          delivered: true,
                          id: '$index',
                        ) :

                        chat_api1.uservenderchatlist.elementAt(
                            0)["data"][index]["send_status"].toString() ==
                            "1" &&
                            findvideo1 == "jpg" ||
                            findvideo1 == "png" ||
                            findvideo1 == "jpeg" ?

                        BubbleNormalImage(
                          image: Image.network("$image_url${chat_api1
                              .uservenderchatlist.elementAt(
                              0)["data"][index]["text"].toString()}"),
                          color: logocolo,
                          tail: false,
                          sent: true,
                          isSender: true,
                          seen: true,
                          delivered: true,
                          id: '$index',
                        ) :

                        chat_api1.uservenderchatlist.elementAt(
                            0)["data"][index]["send_status"].toString() !=
                            "1" &&
                            findvideo1 == "mp4" ||
                            findvideo1 == "mov" ||
                            findvideo1 == "avi" ||
                            findvideo1 == "mkv" ?


                        VideoWithImagePlaceholder(
                          videoUrl: "$image_url${chat_api1.uservenderchatlist
                              .elementAt(0)["data"][index]["text"].toString()}",
                          no: 1,)
                        // NewWidget(initializeVideoPlayerFuture2: initializeVideoPlayerFuture2, controllervideo1: controllervideo1)
                            :

                        chat_api1.uservenderchatlist.elementAt(
                            0)["data"][index]["send_status"].toString() !=
                            "4" &&
                            findvideo1 == "mp4" ||
                            findvideo1 == "mov" ||
                            findvideo1 == "avi" ||
                            findvideo1 == "mkv" ?

                        VideoWithImagePlaceholder(
                          videoUrl: "$image_url${chat_api1.uservenderchatlist
                              .elementAt(0)["data"][index]["text"].toString()}",
                          no: 0,)
                            :


                        chat_api1.uservenderchatlist.elementAt(
                            0)["data"][index]["send_status"].toString() ==
                            "4" &&
                            findvideo1 == "mp3" ?

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VengamoChatUI(
                              senderBgColor: logocolo,
                              receiverBgColor: logocolo,
                              isSender: false,
                              isNextMessageFromSameSender: false,
                              time: getTime(),
                              isAudio: true,
                              audioSource: '$image_url${chat_api1
                                  .uservenderchatlist.elementAt(
                                  0)["data"][index]["text"]}',
                              timeLabelColor: AppColors.iconColor,
                              pointer: true,
                              ack: Icon(Icons.audiotrack, size: 15,)
                          ),
                        )


                        // BubbleNormalAudio(
                        //   color: logocolo,
                        //   duration: duration.inSeconds.toDouble(),
                        //   position: position.inSeconds.toDouble(),
                        //   isPlaying: isPause,
                        //   isLoading: isLoading,
                        //   isPause: isPause,
                        //   onSeekChanged: _changeSeek,
                        //  onPlayPauseButtonClick:
                        //  _playAudio('$image_url${chat_api1.uservenderchatlist.elementAt(0)["data"][index]["text"]}'),
                        //  //_playPauseButtonClick('$image_url${chat_api1.uservenderchatlist.elementAt(0)["data"][index]["text"].toString()}'),
                        //   sent: false,
                        // )
                            :

                        chat_api1.uservenderchatlist.elementAt(
                            0)["data"][index]["send_status"].toString() ==
                            "1" &&
                            findvideo1 == "mp3" ?

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VengamoChatUI(
                              senderBgColor: logocolo,
                              receiverBgColor: logocolo,
                              isSender: true,
                              isNextMessageFromSameSender: false,
                              time: getTime(),
                              isAudio: true,
                              audioSource: '$image_url${chat_api1
                                  .uservenderchatlist.elementAt(
                                  0)["data"][index]["text"]}',
                              timeLabelColor: AppColors.iconColor,
                              pointer: true,
                              ack: Icon(Icons.audiotrack, size: 15,)
                          ),
                        ) :
                        chat_api1.uservenderchatlist.elementAt(
                            0)["data"][index]["send_status"].toString() == "1" ?
                        BubbleNormal(
                          text: '${chat_api1.uservenderchatlist.elementAt(
                              0)["data"][index]["text"].toString()}',
                          textStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          color: logocolo,
                          tail: false,
                          sent: true,
                          seen: true,
                          delivered: true,
                        )
                            :


                        chat_api1.uservenderchatlist.elementAt(
                            0)["data"][index]["send_status"].toString() != "1" ?
                        BubbleNormal(
                          text: '${chat_api1.uservenderchatlist.elementAt(
                              0)["data"][index]["text"].toString()}',
                          textStyle: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          color: logocolo,
                          tail: false,
                          isSender: false,
                          sent: true,
                          seen: true,
                          delivered: true,
                        ) : null

                      ;
                    },),
                );
            },),


          MessageBar(
            onSend: (p0) async {
              await chat_api1.chatsendlist(widget.userid, p0.toString());
              _scrollToBottom();
            },
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.attach_file,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () async {
                      await bottomshet();

                      //Get.to(Pickview(shopname: widget.shopname,shopid: widget.venderid,));
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        cam();
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
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


  Future initializeVideoPlayerFuture1() {
    return initializeVideoPlayerFuture2 =
        controllervideo1.initialize().catchError((error) {
          print("Error initializing video player: $error");
        }).then((_) {
          // Once video has been initialized, start playing it
          //controllervideo.setVolume(_muted ? 0 : 1);

          // controllervideo1.setLooping(true);
          setState(() {});
        });
  }

  Future<void> initializeVideoPlayerFuture2 = Future.value();

  Widget _image() {
    return Container(
        constraints: const BoxConstraints(
          minHeight: 20.0,
          minWidth: 20.0,
        ),
        child: Image.asset("assets/images/man.png"));
  }

// Define the _changeSeek function
  _changeSeek(double value) {
    // Assuming audioPlayer is initialized somewhere in your code
    if (audioPlayer != null) {
      try {
        // Seek to the specified position
        audioPlayer.seek(Duration(seconds: value.toInt()));
      } catch (e) {
        // Handle any errors that occur during seek operation
        print("Error seeking audio: $e");
        // You can also update UI state to reflect the error, if needed
      }
    } else {
      print("Error: audioPlayer is not initialized");
      // Handle the case where audioPlayer is not initialized
    }
  }


// Define the _playPauseButtonClick function
  _playPauseButtonClick(audioUrl) async {
    // Assuming audioPlayer is initialized somewhere in your code
    if (audioPlayer != null) {
      try {
        // Play the audio
        await audioPlayer.play(audioUrl);

        // Update UI state as needed
        setState(() {
          isPlaying = true;
          isPause = false;
          isLoading = false;
        });
      } catch (e) {
        // Handle any errors that occur during audio playback
        print("Error playing audio: $e");
        // You can also update UI state to reflect the error, if needed
      }
    } else {
      print("Error: audioPlayer is not initialized");
      // Handle the case where audioPlayer is not initialized
    }
  }


  getTime() {
    return "00.00";
  }

  _playAudio(urll) async {
    // final player = AudioPlayer();
    // await player.play(UrlSource( '$urll'));
    "$urll";
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

  bottomshet() {
    Get.bottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              ListTile(
                leading: Icon(
                  Icons.camera_alt,
                ),
                title: Text('Camera',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                onTap: () {
                  cam();
                  Get.back();
                  // pickImage(ImageSource!.camera,);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.image,
                  // color: colors.primary,
                ),
                title: Text('Gallary',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                onTap: () {
                  gall();
                  Get.back();
                  // pickImage(ImageSource!.gallery);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.video_collection_outlined,
                  // color: colors.primary,
                ),
                title: Text('Videos',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                onTap: () {
                  videos();
                  Get.back();
                  // pickImage(ImageSource!.gallery);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.mic,
                ),
                title: Text('Audio',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                onTap: () {
                  audieo();
                  Get.back();
                },
              ),
            ],
          ),
        ));
  }

  Future cam() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.camera, imageQuality: 80,);

    if (image != null) {
      chat_api1.imagePath.value = image.path.toString();
      print("iiiiiiiiii ${chat_api1.imagePath.value}");
      findvideo =
          chat_api1.imagePath
              .split('.')
              .last
              .toLowerCase();
    }
    Get.to(Pickview(shopname: widget.username,
      shopid: widget.userid,
      shopimage: widget.userimage,));
  }

  Future gall() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (image != null) {
      chat_api1.imagePath.value = image.path.toString();
      print("iiiiiiiiii ${chat_api1.imagePath.value}");
      findvideo =
          chat_api1.imagePath
              .split('.')
              .last
              .toLowerCase();
    }
    Get.to(Pickview(shopname: widget.username,
      shopid: widget.userid,
      shopimage: widget.userimage,));
  }

  Future videos() async {
    var image = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (image != null) {
      chat_api1.imagePath.value = image.path.toString();
      controllervideo = VideoPlayerController.file(File(image.path));
      initializeVideoPlayerFuture =
          controllervideo.initialize().catchError((error) {
            print("Error initializing video player: $error");
          }).then((_) {
            // Once video has been initialized, start playing it
            //controllervideo.setVolume(_muted ? 0 : 1);
            controllervideo.play();
            controllervideo.setLooping(true);
            setState(() {});
          });

      controllervideo.addListener(_videoListener);
      findvideo =
          chat_api1.imagePath
              .split('.')
              .last
              .toLowerCase();
    }
    Get.to(Pickview(shopname: widget.username,
      shopid: widget.userid,
      shopimage: widget.userimage,));
  }


  void _videoListener() {
    if (controllervideo.value.isPlaying) {

    }
  }

  Future audieo() async {
    var image = await FilePicker.platform.pickFiles(
      type: FileType.audio, // Specify that you want to pick audio files
    );
    if (image != null) {
      PlatformFile file = image.files.first;
      chat_api1.imagePath.value = file.path!.toString();
      findvideo =
          chat_api1.imagePath
              .split('.')
              .last
              .toLowerCase();
    }
    Get.to(Pickview(shopname: widget.username,
      shopid: widget.userid,
      shopimage: widget.userimage,));
  }
}


class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.initializeVideoPlayerFuture2,
    required this.controllervideo1,
  });

  final Future<void> initializeVideoPlayerFuture2;
  final VideoPlayerController controllervideo1;

  @override
  Widget build(BuildContext context) {
    return Positioned(left: 1,
        child: FutureBuilder(
            future: initializeVideoPlayerFuture2,
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(
                  color: logocolo,)); // Show a loading indicator while the video is initializing
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot
                    .error}'); // Show an error message if initialization fails
              } else {
                return Container(
                  height: 100, width: 50,
                  child: VideoPlayer(controllervideo1),
                );
              }
            })
    );
  }
}


final player = AudioPlayer();
var findvideo;
late Future<void> initializeVideoPlayerFuture;
late VideoPlayerController controllervideo;


class Pickview extends StatefulWidget {
  final shopname;
  final shopid;
  final shopimage;

  const Pickview(
      {super.key, this.shopname, this.shopid, required this.shopimage,});

  @override
  State<Pickview> createState() => _PickviewState();
}

class _PickviewState extends State<Pickview> {
  final chat_api1 = Get.put(chat_apii());

  // final assetsAudioPlayer = AssetsAudioPlayer();


  @override
  Widget build(BuildContext context) {
    final w = MediaQuery
        .of(context)
        .size
        .width;
    final h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Stack(
        children: [

          findvideo == "mp3" ?
          Container(
              height: h, width: w,
              child: AudioPlayerScreen(urlpath: chat_api1.imagePath.value,))

              :

          findvideo == "mp4" ||
              findvideo == "mov" ||
              findvideo == "avi" ||
              findvideo == "mkv" ?


          FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                return
                  Center(
                    child: Container(
                      height: h / 2, width: w,
                      child: VideoPlayer(controllervideo),
                    ),
                  );
              }
          )
              :

          Obx(() =>
              Container(
                width: w, height: h,
                decoration: BoxDecoration(image: DecorationImage(
                    image:
                    FileImage(File(
                        chat_api1.imagePath.toString())))
                ),
              )),


          Positioned(
              left: 5, top: h / 30,
              child:
              IconButton(onPressed: () {
                chat_api1.imagePath.value = "";
                Get.back();
              },
                  icon: Icon(
                    Icons.cancel_outlined, color: logocolo, size: 40,))),
          Positioned(bottom: 1, right: 5, left: 5,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(decoration: BoxDecoration(
                  color: logocolo, borderRadius: BorderRadius.circular(15),),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${widget.shopname}",
                          style: TextStyle(color: Colors.white)),
                    )),

                Obx(() =>
                chat_api1.loading == true ?
                Center(child: CircularProgressIndicator(color: logocolo),) :
                IconButton(onPressed: () async {
                  await chat_api1.chatimageapi(
                      widget.shopid, chat_api1.imagePath.value.toString(),
                      widget.shopname, widget.shopimage);
                }, icon: Icon(Icons.send, color: logocolo, size: 40,))
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}


class AudioPlayerScreen extends StatefulWidget {
  final urlpath;

  const AudioPlayerScreen({super.key, this.urlpath,});

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    //_audioPlayer.setSourceDeviceFile(widget.urlpath);
    _audioPlayer.play(DeviceFileSource(widget.urlpath.toString()),
        position: Duration(seconds: 10));
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });

    // Start a timer to periodically update the current position
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _audioPlayer.getCurrentPosition().then((Duration? position) {
        setState(() {
          _position = position ?? Duration.zero;
        });
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when disposing the screen
    _audioPlayer.dispose();
    super.dispose();
  }

  void _changeSeek(double value) {
    final newPosition = Duration(seconds: value.toInt());
    _audioPlayer.seek(newPosition);
  }

  void _playPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.resume();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery
        .of(context)
        .size
        .width;
    final h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(backgroundColor: Colors.black,

      body: Center(
        child: Container(width: w, height: h / 3, color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [

                Center(child: Icon(Icons.audiotrack_outlined, size: 30),),
                Center(child:
                _isPlaying ?
                IconButton(onPressed: () {
                  _playPause();
                }, icon: Icon(Icons.play_arrow))
                    :
                IconButton(onPressed: () {
                  setState(() {
                    _playPause();
                  });
                }, icon: Icon(Icons.pause))
                  ,),
                // Display seek bar/slider and current position/duration

                Slider(
                  value: _position.inSeconds.toDouble(),
                  inactiveColor: Colors.grey,
                  onChanged: _changeSeek,
                  autofocus: true,
                  activeColor: logocolo,
                  min: 0.0,
                  max: _duration.inSeconds.toDouble(),
                ),
                Text('${_position.inMinutes.remainder(60).toString().padLeft(
                    2, '0')}:${_position.inSeconds.remainder(60)
                    .toString()
                    .padLeft(2, '0')} / ${_duration.inMinutes.remainder(60)
                    .toString()
                    .padLeft(2, '0')}:${_duration.inSeconds.remainder(60)
                    .toString()
                    .padLeft(2, '0')}'),

              ],
            ),
          ),
        ),
      ),

    );
  }
}


// ui in chat
class VideoWithImagePlaceholder extends StatefulWidget {
  final String videoUrl;
  final no;

  VideoWithImagePlaceholder({
    required this.videoUrl, required this.no,});

  @override
  _VideoWithImagePlaceholderState createState() =>
      _VideoWithImagePlaceholderState();
}

class _VideoWithImagePlaceholderState extends State<VideoWithImagePlaceholder> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize().then((value) {
      _controller.pause();
      setState(() {});
      controllervideo.addListener(_videoListener);
    });
  }

  void _videoListener() {
    if (controllervideo.value.isPlaying) {
      controllervideo.pause();
    }
  }

  @override
  void dispose() {
    super.dispose();
    controllervideo.pause();
    controllervideo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.no == 1 ?
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 15),
                child: Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)),
                  width: 200, height: 150,
                  child: Stack(
                    children: [
                      ClipRRect(child: VideoPlayer(_controller),
                          borderRadius: BorderRadius.circular(15)),

                      GestureDetector(
                        onTap: () {
                          Get.to(Videospalyerinmessage(
                            videoslink: widget.videoUrl,));
                        },
                        child: Center(
                          child: Container(decoration: BoxDecoration(
                              shape: BoxShape.circle, color: logocolo),
                            height: 35,
                            width: 35,
                            child: Center(
                              child: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow, color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }
            else if (snapshot.hasError) {
              print("snapshot${snapshot.error}");
              return Text("");
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
            :
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.only(left: 200.0, bottom: 15),
                child: Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)),
                  width: 200, height: 150,
                  child: Stack(
                    children: [
                      ClipRRect(child: VideoPlayer(_controller),
                          borderRadius: BorderRadius.circular(15)),

                      GestureDetector(
                        onTap: () {
                          Get.to(Videospalyerinmessage(
                            videoslink: widget.videoUrl,));
                        },
                        child: Center(
                          child: Container(decoration: BoxDecoration(
                              shape: BoxShape.circle, color: logocolo),
                            height: 35,
                            width: 35,
                            child: Center(
                              child: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow, color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}


// paly videos in chat
class Videospalyerinmessage extends StatefulWidget {
  final videoslink;

  const Videospalyerinmessage({super.key, this.videoslink});

  @override
  State<Videospalyerinmessage> createState() => _VideospalyerinmessageState();
}

class _VideospalyerinmessageState extends State<Videospalyerinmessage> {
  late VideoPlayerController _controller1;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.network(widget.videoslink);
    _initializeVideoPlayerFuture = _controller1.initialize().then((value) {
      _controller1.play();

      setState(() {});
      controllervideo.addListener(_videoListener);
    });
  }

  void _videoListener() {
    if (controllervideo.value.isPlaying) {

    }
  }

  @override
  void dispose() {
    super.dispose();

    controllervideo.pause();
    controllervideo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery
        .of(context)
        .size
        .width;
    final h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)),
                width: w, height: h / 3,
                child: VideoPlayer(_controller1),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


// import '../../Controllers/text2.dart';
//
// class ChatScreen extends StatefulWidget {
//   // ChatModel model;
//   final userid;
//   final userimage;
//   final username;
//   ChatScreen({Key? key, this.userid, this.userimage, this.username}) : super(key: key);
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   Duration duration = const Duration();
//   Duration position = const Duration();
//   bool isPlaying = false;
//   bool isLoading = false;
//   bool isPause = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final w = MediaQuery.of(context).size.width;
//     final h = MediaQuery.of(context).size.height;
//     final now = DateTime.now();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 60,
//         foregroundColor: logocolo,
//         forceMaterialTransparency: true,
//         automaticallyImplyLeading: true,
//         backgroundColor: Colors.white,
//         title: Row(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(50),
//                   boxShadow: [
//                     const BoxShadow(color: logocolo, blurRadius: 0.5)
//                   ]),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(50),
//                 child: Image.asset(
//                   "assets/images/rashmika.jpg",
//                   height: 40,
//                   width: 40,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: w / 90,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: w / 3,
//                   child: Text(
//                     "Rashmika Mandana Shop Rashmika Mandana Shop Rashmika Mandana Shop",
//                     maxLines: 1,
//                     style: A_style_medium,
//                   ),
//                 ),
//                 Text(
//                   "11:27 PM",
//                   style: A_style_mid_black,
//                 ),
//               ],
//             ),
//             const Spacer(
//               flex: 5,
//             ),
//             Image.asset(
//               "assets/images/shops.png",
//               height: 25,
//               width: 25,
//               color: logocolo,
//             ),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 BubbleNormalAudio(
//                   color: logocolo,
//                   duration: duration.inSeconds.toDouble(),
//                   position: position.inSeconds.toDouble(),
//                   isPlaying: isPlaying,
//                   isLoading: isLoading,
//                   isPause: isPause,
//                   onSeekChanged: _changeSeek,
//                   onPlayPauseButtonClick: _playAudio,
//                   sent: true,
//                 ),
//                 BubbleNormal(
//                   text: 'Hey! How are You',
//                   textStyle: const TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                   isSender: true,
//                   color: logocolo,
//                   tail: true,
//                   sent: true,
//                 ),
//                 DateChip(
//                   date: DateTime(now.year, now.month, now.day - 2),
//                 ),
//                 BubbleNormal(
//                   text:
//                       'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',
//                   isSender: false,
//                   color: logocolo,
//                   tail: false,
//                   textStyle: const TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                 ),
//                 BubbleNormal(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   textStyle: const TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                   color: logocolo,
//                   tail: false,
//                   sent: true,
//                   seen: true,
//                   delivered: true,
//                 ),
//                 const BubbleSpecialOne(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   isSender: false,
//                   color: logocolo,
//                   textStyle: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                 ),
//                 DateChip(
//                   date: DateTime(now.year, now.month, now.day - 1),
//                 ),
//                 const BubbleSpecialOne(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   color: logocolo,
//                   seen: true,
//                   textStyle: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const BubbleSpecialOne(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   isSender: false,
//                   tail: false,
//                   color: logocolo,
//                   textStyle: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const BubbleSpecialOne(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   tail: false,
//                   color: logocolo,
//                   textStyle: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                   sent: true,
//                 ),
//                 const BubbleSpecialTwo(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   isSender: false,
//                   color: logocolo,
//                   textStyle: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                 ),
//                 DateChip(
//                   date: now,
//                 ),
//                 const BubbleSpecialTwo(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   isSender: true,
//                   color: logocolo,
//                   textStyle: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                   sent: true,
//                 ),
//                 const BubbleSpecialTwo(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   isSender: false,
//                   tail: false,
//                   color: logocolo,
//                   textStyle: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const BubbleSpecialTwo(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   textStyle: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                   tail: false,
//                   color: logocolo,
//                   delivered: true,
//                 ),
//                 const BubbleSpecialThree(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   color: logocolo,
//                   tail: false,
//                   textStyle: TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                   ),
//                 ),
//                 const BubbleSpecialThree(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   color: logocolo,
//                   tail: true,
//                   textStyle: TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                   ),
//                 ),
//                 const BubbleSpecialThree(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   textStyle: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                   color: logocolo,
//                   tail: false,
//                   isSender: false,
//                 ),
//                 const BubbleSpecialThree(
//                   text: 'Lorem Ipsum is simply dummy text of the printing',
//                   textStyle: TextStyle(
//                     fontSize: 10,
//                     color: Colors.white,
//                   ),
//                   color: logocolo,
//                   tail: true,
//                   isSender: false,
//                 ),
//                 const SizedBox(
//                   height: 100,
//                 )
//               ],
//             ),
//           ),
//           MessageBar(
//             // onSend: (){},
//             actions: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     child: const Icon(
//                       Icons.add,
//                       color: Colors.black,
//                       size: 24,
//                     ),
//                     onTap: () {},
//                   ),
//                   IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.mic,
//                         color: Colors.black,
//                       ))
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _image() {
//     return Container(
//         constraints: const BoxConstraints(
//           minHeight: 20.0,
//           minWidth: 20.0,
//         ),
//         child: Image.asset("assets/images/man.png"));
//   }
//
//   void _changeSeek(double value) {
//     setState(() {});
//   }
//
//   void _playAudio() async {
//     'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3';
//     if (isPause) {
//       setState(() {
//         isPlaying = true;
//         isPause = false;
//       });
//     } else if (isPlaying) {
//       setState(() {
//         isPlaying = false;
//         isPause = true;
//       });
//     } else {
//       setState(() {
//         isLoading = true;
//       });
//
//       setState(() {
//         isPlaying = true;
//       });
//     }
//   }
// }
