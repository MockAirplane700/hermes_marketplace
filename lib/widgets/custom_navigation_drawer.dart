import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hermes_marketplace/constants/custom_functions.dart';
import 'package:hermes_marketplace/constants/custom_variables.dart';
import 'package:hermes_marketplace/pages/order_history_page.dart';
import 'package:share_plus/share_plus.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

///--------------------------------------
///       Circle avatar logo
///       Favourite stores
///       Share the application with your friends
///       Follow us on instagram
///       Rate our application
///       Report a bug
///       Contact us
///       Sign out
/// -------------------------------------

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: drawerHeaderColor,
              ),
              child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),child: CircleAvatar(
                radius: MediaQuery.of(context).size.width/4,
                backgroundColor: drawerHeaderColor,
                child: Padding(padding: EdgeInsets.all( MediaQuery.of(context).size.width/50), child: Image.network(logoUrl)),),
                // backgroundImage: NetworkImage(logoUrl, scale: MediaQuery.of(context).size.width),
              ),),
            // Favourite stores
            ListTile(
              leading: const Icon(Icons.history, color: iconColor,),
              title: const Text('Order History', style: TextStyle(color: textColor),),
              onTap: () {
                //go to page
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const OrderHistoryPage()));
              },
            ),
            // Share the application
            ListTile(
              leading: const Icon(Icons.share, color: iconColor,),
              title: const Text('Share Hermes marketplace!', style: TextStyle(color: textColor),),
              onTap: () {
                //share the application
                Share.share(shareUrl);
              },
            ),
            // Follow us on our socials
            ListTile(
              leading: const Icon(Icons.contacts_rounded, color: iconColor,),
              title: const Text('Follow us on our socials!', style: TextStyle(color: textColor),),
              onTap: () {
                //open dialog to icon buttons to socials
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title: const Text('Where we are currently are!.'),
                  backgroundColor: dialogBoxBackgroundColor,
                  content: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: IconButton(onPressed: () {
                        launchWebSiteUrl('https://www.instagram.com/mockAirplane700');
                      }, icon:const  FaIcon(FontAwesomeIcons.instagram))) ,
                      Expanded(child: IconButton(onPressed: () {
                        launchWebSiteUrl('https://www.youtube.com');
                      }, icon: const FaIcon(FontAwesomeIcons.youtube),))
                    ],
                  ),),
                ));
              },
            ),
            // About the application and developer
            ListTile(
              leading: const Icon(Icons.info_outlined, color: iconColor,),
              title: const Text('About the app!', style: TextStyle(color: textColor),),
              onTap: () {
                //open dialog to icon buttons to socials
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title: const Text('About the app and the developer behind it!.'),
                  backgroundColor: dialogBoxBackgroundColor,
                  content: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: Text(
                          'This Application catalogs amazon products, mostly seen on Tiktok and allows one to simply group'
                              'together these products for a more efficient purchases. Please note the amazon links on the application'
                              'are affiliate links and are used to maintain the application, all purchases and transactions will occur on the amazon website as '
                              'users will be redirected there on checkout\n\n\n\n About the developer' , style: TextStyle(color: textColor),
                      )) ,
                      Expanded(child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/80)),
                        elevation: 8,
                        child: SingleChildScrollView(child:  Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width/80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:EdgeInsets.all(MediaQuery.of(context).size.width/80),
                                child: Row(
                                  children: const [
                                    Icon(Icons.person, color: iconColor,)
                                  ],
                                ),
                              ) ,

                              const Text(
                                'My name is Mthandazo Edwin Siziba, I am an aspiring software engineer who tends to work on '
                                    'several problem oriented software solutions towards things I see in my life. This application '
                                    'is an example of that, I keep saving all these amazon products of Tiktok, so why not catalog them!'
                                    '\n\nYou can find more of my work on my website , sizibamthandazo.dev and there is a more detailed profile there '
                                    'about who I am. I hope you enjoy this application, if you have a proposal or questions reach out to me :)',
                                style: TextStyle(color: textColor),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: () => launchWebSiteUrl('https://www.sizibamthandazo.dev'),
                                      icon: const FaIcon(FontAwesomeIcons.globe, color: iconColor,))
                                ],
                              )
                            ],
                          ),
                        ),)
                      )),
                    ],
                  ),),
                ));
              },
            ),
            // Rate our application
            ListTile(
              leading: const Icon(Icons.rate_review_outlined, color: iconColor,),
              title: const Text('Rate Hermes Marketplace', style: TextStyle(color: textColor),),
              onTap: () {
                //go to ratings page on store
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title: const Text('Please select the platform you are currently on.'),
                  backgroundColor: dialogBoxBackgroundColor,
                  content: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: IconButton(onPressed: () {
                        // link to store page
                        launchWebSiteUrl('https://www.apple.com');
                      }, icon:const  FaIcon(FontAwesomeIcons.appStoreIos))) ,
                      Expanded(child: IconButton(onPressed: () {
                        launchWebSiteUrl('https://www.googleplaystore.com');
                      }, icon: const FaIcon(FontAwesomeIcons.googlePlay),))
                    ],
                  ),),
                ));
              },
            ),
            // report a bug
            ListTile(
              leading: const Icon(Icons.bug_report_rounded, color: iconColor,),
              title: const Text('Report a bug', style: TextStyle(color: textColor),),
              onTap: () {
                //send email report
                launchEmailIntent('sizibamthandazo@yahoo.com', 'HERMES MARKET PLACE BUG REPORT');
              },
            ),
            // contact us
            ListTile(
              leading: const Icon(Icons.email, color: iconColor,),
              title: const Text('Contact us', style: TextStyle(color: textColor),),
              onTap: () {
                //Email intent
                launchEmailIntent('sizibamthandzo@yahoo.com', 'HERMES MARKET PLACE CUSTOMER REACHING OUT');
              },
            ),
          ],
        )
    );
  }
}