import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class AlbumsScreen extends StatefulWidget {
   const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // for getting the device size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'User List',
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return _homeController.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _homeController.userDataList.length,
                      itemBuilder: (context, index) {
                        final data = _homeController.userDataList[index];
                        return Card(
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            padding: const EdgeInsets.all(12),
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'User Name: ${data.username}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Name: ${data.name}'),
                                        Text('Email: ${data.email}'),
                                        Text(
                                          'Phone: ${data.phone}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('City: ${data.company}'),
                                        // Text('Company Name: ${data.company['name']}'),
                                        // Text('Website'),
                                      ],
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                            radius: 15,
                                            child: Text('${data.id}')),
                                        SizedBox(
                                          height: size.height * .08,
                                        ),
                                        InkWell(
                                          child: CircleAvatar(
                                            radius: 15,
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.deepOrange
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
            },
          )),
    );
  }
}
