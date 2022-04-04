import 'package:event_task/api.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future myData;
  final ClientApi clientApi = ClientApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: FutureBuilder(
                future: clientApi.getData(), // Api here,,
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("there is no connection");

                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Container(
                          height: MediaQuery.of(context).size.height,
                          child: Center(child: CircularProgressIndicator()));

                    case ConnectionState.done:
                      if (snapshot.data != null) {
                        return Padding(
                          padding: EdgeInsets.all(
                            8.0,
                          ),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 300,
                                      mainAxisExtent: 270,
                                      crossAxisSpacing: 20,
                                      childAspectRatio: 0.70,
                                      mainAxisSpacing: 20),
                              itemCount: snapshot.data.data.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        imageUrl:
                                            snapshot.data.data[index].image,
                                      ),
                                      Container(
                                        color: Colors.grey.shade800,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 30,
                                              child: Text(
                                                snapshot.data.data[index].name,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Container(
                                              color: Colors.white,
                                              width: 100,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                DateFormat('MMM d ,  y').format(
                                                    snapshot
                                                        .data.data[index].date),
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      } else
                        return Text("No Data Loaded");
                  }
                }),
          ),
        ),
      ),
    );
  }
}
