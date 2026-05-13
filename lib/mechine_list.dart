import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';
import 'controller/controller.dart';
import 'details.dart';

class MachineListScreen extends StatefulWidget {
  const MachineListScreen({super.key});

  @override
  State<MachineListScreen> createState() => _MachineListScreenState();
}

class _MachineListScreenState extends State<MachineListScreen> {
  final List<Map<String, dynamic>> machineList = [];
  final Controller controller = Get.put(Controller());
  // final List<Map<String, dynamic>> machineList = [
  //
  //   {
  //     "machine_no": 1,
  //     "machine_name": "Ring Frame",
  //     "image": "assets/bg_remove.png",
  //     "machine_status": "RUNNING",
  //     "datas": {
  //       "good": 12,
  //       "empty": 1,
  //       "defect": 0,
  //       "inspect": 12,
  //       "full_cops": 10,
  //       "half_cops": 1,
  //       "quarter_cops": 0,
  //       "doff_number": 20,
  //     },
  //   },
  //
  //   {
  //     "machine_no": 2,
  //     "machine_name": "Machine 2",
  //     "image": "assets/bg_remove.png",
  //     "machine_status": "STOPPED",
  //     "datas": {
  //       "good": 8,
  //       "empty": 0,
  //       "defect": 2,
  //       "inspect": 8,
  //       "full_cops": 6,
  //       "half_cops": 2,
  //       "quarter_cops": 1,
  //       "doff_number": 15,
  //     },
  //   },
  //
  //   {
  //     "machine_no": 3,
  //     "machine_name": "Auto Cone",
  //     "image": "assets/bg_remove.png",
  //     "machine_status": "RUNNING",
  //     "datas": {
  //       "good": 16,
  //       "empty": 0,
  //       "defect": 1,
  //       "inspect": 15,
  //       "full_cops": 14,
  //       "half_cops": 0,
  //       "quarter_cops": 0,
  //       "doff_number": 30,
  //     },
  //   },
  //
  //   {
  //     "machine_no": 4,
  //     "machine_name": "Carding",
  //     "image": "assets/bg_remove.png",
  //     "machine_status": "STOPPED",
  //     "datas": {
  //       "good": 5,
  //       "empty": 3,
  //       "defect": 1,
  //       "inspect": 6,
  //       "full_cops": 4,
  //       "half_cops": 2,
  //       "quarter_cops": 1,
  //       "doff_number": 10,
  //     },
  //   },
  // ];

  List<Map<String, dynamic>> filteredMachines = [];

  @override
  void initState() {
    super.initState();

    filteredMachines = machineList;
  }

  void searchMachine(String value) {
    setState(() {
      filteredMachines = machineList.where((machine) {
        final machineName = machine["machine_name"].toString().toLowerCase();

        final machineNo = machine["machine_no"].toString().toLowerCase();

        return machineName.contains(value.toLowerCase()) ||
            machineNo.contains(value.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FC),

      body: Column(
        children: [
          /// HEADER
          Container(
            width: 100.w,

            padding: EdgeInsets.only(
              top: 7.h,
              left: 5.w,
              right: 5.w,
              bottom: 3.h,
            ),

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff4A43EC), Color(0xff6A5CFF)],
              ),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Live Doff Machines",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 1.h),

                Text(
                  "Select Machine",
                  style: TextStyle(color: Colors.white70, fontSize: 15.sp),
                ),

                SizedBox(height: 2.h),

                Container(
                  height: 5.h,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: TextField(
                    onChanged: searchMachine,

                    style: TextStyle(fontSize: 18.sp),

                    decoration: InputDecoration(
                      border: InputBorder.none,

                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.indigo,
                      ),

                      hintText: "Search Machine...",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// MACHINE LIST
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.machineList.isEmpty) {
                return Center(
                  child: Text(
                    "No Machine Found",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  await controller.getMachines();
                },
                child: ListView.builder(
                  padding: EdgeInsets.all(4.w),

                  itemCount: controller.machineList.length,

                  itemBuilder: (context, index) {
                    final machine = controller.machineList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                MachineDetailsScreen(machineData: machine),
                          ),
                        );
                      },

                      child: Container(
                        margin: EdgeInsets.only(bottom: 2.h),

                        padding: EdgeInsets.all(4.w),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(20),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.15),

                              blurRadius: 10,

                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),

                        child: Row(
                          children: [
                            Container(
                              height: 12.h,
                              width: 25.w,

                              decoration: BoxDecoration(
                                color: Colors.indigo.withOpacity(.08),

                                borderRadius: BorderRadius.circular(18),
                              ),

                              child: Image.asset(
                                machine.image ?? "",
                                fit: BoxFit.fill,
                              ),
                            ),

                            SizedBox(width: 4.w),

                            Expanded(
                              flex: 2,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    machine.machineName ?? "",

                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: .8.h),

                                  Text(
                                    "Machine No : ${machine.machineNo}",

                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  SizedBox(height: 1.h),

                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 3.w,
                                      vertical: .7.h,
                                    ),

                                    decoration: BoxDecoration(
                                      color: machine.machineStatus == "RUNNING"
                                          ? Colors.green
                                          : Colors.red,

                                      borderRadius: BorderRadius.circular(30),
                                    ),

                                    child: Text(
                                      machine.machineStatus ?? "",

                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
