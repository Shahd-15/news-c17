import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_c17/core/resources/assets_manager.dart';
import 'package:news_c17/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/strings_manager.dart';

class HomeDrawer extends StatelessWidget {
  final void Function() onPress;
  const HomeDrawer(this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Drawer(
      backgroundColor: settingsProvider.currentTheme == ThemeMode.dark ? ColorsManager.darkSecondaryColor : ColorsManager.lightPrimaryColor,
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 166.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
              child: Text(StringsManager.appTitle,style: Theme.of(context).textTheme.headlineMedium,)),
          SizedBox(height: 16.h,),
          Padding(
            padding: REdgeInsets.symmetric(
              horizontal: 16
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onPress();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(AssetsManager.home,height: 24.h,width: 24.w,),
                      SizedBox(width: 8.w,),
                      Text(StringsManager.goToHome,style: Theme.of(context).textTheme.labelMedium,)
                    ],
                  ),
                ),
                Divider(
                  height: 48.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/roller-paint-brush.svg",height: 24.h,width: 24.w,),
                    SizedBox(width: 8.w,),
                    Text("Theme",style: Theme.of(context).textTheme.labelMedium,)
                  ],
                ),
                SizedBox(height: 8.h,),
                DropdownButtonFormField<String>(
                    isExpanded: true,
                    dropdownColor: Theme.of(context).colorScheme.secondary,
                    value: settingsProvider.currentTheme == ThemeMode.dark ? "dark" : "light",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary
                          )
                      )
                    ),
                    items: [
                      DropdownMenuItem(
                          value:"dark" ,
                          child: Text("Dark",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.primary),)
                      ),
                      DropdownMenuItem(
                          value: "light",
                          child: Text("Light",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.primary))),
                    ],
                    onChanged: (value) {
                      if (value == "dark") {
                        settingsProvider.changeTheme(ThemeMode.dark);
                      } else {
                        settingsProvider.changeTheme(ThemeMode.light);
                      }
                    },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
