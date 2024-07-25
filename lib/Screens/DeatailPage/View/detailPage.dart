import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'package:share_extend/share_extend.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../../../provider/Geeta_Provider.dart';
import '../../HomePage/Provider/home_page_provider.dart';
import '../../HomePage/view/homePage.dart';
import '../Detail_Page_Provider/provider.dart';

// GlobalKey imgKey = GlobalKey();
List<GlobalKey> imgKey = List.generate(50, (index) => GlobalKey());

// List<GlobalKey> imgKey =
// List.generate(30, (index) => GlobalKey());

class detailPage extends StatelessWidget {
  const detailPage({super.key});

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: SizedBox(
            child: Text(
              overflow: TextOverflow.ellipsis,
              'अध्याय ${gitaProvider.gitaModalList[selectIndex].chapter}' +
                  ' - ' +
                  gitaProvider.gitaModalList[selectIndex].chapterName.Hindi,
              style: TextStyle(fontSize: 27),
            ),
            width: width * 0.6,
          ),
          actions: [
            IconButton(
              onPressed: () {
                detailPageProvider.setData();
                if (detailPageProvider.fav) {
                  detailPageProvider.favoriteList.add(
                    gitaProvider.gitaModalList[selectIndex]
                        .verses[detailPageProvider.index].language.Sanskrit,
                  );
                } else {
                  detailPageProvider.favoriteList.remove(
                    gitaProvider.gitaModalList[selectIndex]
                        .verses[detailPageProvider.index].language.Sanskrit,
                  );
                }

                print(detailPageProvider.favoriteList);
              },
              icon: (detailPageProvider.fav)
                  ? Icon(Icons.favorite,size: 30,)
                  : Icon(Icons.favorite_border,size: 30,),
            ),
            SizedBox(
              width: width * 0.03,
            ),
            InkWell(
              onTap: () async {
                RenderRepaintBoundary boundary = imgKey[selectIndex]
                    .currentContext!
                    .findRenderObject() as RenderRepaintBoundary;

                ui.Image image = await boundary.toImage();
                ByteData? bytedata =
                    await image.toByteData(format: ui.ImageByteFormat.png);
                Uint8List img = bytedata!.buffer.asUint8List();
                ImageGallerySaver.saveImage(img);
                final path = await getApplicationDocumentsDirectory();
                File file = File("${path.path}/img.png");
                file.writeAsBytes(img);
                ShareExtend.share(file.path, "image");
              },
              child: Icon(
                Icons.share,
                size: 26,
              ),
            ),
            SizedBox(
              width: width * 0.04,
            ),
          ],
        ),
        body: Container(
          height: height * double.infinity,
          width: width * double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: (themeChange.isDark)
                    ? (selectIndex == 0)
                        ? AssetImage('assets/img/1.jpg')
                        : (selectIndex == 1)
                            ? AssetImage('assets/img/2.jpg')
                            : (selectIndex == 2)
                                ? AssetImage('assets/img/3.jpg')
                                : (selectIndex == 3)
                                    ? AssetImage('assets/img/4.jpg')
                                    : (selectIndex == 4)
                                        ? AssetImage('assets/img/5.jpg')
                                        : (selectIndex == 5)
                                            ? AssetImage('assets/img/6.jpg')
                                            : (selectIndex == 6)
                                                ? AssetImage('assets/img/7.jpg')
                                                : (selectIndex == 7)
                                                    ? AssetImage(
                                                        'assets/img/8.jpg')
                                                    : (selectIndex == 8)
                                                        ? AssetImage(
                                                            'assets/img/9.jpg')
                                                        : AssetImage(
                                                            'assets/img/9.jpg')
                    : AssetImage('assets/img/basuri2.png'),
                fit: (themeChange.isDark) ? BoxFit.cover : null),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: gitaProvider.gitaModalList[selectIndex].verses.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 20),
              child: Center(
                child: RepaintBoundary(
                  key: imgKey[index],
                  child: Container(
                    height: height * 0.8,
                    width: width * 0.9,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Text(
                          '~: श्लोक :~\n',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 25,
                            shadows: [
                              Shadow(
                                color: Colors.white,
                                blurRadius: 15,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          gitaProvider.gitaModalList[selectIndex].verses[index]
                              .language.Sanskrit,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 25,
                            shadows: [
                              Shadow(color: Colors.white, blurRadius: 15)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Text(
                          '\n|| अनुवाद ||\n',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 25,
                            shadows: [
                              Shadow(color: Colors.white, blurRadius: 15,)
                            ],
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          (homePageProviderTrue.selectLanguage == 'Sanskrit')
                              ? gitaProvider.gitaModalList[selectIndex]
                                  .verses[index].language.Sanskrit
                              : (homePageProviderTrue.selectLanguage == 'Hindi')
                                  ? gitaProvider.gitaModalList[selectIndex]
                                      .verses[index].language.Hindi
                                  : (homePageProviderTrue.selectLanguage ==
                                          'English')
                                      ? gitaProvider.gitaModalList[selectIndex]
                                          .verses[index].language.English
                                      : gitaProvider.gitaModalList[selectIndex]
                                          .verses[index].language.Gujarati,
                          // gitaProvider.gitaModalList[selectIndex].verses[index]
                          //     .language.Sanskrit,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 25,
                            shadows: [
                              Shadow(
                                color: Colors.white,
                                blurRadius: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
