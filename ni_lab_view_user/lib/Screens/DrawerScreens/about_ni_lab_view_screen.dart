import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';

import '../../app_colors.dart';
import '../../app_theme.dart';

class AboutNiLabViewScreen extends StatefulWidget {
  const AboutNiLabViewScreen({Key? key}) : super(key: key);

  @override
  State<AboutNiLabViewScreen> createState() => _AboutNiLabViewScreenState();
}

class _AboutNiLabViewScreenState extends State<AboutNiLabViewScreen> {
  buildheadingForAboutSection({String? text}) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 3, // This can be the space you need between text and underline
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.orangeAccent,
            width: 1.0, // This would be the width of the underline
          ),
        ),
      ),
      child: Text(
        text!,
        style: AppTheme.kHeadingStyleForAboutSection,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'About NILabView Academy',
          style: TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              "Asssets/menu2.png",
              height: 100,
              width: 250,
            ),
          ),
          buildheadingForAboutSection(text: "About Center"),
          const SizedBox(
            height: 15,
          ),
          // Text(
          //   "AKGEC jointly with National Instruments (India) has set up AKGEC-NI LabVIEW Academy for Educational Institutions at AKGEC, Ghaziabad. This Academy is an initiative of NI under their Planet NI (Nurturing Innovation) framework which strives to increase the employability of Indian engineering graduates by creating 'Center of Excellence' in Engineering Colleges and Universities which will provide cost effectiveaccess to world class latest technology through classroom teaching-learning. \n The LabVIEW Academy is an acclaimed ISO 9001:2008 and ISO 29990:2010 certified training center to provide hands on training in LabVIEW for engineering students, faculty and industrial personnel in and around North India.The Academy also provides facilities for students to carry out their under graduate and post graduate projects. The Academy is actively involved in conducting short-term training courses for faculty and students from various engineering colleges. The center has highly skilled Faculty/Engineers duly trained by National Instruments, India and certified by National Instruments, US under ‘Train the Trainer’ program to conduct the classes under these training programs at the center",
          //   style: AppTheme.kHeadingContentStyleForAboutSection,
          // ),
          ReadMoreText(
            "AKGEC jointly with National Instruments (India) has set up AKGEC-NI LabVIEW Academy for Educational Institutions at AKGEC, Ghaziabad. This Academy is an initiative of NI under their Planet NI (Nurturing Innovation) framework which strives to increase the employability of Indian engineering graduates by creating 'Center of Excellence' in Engineering Colleges and Universities which will provide cost effectiveaccess to world class latest technology through classroom teaching-learning. \n The LabVIEW Academy is an acclaimed ISO 9001:2008 and ISO 29990:2010 certified training center to provide hands on training in LabVIEW for engineering students, faculty and industrial personnel in and around North India.The Academy also provides facilities for students to carry out their under graduate and post graduate projects. The Academy is actively involved in conducting short-term training courses for faculty and students from various engineering colleges. The center has highly skilled Faculty/Engineers duly trained by National Instruments, India and certified by National Instruments, US under ‘Train the Trainer’ program to conduct the classes under these training programs at the center",
            style: AppTheme.kHeadingContentStyleForAboutSection,
            trimLines: 15,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' read more',
            trimExpandedText: ' read less',
            moreStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          buildheadingForAboutSection(text: "Training Programs"),
          const SizedBox(
            height: 15,
          ),
          Text(
            "The AKGEC-NI LabVIEW Academy aims to train engineering students of all disciplines up to the Industry expectations and foster research in the field of Virtual Instrumentation with LabVIEW. The center conducts following training programs forindustry professionals and engineering students of all disciplines",
            style: AppTheme.kHeadingContentStyleForAboutSection,
          ),
          const SizedBox(
            height: 20,
          ),
          buildheadingForAboutSection(text: "Infrastructure"),
          const SizedBox(
            height: 15,
          ),
          Text(
            "The Center is having state of art infrastructure comprises DAQ Cards, PXIs ELVIS Mechatronics Board, Training Board, Robotic Kit,Wireless Sensor Network applications suitable for transforming various industrial processes",
            style: AppTheme.kHeadingContentStyleForAboutSection,
          ),
          const SizedBox(
            height: 20,
          ),
          buildheadingForAboutSection(text: "Photo Gallery"),
          const SizedBox(
            height: 15,
          ),
          Text(
            "The trainees enjoy comfortable stay with 24 hours power back up & unlimited Internet facility including nutritious food on payment basis.The facility is endowed with good lighting and sufficient ventilation",
            style: AppTheme.kHeadingContentStyleForAboutSection,
          ),
        ],
      ),
    );
  }
}
