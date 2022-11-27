import 'package:feynman1/constant/color.dart';
import 'package:feynman1/screens/home/data.dart';
import 'package:feynman1/screens/home/functions.dart';
import 'package:feynman1/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

var counter = 0;
var String = "";
var String1 =
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
var String2 =
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

class StickyHeader extends StatefulWidget {
  StickyHeader({Key? key}) : super(key: key);

  @override
  State<StickyHeader> createState() => _StickyHeaderState();
}

class _StickyHeaderState extends State<StickyHeader> {
  final TextEditingController emailController = new TextEditingController();
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  @override

/*class StickyHeader extends StatelessWidget {
  
  const StickyHeader({
    Key? key,
  }) : super(key: key);*/

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      /* decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          image: AssetImage("assets/abc.png"),
          fit: BoxFit.cover,
        ),
      ),*/
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image5.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
          ),
          Text(
            "SIR VISVESVARAYA ANSWERS".toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 247, 244, 244),
                fontSize: 40,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 700,
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              autofocus: false,
              controller: emailController,
              style: TextStyle(
                  color: Color.fromARGB(255, 10, 10, 10), fontSize: 14),
              // controller: emailEditingController,
              decoration: InputDecoration(
                filled: true, //<-- SEE HERE
                fillColor: Color.fromARGB(255, 249, 248, 250), //<-- SEE HERE

                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: EdgeInsets.fromLTRB(30, 5, 10, 5),
                labelText: "Enter your Query",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 11, 10, 10), fontSize: 14),
              ),
              onSaved: (value) {
                emailController.text = value!;
              },
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MSHCheckbox(
                    size: 20,
                    value: isChecked,
                    checkedColor: Colors.blue,
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) {
                      setState(() {
                        isChecked = selected;
                      });
                    },
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Text',
                    style: TextStyle(
                      color: Color.fromARGB(255, 254, 254, 254),
                    ),
                  ),
                ]),
            SizedBox(
              width: 20,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MSHCheckbox(
                    size: 20,
                    value: isChecked1,
                    checkedColor: Colors.blue,
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) {
                      setState(() {
                        isChecked1 = selected;
                      });
                    },
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Images',
                    style: TextStyle(
                      color: Color.fromARGB(255, 254, 254, 254),
                    ),
                  ),
                ]),
            SizedBox(
              width: 20,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MSHCheckbox(
                    size: 20,
                    value: isChecked2,
                    checkedColor: Colors.blue,
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) {
                      setState(() {
                        isChecked2 = selected;
                      });
                    },
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Videos',
                    style: TextStyle(
                      color: Color.fromARGB(255, 254, 254, 254),
                    ),
                  ),
                ]),
          ])),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  height: 48,
                  minWidth: 150,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(
                          color: Color.fromARGB(255, 237, 243, 242))),
                  onPressed: () {
                    if (counter == 4) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => login_page()));
                    } else {
                      if (isChecked == true) {
                        String = emailController.text;
                        scrollControl(globalKeys[3]);
                      }
                      if (isChecked1 == true) {
                        String1 = emailController.text;
                        scrollControl(globalKeys[4]);
                      }
                      if (isChecked2 == true) {
                        String2 = emailController.text;
                        //videoMobilePage();
                        scrollControl(globalKeys[5]);
                      }
                      counter++;
                    }
                  },
                  color: Color.fromARGB(255, 252, 250, 250),
                  textColor: Color.fromARGB(255, 11, 11, 11),
                  child: Text("Search".toUpperCase(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}

class text_WebPage extends StatelessWidget {
  const text_WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 50),
          width: MediaQuery.of(context).size.width,
          color: defaultWhite,
          child: Center(
              child: Text(
            "Text",
            style: TextStyle(
                color: defaultBlack, fontSize: 28, fontWeight: FontWeight.bold),
          )),
        ),
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 50),
          width: MediaQuery.of(context).size.width,
          color: defaultWhite,
          child: Center(
              child: Text(
            String,
            style: TextStyle(color: defaultBlack, fontSize: 15),
          )),
        ),
      ],
    );
  }
}

class text_MobilePage extends StatelessWidget {
  const text_MobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 50),
          width: MediaQuery.of(context).size.width,
          color: defaultWhite,
          child: Center(
              child: Text(
            "Text",
            style: TextStyle(
                color: defaultBlack, fontSize: 28, fontWeight: FontWeight.bold),
          )),
        ),
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 50),
          width: MediaQuery.of(context).size.width,
          color: defaultWhite,
          child: Center(
              child: Text(
            String,
            style: TextStyle(color: defaultBlack, fontSize: 15),
          )),
        ),
      ],
    );
  }
}

class videoWebPage extends StatefulWidget {
  videoWebPage({Key? key}) : super(key: key);

