import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var txtController = TextEditingController();

  late YoutubeMetaData _videoMetaData;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'KTksi_VXGCk',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'KTksi_VXGCk',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
  }

  void refreshPlayer(url) {
    _controller.load(YoutubePlayer.convertUrlToId(url).toString());
    txtController.clear();
  }

  void listener() {
    setState(() {
      _videoMetaData = _controller.metadata;
    });
  }

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;

    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Theme.of(context).colorScheme.primary,
          progressColors: ProgressBarColors(
            playedColor: Theme.of(context).colorScheme.primary,
            handleColor: Theme.of(context).colorScheme.primary,
          ),
          onReady: () {
            _controller.addListener(listener);
          },
        ),
        builder: (context, player) {
          return ListView(
            children: [
              // some widgets
              player,
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: SizedBox(
                  width: contextWidth,
                  child: Text(
                    _videoMetaData.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _videoMetaData.author,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.download,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                    MaterialButton(
                      color: Theme.of(context).colorScheme.primary,
                      child: const Text(
                        'Suscribirse',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: txtController,
                  style: const TextStyle(),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        setState(() {
                          if (txtController.text.isNotEmpty) {
                            refreshPlayer(txtController.text);
                          }
                        });
                      },
                    ),
                    hintText: 'www.youtube.com/watch?v=XXXXXXXXX',
                    hintStyle: const TextStyle(),
                    labelText: 'Youtube URL',
                    labelStyle: const TextStyle(),
                    filled: true,
                  ), //OJO QUE ESTO
                  onSubmitted: (text) {
                    setState(() {
                      if (text.isNotEmpty) {
                        refreshPlayer(text);
                      }
                    });
                  },
                ),
              ),
            ],
          );
        });
  }
}
