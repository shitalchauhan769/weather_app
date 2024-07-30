import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/model/home_model.dart';
import '../../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
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
      ),
      body: Stack(
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
          SingleChildScrollView(
            child: FutureBuilder(
              future: context.watch<HomeProvider>().model,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  HomeModel? model = snapshot.data;
                  if (model == null) {
                    const Text("Not Available");
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${model.name}",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                            Text('${model.mainModel!.temp!.toInt()}°C', style: const TextStyle(
                                fontSize: 30,
                                fontWeight:
                                FontWeight.bold),),
                            Text("country:${model.sysModel!.country}",style: const TextStyle(fontSize: 20,),),
                            Text("timezone:${model.timezone}",style: const TextStyle(fontSize: 20,),),
                            Text(
                              'deg:${model.wideModel!.deg}°',

                              style: const TextStyle(
                                  fontSize: 20,
                                  ),
                            ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${model.coordModel!.lat}°N",style: TextStyle(fontSize: 20,),),
                                SizedBox(width: 50,),
                                Text("${model.coordModel!.lon}°E",style: TextStyle(fontSize: 20,),),
                              ],
                            ),
                            const Align(alignment: Alignment.center,
                                child: Image(image: AssetImage("assets/image/img1.png"),height: 150,width: 150,),),
                            const SizedBox(height: 30,),
                            const Text("Lightly Cloudy",style: TextStyle(fontSize: 30,),),
                            const SizedBox(height: 20,),
                            SingleChildScrollView(
                              child: Container(
                                height:750,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  color:
                                  Colors.white.withOpacity(0.2),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
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
                                                        30),),
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
                                                child: Column(
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
                                                child: Column(
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
                                                child: Column(
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
                                      const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Monday',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            '☀️',
                                            style:
                                            TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '20°/33°',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Tuesday',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            '🌨️',
                                            style:
                                            TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '26°/32°',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Washday',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            '🌨️',
                                            style:
                                            TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '28°/34°',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Tuesday',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            '🌨️',
                                            style:
                                            TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '28°/35°',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Friday',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            '🌤️',
                                            style:
                                            TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '25°/30°',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Saturday',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            '🌤️',
                                            style:
                                            TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '25°/32°',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Sunday',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            '🌤️',
                                            style:
                                            TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '25°/32°',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ],
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
                                              colors: [
                                                Color(0xff9572da),
                                                Color(0xffd3a0eb),
                                              ]),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                      const SizedBox(height: 20,),
                                      Container(
                                        padding:
                                        const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xff9572da),
                                                  Color(0xffd3a0eb),
                                                ]
                                            )
                                        ),
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [ const Text("humidity",style: TextStyle(fontSize: 18),),
                                                const Text("💧",style: TextStyle(fontSize: 18),),
                                                Text("${model.mainModel!.humidity}",style: const TextStyle(fontSize: 20,),),

                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text("wind speed",style: TextStyle(fontSize: 18),),
                                                const Text(" 🌬️ ",style: TextStyle(fontSize: 18),),
                                                Text("${model.wideModel!.speed}",style: const TextStyle(fontSize: 18),),

                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text("temp",style: TextStyle(fontSize: 18),),
                                                const Text("🌡️",style: TextStyle(fontSize: 18),),
                                                Text("${model.mainModel!.temp}",style: const TextStyle(fontSize: 20),),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
