import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:jurta/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class VideoRecordingScreen extends StatefulWidget {
  @override
  _VideoRecordingScreenState createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  final double _percentRecorded = 0.3;
  VideoLength _videoLength = VideoLength.medium;
  List<CameraDescription> _cameras;
  CameraController _cameraController;
  Future<void> _initializeControllerFuture;

  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _nameC = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read(hideBottomTabProvider).state = true;
    });

    initializeCameras();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _phoneC.dispose();
    _nameC.dispose();
    super.dispose();
  }

  Future<void> initializeCameras() async {
    /// thows CameraException
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras?.first, ResolutionPreset.max,
        enableAudio: false);
    _initializeControllerFuture = _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  void switchVideoLength(VideoLength newLength) {
    if (newLength != _videoLength)
      setState(() {
        _videoLength = newLength;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
            bottomNavigationBar: BottomAppBar(
              elevation: 0.0,
              color: Style.blue,
              shape: const CircularNotchedRectangle(),
              notchMargin: 8.0,
              child: Container(
                  height: 65.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      PressableTimeSelector(
                        text: '120 c',
                        onTap: () => switchVideoLength(VideoLength.long),
                        active: _videoLength == VideoLength.long,
                      ),
                      const SizedBox(width: 65),
                      PressableTimeSelector(
                        text: '80 c',
                        onTap: () => switchVideoLength(VideoLength.medium),
                        active: _videoLength == VideoLength.medium,
                      ),
                      const SizedBox(width: 65),
                      PressableTimeSelector(
                        text: '60 c',
                        onTap: () => switchVideoLength(VideoLength.short),
                        active: _videoLength == VideoLength.short,
                      ),
                    ],
                  )),
            ),
            body: SafeArea(
                child: Stack(
              children: <Widget>[
                /// camera view
                Positioned.fill(
                    child: CameraViewWidget(
                        initializeControllerFuture: _initializeControllerFuture,
                        cameraController: _cameraController)),

                /// progress bar
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 5,
                    child: LinearProgressIndicator(
                      value: _percentRecorded,
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(255, 0, 0, 0.5),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ),

                /// shoot buttons
                Positioned(
                    bottom: 15,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ClickableSideButton(
                            onTap: () => {},
                            imagePath: 'assets/images/stars.png',
                            bottomText: 'Эффекты'),
                        const SizedBox(width: 50),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromRGBO(255, 153, 41, 0.5),
                                  width: 7,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                color: Style.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 50),
                        ClickableSideButton(
                            onTap: () => showUploadConfirmNameDialog(
                                context, _nameC, _phoneC),
                            imagePath: 'assets/images/download.png',
                            bottomText: 'Загрузить'),
                      ],
                    )),
              ],
            ))));
  }
}

Future<void> showUploadConfirmNameDialog(BuildContext context,
    TextEditingController _nameC, TextEditingController _phoneC,
    {bool redirectRieltor = true}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (c) {
      return AlertDialog(
        content: Container(
          width: Global.getSize(c).width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              Row(children: [HeadersTextWidget(text: 'Имя')]),
              InputWidget(
                controller: _nameC,
                inputType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              Row(children: [HeadersTextWidget(text: 'Контакты')]),
              InputWidget(
                controller: _phoneC,
                hintText: '+7 (___) ___-__-__',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                ),
                textInputFormatters: PHONE_FORMATTER,
                inputType: TextInputType.phone,
                // hintText: '+7 (---) --- -- --',
                // hintStyle: TextStyle(
                //   color: Colors.grey.shade300,
                //   fontSize: 11,
                // ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                child: Container(
                  height: 46,
                  width: Global.getSize(context).width,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(c);
                      if (redirectRieltor)
                        await pushNewScreen(context,
                            screen: RieltorFrilancer3());
                      context.read(hideBottomTabProvider).state = true;
                    },
                    child: Text(
                      'СОХРАНИТЬ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Style.blue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        insetPadding: const EdgeInsets.all(16),
      );
    },
  );
}

class PressableTimeSelector extends StatelessWidget {
  const PressableTimeSelector({
    Key key,
    @required this.onTap,
    @required this.text,
    @required this.active,
  }) : super(key: key);

  final Function onTap;
  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Text(
            text,
            style: TextStyle(
              color: active ? Style.orange : Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              color: active ? Style.orange : Colors.transparent,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }
}

class ClickableSideButton extends StatelessWidget {
  const ClickableSideButton({
    Key key,
    @required this.onTap,
    @required this.imagePath,
    @required this.bottomText,
  }) : super(key: key);

  final void Function() onTap;
  final String imagePath;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(imagePath)),
          ),
          const SizedBox(height: 8),
          Text(
            bottomText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class CameraViewWidget extends StatelessWidget {
  const CameraViewWidget({
    Key key,
    @required Future<void> initializeControllerFuture,
    @required CameraController cameraController,
  })  : _initializeControllerFuture = initializeControllerFuture,
        _cameraController = cameraController,
        super(key: key);

  final Future<void> _initializeControllerFuture;
  final CameraController _cameraController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _cameraController.buildPreview();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