  @override
  State<videoWebPage> createState() => _videoWebPageState();
}

class _videoWebPageState extends State<videoWebPage> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() async {
    videoPlayerController = VideoPlayerController.asset(String2);
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: () => debugPrint('Option 1 pressed!'),
            iconData: Icons.chat,
            title: 'Option 1',
          ),
          OptionItem(
            onTap: () => debugPrint('Option 2 pressed!'),
            iconData: Icons.share,
            title: 'Option 2',
          ),
        ];
      },
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chewie Video Player"),
      ),
      body: chewieController != null
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Chewie(
                controller: chewieController!,
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}*/

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            child: Text(
          "Video",
          style: TextStyle(
              color: defaultBlack, fontSize: 28, fontWeight: FontWeight.bold),
        )),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 50),
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(197, 6, 6, 6),
          child: Center(
            child: Chewie(
              controller: chewieController!,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class videoMobilePage extends StatefulWidget {
  videoMobilePage({Key? key}) : super(key: key);

  @override
  State<videoMobilePage> createState() => _videoMobilePageState();
}

class _videoMobilePageState extends State<videoMobilePage> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() async {
    videoPlayerController = VideoPlayerController.network(String2);
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: () => debugPrint('Option 1 pressed!'),
            iconData: Icons.chat,
            title: 'Option 1',
          ),
          OptionItem(
            onTap: () => debugPrint('Option 2 pressed!'),
            iconData: Icons.share,
            title: 'Option 2',
          ),
        ];
      },
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            child: Text(
          "Video",
          style: TextStyle(
              color: defaultBlack, fontSize: 28, fontWeight: FontWeight.bold),
        )),
        SizedBox(height: 1),
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 50),
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(197, 6, 6, 6),
          child: Center(
            child: Chewie(
              controller: chewieController!,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class image_video_MobilePage extends StatefulWidget {
  @override
  _image_video_MobilePageState createState() => _image_video_MobilePageState();
}

class _image_video_MobilePageState extends State<image_video_MobilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 36),
            width: MediaQuery.of(context).size.width,
            color: defaultWhite,
            child: Center(
                child: Text(
              "Image",
              style: TextStyle(
                  color: defaultBlack,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: defaultWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 300,
                    width: 300,
                    image: NetworkImage(
                        'https://media.istockphoto.com/videos/industrial-engineer-using-digital-tablet-for-work-against-the-site-video-id1338296260?s=640x640')),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: defaultWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 300,
                    width: 300,
                    image: NetworkImage(
                        'https://media.istockphoto.com/videos/industrial-engineer-using-digital-tablet-for-work-against-the-site-video-id1338296260?s=640x640'))
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: defaultWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 300,
                    width: 300,
                    image: NetworkImage(
                        'https://media.istockphoto.com/videos/industrial-engineer-using-digital-tablet-for-work-against-the-site-video-id1338296260?s=640x640'))
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(height: 32),
          /*Container(
            child: androidView(projectShowCase),
          )*/
        ],
      ),
    );
  }
}

class image_video_WebPage extends StatefulWidget {
  @override
  _image_video_WebPageState createState() => _image_video_WebPageState();
}

class _image_video_WebPageState extends State<image_video_WebPage> {
  // var projectShowCase = ExprienceCatogory.andriod;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 36),
          width: MediaQuery.of(context).size.width,
          color: defaultWhite,
          child: Center(
              child: Text(
            "Image",
            style: TextStyle(
                color: defaultBlack, fontSize: 28, fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5),
        Container(
          color: defaultWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: 300,
                  width: 300,
                  image: NetworkImage(
                      'https://media.istockphoto.com/videos/industrial-engineer-using-digital-tablet-for-work-against-the-site-video-id1338296260?s=640x640')),
              SizedBox(width: 20),
              Image(
                  height: 300,
                  width: 300,
                  image: NetworkImage(
                      'https://media.istockphoto.com/videos/industrial-engineer-using-digital-tablet-for-work-against-the-site-video-id1338296260?s=640x640')),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          color: defaultWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: 300,
                  width: 300,
                  image: NetworkImage(
                      'https://media.istockphoto.com/videos/industrial-engineer-using-digital-tablet-for-work-against-the-site-video-id1338296260?s=640x640')),
              SizedBox(width: 20),
              /* Image(
                  height: 300,
                  width: 300,
                  image: NetworkImage(
                      'https://media.istockphoto.com/videos/industrial-engineer-using-digital-tablet-for-work-against-the-site-video-id1338296260?s=640x640')),*/
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          color: defaultWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
        SizedBox(height: 10),
        /*Container(
          child: webView(projectShowCase),
        )*/
      ],
    );
  }
}
