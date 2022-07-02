import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_theme.dart';
import 'logout_widget.dart';

Drawer homeScreenDrawer(BuildContext context) {
  return Drawer(
    shape: const RoundedRectangleBorder(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    //AppColors.cardsArray[2],
                    // AppColors.cardsArray[3],
                    // AppColors.cardsArray[4],
                    AppColors.cardsArray[1],
                    AppColors.cardsArray[2],
                    AppColors.cardsArray[3],
                  ],
                ),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
              ),
              height: 250,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      'NI LabView',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    'Transforming the skill landscape.',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w300,
                      //fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.primaryColor,
              height: 1,
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.person,
                color: Colors.blueAccent,
              ),
              title: Text(
                'My Profile',
                style: AppTheme().kListTileForDrawerTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/userProfile');
              },
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.abc_outlined,
                color: Colors.orangeAccent,
              ),
              title: Text(
                'About NI LabView',
                style: AppTheme().kListTileForDrawerTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/aboutNiLabView');
              },
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.settings,
                color: Colors.amberAccent,
              ),
              title: Text(
                'Settings',
                style: AppTheme().kListTileForDrawerTextStyle,
              ),
              onTap: () {
                print("Open User Profile Screen");
              },
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.contact_phone_sharp,
                color: Colors.redAccent,
              ),
              title: Text(
                'Contact Us',
                style: AppTheme().kListTileForDrawerTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/ContactScreen');
              },
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.pinkAccent,
              ),
              title: Text(
                'Logout',
                style: AppTheme().kListTileForDrawerTextStyle,
              ),
              onTap: () {
                LogoutWidgetClass.openLogoutDialogue(context);
              },
            ),
          ],
        ),
        //  const Text(''),
        Container(
          padding: const EdgeInsets.only(bottom: 1.5),
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.orangeAccent,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            "Built by Sarthak Agarwal",
            style: AppTheme.kHeadingContentStyleForAboutSection
                .copyWith(fontSize: 12),
          ),
        )
      ],
    ),
  );
}
