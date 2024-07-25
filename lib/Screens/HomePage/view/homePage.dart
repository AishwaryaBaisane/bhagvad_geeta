import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Theme_Provider/ThemeProvider.dart';
import '../../../provider/Geeta_Provider.dart';
import '../../../utils/GlobalData.dart';
import '../Provider/home_page_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    GitaProvider gitaProvider = Provider.of<GitaProvider>(context);
    HomePageProvider homePageProviderTrue =
        Provider.of<HomePageProvider>(context);
    ThemeChange ThemeChangeTrue =
        Provider.of<ThemeChange>(context, listen: true);
    ThemeChange ThemeChangeFalse =
        Provider.of<ThemeChange>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(
            'अध्यायो की सुचि',
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            DropdownButton(
              value: homePageProviderTrue.selectLanguage,
              onChanged: (String? value) {
                homePageProviderTrue.setLanguage(value!);
              },
              items: <String>['Sanskrit', 'Hindi', 'English', 'Gujarati']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,),
                );
              }).toList(),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: height * 0.065,
                width: width * 0.8,
                color: Theme.of(context).colorScheme.primary,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.03,
                    ),
                    InkWell(onTap: () {
                      Navigator.of(context).pop();
                    },
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 28,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      'भगवद गीता - Gita',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/fav');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 26,
                  ),
                  title: Text(
                    '   फेवरेट श्लोक',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22
                    ),
                  ),
                ),
              ),
              ...List.generate(
                IcosnList.length,
                (index) => (index == 6)
                    ? ListTile(
                        leading: ThemeChangeTrue.isDark
                            ? Icon(
                                Icons.mode_night,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 25,
                              )
                            : Icon(
                                Icons.sunny,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 26,
                              ),
                        title: Text(
                          "   ${ThemeChangeTrue.isDark ? 'डार्क मोड' : 'प्रकाश मोड'}",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 22),
                        ),
                        trailing: Switch(
                          value: ThemeChangeTrue.isDark,
                          onChanged: (value) {
                            ThemeChangeFalse.Theme();
                          },
                        ),
                      )
                    : ListTile(
                        leading: Icon(
                          IcosnList[index],
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 26,
                        ),
                        title: Text(
                          '   ${TextList[index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 22),
                        ),
                      ),
              ),
            ],
          ),
        ),
        body: Container(
          height: height * double.infinity,
          width: width * double.infinity,
          // color: Color(0xffdd9827),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/homePage.jpg'), fit: BoxFit.cover),
          ),
          child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemCount: gitaProvider.gitaModalList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.94,
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              selectIndex = index;
                              Navigator.of(context).pushNamed('/detail');
                            },
                            child: Text(
                              textAlign: TextAlign.center,
                              (homePageProviderTrue.selectLanguage ==
                                      'Sanskrit')
                                  ? gitaProvider
                                      .gitaModalList[index].chapterName.Sanskrit
                                  : (homePageProviderTrue.selectLanguage ==
                                          'Hindi')
                                      ? gitaProvider.gitaModalList[index]
                                          .chapterName.Hindi
                                      : (homePageProviderTrue.selectLanguage ==
                                              'English')
                                          ? gitaProvider.gitaModalList[index]
                                              .chapterName.English
                                          : gitaProvider.gitaModalList[index]
                                              .chapterName.Gujarati,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        height: height * 0.09,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

