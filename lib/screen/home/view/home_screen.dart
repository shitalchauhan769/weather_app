import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sky_app/component/view/network_screen.dart';
import 'package:sky_app/screen/home/model/home_model.dart';
import 'package:sky_app/screen/home/provider/home_provider.dart';

import '../../../component/provider/network_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerW;
  HomeProvider? providerR;
  ScrollController scrollController = ScrollController();
  TextEditingController searchText = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    context.read<HomeProvider>().getWeatherAPI("surat");
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: const Text("WeatherApp"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.center,
              colors: [
                Color(0xff9572da),
                Color(0xffd3a0eb),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDilogBoxe();
                // showBookMark();
              },
              icon: const Icon(Icons.bookmark),),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Light"),
                onTap: () {
                  providerR!.setTheme("Light");
                },
              ),
              PopupMenuItem(
                child: const Text("Dark"),
                onTap: () {
                  providerR!.setTheme("Dark");
                },
              ),
              PopupMenuItem(
                child: const Text("System"),
                onTap: () {
                  providerR!.setTheme("System");
                },
              ),
            ],
          ),
        ],
      ),
      body: context.watch<NetworkProvider>().isInternet
          ? Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff9572da),
                        Color(0xffd3a0eb),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: context.watch<HomeProvider>().model,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      HomeModel? model = snapshot.data;

                      if (model == null) {
                        return const Center(child: Text("not available"));
                      } else {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SearchBar(
                                  hintText: "Search city",
                                  controller: searchText,
                                  elevation: const MaterialStatePropertyAll(1),
                                  onSubmitted: (value) {
                                    providerW!.city = searchText.text;
                                    providerR!.getWeatherAPI(providerW!.city);
                                  },
                                  trailing: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        providerW!.city = searchText.text;
                                        providerR!
                                            .getWeatherAPI(providerW!.city);
                                        showSnackBar(context);
                                      },
                                      icon: const Icon(Icons.search),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, 'detail');
                                          },
                                          child: Text(
                                            '${model.name}',
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          "${providerW!.time.day}-${providerW!.time.month}-${providerW!.time.year}",
                                          style: const TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        Container(
                                          height: 300,
                                          width: 350,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.center,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xff9572da),
                                                    Color(0xffd3a0eb),
                                                  ]),
                                              border: Border.all(
                                                  color: const Color(0xff9572da),
                                                  strokeAlign: BorderSide
                                                      .strokeAlignInside,
                                                  style: BorderStyle.solid)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${model.mainModel!.temp!.toInt()}°C',
                                                  style: const TextStyle(
                                                      fontSize: 65,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Image(
                                                        image: AssetImage(
                                                            "assets/image/img1.png"),
                                                        height: 100,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      "Mostly Clear",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 500,
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "ToDay",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              'detail');
                                                        },
                                                        child: const Text(
                                                          "Weekly",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: 140,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    begin: Alignment
                                                                        .center,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xff9572da),
                                                                      Color(
                                                                          0xffd3a0eb),
                                                                    ],
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                          child: const Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Now",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Icon(Icons.cloud,
                                                                  color: Colors
                                                                      .white),
                                                              Text(
                                                                "18°",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: 140,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    begin: Alignment
                                                                        .center,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xff9572da),
                                                                      Color(
                                                                          0xffd3a0eb),
                                                                    ],
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                          child: const Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "11:00 ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Icon(Icons.sunny,
                                                                  color: Colors
                                                                      .orangeAccent),
                                                              Text(
                                                                "17°",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: 140,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    begin: Alignment
                                                                        .center,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xff9572da),
                                                                      Color(
                                                                          0xffd3a0eb),
                                                                    ],
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                          child: const Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "12:00",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Icon(Icons.sunny,
                                                                  color: Colors
                                                                      .orangeAccent),
                                                              Text(
                                                                "18°",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: 140,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    begin: Alignment
                                                                        .center,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xff9572da),
                                                                      Color(
                                                                          0xffd3a0eb),
                                                                    ],
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                          child: const Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "01:00 ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Icon(Icons.cloud,
                                                                  color: Colors
                                                                      .white),
                                                              Text(
                                                                "15°",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: 140,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    begin: Alignment
                                                                        .center,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xff9572da),
                                                                      Color(
                                                                          0xffd3a0eb),
                                                                    ],
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                          child: const Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "01:00 ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Icon(Icons.cloud,
                                                                  color: Colors
                                                                      .white),
                                                              Text(
                                                                "15°",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: 140,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    begin: Alignment
                                                                        .center,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xff9572da),
                                                                      Color(
                                                                          0xffd3a0eb),
                                                                    ],
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                          child: const Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "02:00 ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Icon(Icons.cloud,
                                                                  color: Colors
                                                                      .white),
                                                              Text(
                                                                "19°",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: 140,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    begin: Alignment
                                                                        .center,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                          0xff9572da),
                                                                      Color(
                                                                          0xffd3a0eb),
                                                                    ],
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                          child: const Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "02:00 ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Icon(Icons.cloud,
                                                                  color: Colors
                                                                      .white),
                                                              Text(
                                                                "19°",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    gradient: const LinearGradient(
                                                        begin: Alignment.center,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color(0xff9572da),
                                                          Color(0xffd3a0eb),
                                                        ]),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          const Text(
                                                            "Speed ",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          const Icon(Icons.air),
                                                          Text(
                                                            "${model.wideModel!.speed} ",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          const Text(
                                                            " Deg",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          const Icon(
                                                            Icons.cloud,
                                                            color: Colors.white,
                                                          ),
                                                          Text(
                                                            "${model.wideModel!.deg} ",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          const Text(
                                                            "Visibility",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .device_thermostat_sharp,
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                          Text(
                                                            "${model.visibility} ",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    gradient: const LinearGradient(
                                                        begin: Alignment.center,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          Color(0xff9572da),
                                                          Color(0xffd3a0eb),
                                                        ]),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          const Text(
                                                            "Temp",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .thermostat_auto,
                                                            color: Colors.white,
                                                          ),
                                                          Text(
                                                            "${model.mainModel!.temp} ",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          const Text(
                                                            "Min Temp.",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          const Icon(
                                                            Icons.thermostat,
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                          Text(
                                                            "${model.mainModel!.temp_min} ",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          const Text(
                                                            "Max Temp.",
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .device_thermostat_sharp,
                                                            color: Colors.white,
                                                          ),
                                                          Text(
                                                            "${model.mainModel!.temp_max} ",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        18),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                    }

                    return const Center(child: CircularProgressIndicator(),);
                  },
                ),
              ],
            )
          : const NetworkScreen(),
    );
  }

  void showDilogBoxe() {
    scaffoldkey.currentState!.showBottomSheet(
      (context) => BottomSheet(
        onClosing: () {},
        builder: (context) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("hello"),
              );
            },
          );
        },
      ),
    );
  }
  void showSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('not avalabel data',style: TextStyle(fontSize: 20,color: Colors.white),),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
