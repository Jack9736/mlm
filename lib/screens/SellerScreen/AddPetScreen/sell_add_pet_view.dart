import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import '../../../Widget/widget_appbar.dart';
import '../SellSecRegScreen/sell_sec_reg_controller.dart';

class SellAddPetView extends StatefulWidget {
  const SellAddPetView({Key? key}) : super(key: key);

  @override
  State<SellAddPetView> createState() => _SellAddPetViewState();
}

class _SellAddPetViewState extends State<SellAddPetView> {
  final _formKey = GlobalKey<FormState>();
  late String userName, password, sessionName;
  int radioGroup = 1;
  var userType = '';

  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SellSecRegController controller = Get.find();

  var memberListObs = "".obs;

  @override
  void initState() {
    super.initState();
    memberListObs.value = controller.memberList[0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: "Add Pet",
          menuItem: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          bottom: true,
          child: Form(
            key: _formKey,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Name", style: buildHeaderTextStyle()),
                  Divider(),
                  Container(
                    height: 40,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF2F2F2),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(width: 1, color: Colors.red),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.orange),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(width: 1, color: Colors.green),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                width: 1, color: Colors.yellowAccent)),
                        hintText: "TYPE NAME HERE",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.txt_field_hint_color),
                      ),
                      onChanged: (value) {
                        // do something
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle buildRadioTextStyle() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        fontFamily: 'Gibson',
        color: AppColors.topHeaderBlueClr);
  }

  TextStyle buildHeaderTextStyle() {
    return const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'Gibson',
        color: AppColors.topHeaderBlueClr);
  }
}
