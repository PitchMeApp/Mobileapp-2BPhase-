import 'package:flutter/material.dart';
import 'package:pitch_me_app/screens/businessIdeas/Apicall.dart/noti.dart';
import 'package:pitch_me_app/screens/businessIdeas/dashBoardScreen.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/sizeConfig/sizeConfig.dart';
import 'package:pitch_me_app/utils/widgets/containers/containers.dart';
import 'package:pitch_me_app/utils/widgets/text/text.dart';
import 'package:provider/provider.dart';

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  double boxHeight = 100;
  double boxWidth = 100;

  bool ChangeBotton = false;

  Color _ContainerColor = Color(0xff599CD0);
  Color _CoColor = Color(0xff599CD0);

  final _controller = PageController();
  String title = '';
  int currentIndexOfDashboard = 0;
  late Widget currentScreen;

  int selectIndex = 0;

  bool colorChnage = false;

  void _expandBox() {
    boxHeight = 300;
    boxWidth = 300;
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        selectIndex;
        _ContainerColor = Color.fromARGB(255, 225, 225, 225).withOpacity(0.3);
      });
      final postModel = Provider.of<DataClass>(context, listen: false);
      postModel.getPostData();
    });

    super.initState();
    currentScreen = DashBoardScreen(
      currentPage: (int index) {
        currentIndexOfDashboard = index;
        setState(() {});
      },
      onSwipe: (int index, String _title, bool isFinish) {
        print("index is $index and title is $title");
        title = _title;
        setState(() {});
      },
    );
    setState(() {});
  }

  bool _isInitialValue = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Material(
      child: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: Stack(
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      _isInitialValue == true;
                      _isInitialValue = false;
                    });
                  },
                  child: currentScreen),
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.getSize20(context: context) +
                        SizeConfig.getSize20(context: context),
                    bottom: SizeConfig.getSize20(context: context),
                    left: SizeConfig.getSize20(context: context),
                    right: SizeConfig.getSize20(context: context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    currentIndexOfDashboard == 0
                        ? AnimatedContainer(
                            height:
                                _isInitialValue ? sizeH * 0.5 : sizeH * 0.065,
                            width:
                                _isInitialValue ? sizeW * 0.65 : sizeW * 0.140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  _isInitialValue ? 20 : 10),
                              color: _isInitialValue
                                  ? Color(0xff377eb4).withOpacity(0.8)
                                  : Color(0xff377eb4),
                            ),
                            duration: Duration(milliseconds: 300),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isInitialValue = !_isInitialValue;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: _isInitialValue
                                    ? Consumer<DataClass>(builder:
                                        (BuildContext context, value,
                                            Widget? child) {
                                        return ListView.separated(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          itemCount: value.post!.result!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return value.loading
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      print(
                                                          "Click in notification");
                                                      setState(() {
                                                        _isInitialValue == true;
                                                        _isInitialValue = false;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: sizeH * 0.06,
                                                      width: sizeW * 0.65,
                                                      // color: Colors.red,
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(children: [
                                                          Icon(
                                                              Icons
                                                                  .notifications_active_outlined,
                                                              color: Color(
                                                                  0xff000a5e)),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left:
                                                                        sizeW *
                                                                            0.03,
                                                                    top: sizeH *
                                                                        0.01),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  height:
                                                                      sizeH *
                                                                          0.02,
                                                                  width: sizeW *
                                                                      0.45,
                                                                  // color: Color
                                                                  //     .fromARGB(
                                                                  //         255,
                                                                  //         39,
                                                                  //         221,
                                                                  //         23),
                                                                  child: Text(
                                                                    value
                                                                            .post
                                                                            ?.result?[index]
                                                                            .title
                                                                            .toString() ??
                                                                        "",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  value
                                                                          .post
                                                                          ?.result?[
                                                                              index]
                                                                          .title!
                                                                          .toString() ??
                                                                      "",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ]),
                                                      ),
                                                    ),
                                                  );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: sizeW * 0.02,
                                                  right: sizeW * 0.02),
                                              child: Divider(
                                                color: Color(0xff000a5e),
                                              ),
                                            );
                                          },
                                        );
                                      })
                                    : loadSvg(
                                        image:
                                            'assets/image/notifications.svg'),
                              ),
                            ),
                          )
                        : buttonContainer(
                            height: SizeConfig.getSize50(context: context),
                            width: SizeConfig.getSize50(context: context),
                            fromAppBar: true,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: loadSvg(
                                  image: 'assets/image/notifications.svg'),
                            )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: roboto(
                          size: SizeConfig.getFontSize28(context: context),
                          text:
                              '${currentIndexOfDashboard == 0 ? '' : "App Statistics"}',
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Column(
                      children: [
                        currentIndexOfDashboard == 0
                            ? AppBarIconContainer(
                                height: SizeConfig.getSize50(context: context),
                                width: SizeConfig.getSize50(context: context),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child:
                                      loadSvg(image: 'assets/image/menu.svg'),
                                ))
                            : buttonContainer(
                                height: SizeConfig.getSize50(context: context),
                                width: SizeConfig.getSize50(context: context),
                                fromAppBar: true,
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child:
                                      loadSvg(image: 'assets/image/menu.svg'),
                                )),
                        spaceHeight(10),
                        if (currentIndexOfDashboard == 0)
                          Align(
                              alignment: Alignment.bottomRight,
                              child: AppBarIconContainer(
                                height: SizeConfig.getSize50(context: context),
                                width: SizeConfig.getSize50(context: context),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: loadSvg(
                                    image: 'assets/image/setting.svg',
                                  ),
                                ),
                              )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
