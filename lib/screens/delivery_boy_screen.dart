import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:utem_foodie_admin/services/firebase_services.dart';
import 'package:utem_foodie_admin/services/sidebar.dart';
import 'package:utem_foodie_admin/widgets/delivery_boy/approved_boys.dart';
import 'package:utem_foodie_admin/widgets/delivery_boy/new_boys.dart';

class DeliveryBoyScreen extends StatefulWidget {
  static const String id = "delivery-boy-screen";
  DeliveryBoyScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryBoyScreen> createState() => _DeliveryBoyScreenState();
}

class _DeliveryBoyScreenState extends State<DeliveryBoyScreen> {
  final SideBarWidget _sideBar = SideBarWidget();
  bool _visible = false;
  var _emailTextController = TextEditingController();
  var _passwordTextController = TextEditingController();
  FirebaseServices _firebaseServices = FirebaseServices();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AdminScaffold(
        backgroundColor: Color(0xFF212332),
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text('Delivery Boy',style: TextStyle(color: Colors.white,),),
        ),
        sideBar: _sideBar.SideBarMenus(context, DeliveryBoyScreen.id),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Delivery Boys',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 36,
                    ),
                  ),
                  Text('Create new Delivery Boys and Manage all Delivery Boys',style: TextStyle(color: Colors.white),),
                  Divider(thickness: 5),
                  Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Row(
                      children: [
                        Visibility(
                          visible: _visible ? false : true,
                          child: Container(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _visible = true;
                                });
                              },
                              child: Text(
                                'Create New Delivery Boys',
                                style: TextStyle(color: Colors.white,),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _visible,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 30,
                                    child: TextField(
                                      controller: _emailTextController,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "Email ID",
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    height: 30,
                                    child: TextField(
                                      controller: _passwordTextController,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: "Password",
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (_emailTextController.text.isEmpty) {
                                        return _firebaseServices.showMyDialog(
                                            context: context,
                                            message: 'Email Id not entered',
                                            tittle: 'Email Id');
                                      }
                                      if (_passwordTextController
                                          .text.isEmpty) {
                                        return _firebaseServices.showMyDialog(
                                            context: context,
                                            message: 'Password not entered',
                                            tittle: 'Password');
                                      }
                                      _firebaseServices
                                          .saveDeliveryBoys(
                                              _emailTextController.text.toLowerCase(),
                                              _passwordTextController.text)
                                          .whenComplete(() {
                                        _emailTextController.clear();
                                        _passwordTextController.clear();
                                        _firebaseServices.showMyDialog(
                                            context: context,
                                            message: 'Saved Successfully',
                                            tittle: 'Save Delivery Boys');
                                      });
                                    },
                                    child: Text(
                                      'Save ',
                                      style: TextStyle(color: Colors.white),
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
                  Divider(thickness: 5),
                  TabBar(
                      indicatorColor: Theme.of(context).primaryColor,
                      unselectedLabelColor: Colors.white,
                      labelColor: Theme.of(context).primaryColor,
                      tabs: [
                        Tab(text: 'NEW'),
                        Tab(text: 'APPROVED'),
                      ]),
                  Expanded(
                      child: Container(
                    child: TabBarView(
                      children: [
                        NewBoys(),
                        ApprovedBoys(),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
