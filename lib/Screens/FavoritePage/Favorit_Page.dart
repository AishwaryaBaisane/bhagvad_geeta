import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Theme_Provider/ThemeProvider.dart';
import '../../provider/Geeta_Provider.dart';
import '../DeatailPage/Detail_Page_Provider/provider.dart';
import '../HomePage/Provider/home_page_provider.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    GitaProvider gitaProvider = Provider.of<GitaProvider>(context);
    HomePageProvider homePageProviderTrue =
        Provider.of<HomePageProvider>(context);
    DetailPageProvider detailPageProvider =
        Provider.of<DetailPageProvider>(context);
    ThemeChange themeChange = Provider.of<ThemeChange>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: InkWell(onTap: () {
          Navigator.of(context).pop();
        },child: Icon(Icons.arrow_back,size: 30,)),
        title: Text(
          overflow: TextOverflow.ellipsis,
          'फेवरेट श्लोक',
          style: TextStyle(fontSize: 26),
        ),
      ),
      body: Container(
        height: height * double.infinity,
        width: width * double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/morepankh.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                  detailPageProvider.favoriteList.length,
                  (index) => Text(
                    '${detailPageProvider.favoriteList[index]} \n',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
