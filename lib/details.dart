import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'model/machine_list.dart';

class MachineDetailsScreen extends StatelessWidget {
  final Data machineData;

  const MachineDetailsScreen({super.key, required this.machineData});

  Widget statCard({
    required String title,
    required dynamic value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(3.w),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(3.w),

            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(icon, color: color, size: 15.sp),
          ),

          const Spacer(),

          Text(
            value.toString(),

            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: .6.h),

          Text(
            title,

            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final data = machineData.datas;

    return Scaffold(

      backgroundColor: const Color(0xffF4F7FE),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            children: [

              Container(

                width: 100.w,

                padding: EdgeInsets.only(
                  left: 5.w,
                  right: 5.w,
                  top: 2.h,
                  bottom: 4.h,
                ),

                decoration: const BoxDecoration(

                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [
                      Color(0xff4F46E5),
                      Color(0xff7C3AED)
                    ],
                  ),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),

                child: Column(

                  children: [

                    Row(

                      children: [

                        GestureDetector(

                          onTap: () {
                            Navigator.pop(context);
                          },

                          child: Container(

                            padding: EdgeInsets.all(2.8.w),

                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.15),

                              borderRadius:
                              BorderRadius.circular(15),
                            ),

                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ),
                        ),

                        SizedBox(width: 4.w),

                        Text(
                          "Machine Details",

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 3.h),

                    Container(

                      width: 100.w,

                      padding: EdgeInsets.all(2.w),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(28),
                      ),

                      child: Row(

                        children: [

                          Container(

                            height: 10.h,
                            width: 25.w,

                            padding: EdgeInsets.all(3.w),

                            decoration: BoxDecoration(

                              color: Colors.indigo
                                  .withOpacity(.08),

                              borderRadius:
                              BorderRadius.circular(20),
                            ),

                            child: Image.asset(
                              machineData.image ?? "",
                              fit: BoxFit.contain,
                            ),
                          ),

                          SizedBox(width: 5.w),

                          Column(

                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(
                                machineData.machineName ?? "",

                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight:
                                  FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),

                              SizedBox(height: .7.h),

                              Text(
                                "Machine No : ${machineData.machineNo}",

                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          const Spacer(),

                          Container(

                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 1.h,
                            ),

                            decoration: BoxDecoration(

                              color:
                              machineData.machineStatus ==
                                  "RUNNING"

                                  ? Colors.green
                                  : Colors.red,

                              borderRadius:
                              BorderRadius.circular(30),
                            ),

                            child: Row(

                              mainAxisSize: MainAxisSize.min,

                              children: [

                                Container(
                                  height: 1.h,
                                  width: 1.h,

                                  decoration:
                                  const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),

                                SizedBox(width: 2.w),

                                Text(

                                  machineData.machineStatus ?? "",

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2.h),

              Padding(

                padding:
                EdgeInsets.symmetric(horizontal: 2.w),

                child: Row(

                  children: [

                    Expanded(

                      child: overviewCard(

                        title: "Doff No",

                        value:
                        data?.doffNumber ?? 0,

                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 3.h),

              Padding(

                padding:
                EdgeInsets.symmetric(horizontal: 5.w),

                child: Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      "Production Report",

                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Live Update",

                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2.h),

              GridView(

                padding:
                EdgeInsets.symmetric(horizontal: 2.w),

                shrinkWrap: true,

                physics:
                const NeverScrollableScrollPhysics(),

                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 4,
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 0.6,
                ),

                children: [

                  statCard(
                    title: "Inspect",
                    value: data?.inspect ?? 0,
                    icon: Icons.inventory_2,
                    color: Colors.green,
                  ),

                  statCard(
                    title: "Good",
                    value: data?.good ?? 0,
                    icon:
                    Icons.signal_wifi_statusbar_4_bar,
                    color: Colors.red,
                  ),

                  statCard(
                    title: "Defect",
                    value: data?.defect ?? 0,
                    icon: Icons.description,
                    color: Colors.amberAccent,
                  ),

                  statCard(
                    title: "Empty",
                    value: data?.empty ?? 0,
                    icon: Icons.hourglass_empty,
                    color: Colors.lightBlue,
                  ),

                  statCard(
                    title: "Full Cops",
                    value: data?.fullCops ?? 0,
                    icon: Icons.inventory_2,
                    color: Colors.purple,
                  ),

                  statCard(
                    title: "Half Cops",
                    value: data?.halfCops ?? 0,
                    icon: Icons.pie_chart,
                    color: Colors.teal,
                  ),

                  statCard(
                    title: "Quarter Cops",
                    value: data?.quarterCops ?? 0,
                    icon: Icons.donut_small,
                    color: Colors.brown,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget overviewCard({
    required String title,
    required dynamic value,
    required Color color,
  }) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 3.h),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
