import 'package:flutter/material.dart';
import 'package:efox_flutter/lang/index.dart' show AppLocalizations;
import 'package:efox_flutter/router/index.dart' show FluroRouter;
import 'package:efox_flutter/config/theme.dart' show AppTheme;

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
  }

  List<dynamic> _getList() {
    return [
      {
        'name': AppLocalizations.$t('common_mine_1.language'),
        'icon': 59540, // language
        'index': 0
      },
      {
        'name': AppLocalizations.$t('common_mine_1.environment'),
        'icon': 57539, // import_export
        'index': 1,
      },
      {
        'name': AppLocalizations.$t('common_mine_1.compProgress'),
        'icon': 57709, // low_priority
        'index': 2
      }
    ];
  }

  actionsEvent(int index) {
    print('index $index');
    switch (index) {
      case 0:
        this.openLanguageSelectMenu();
        break;
      case 1:
        this.openEnvSelectMenu();
        break;
      case 2:
        FluroRouter.router.navigateTo(
          context,
          '/webview?url=${Uri.encodeComponent(widget.model.config.state.env.githubWeb)}&title=${Uri.encodeComponent(AppLocalizations.$t('common.compProgress'))}',
        );
        break;
    }
  }
/**
 * message: 提示语 成功了
 * textcolor： 文字颜色 Colors.blue
 * fontsize：文字大小 25.0
 * backgroundColor： 背景颜色 Colors.red[300]
 */
  void popShort([message,textColor,fontSize,backgroundColor]) {
    Navigator.pop(context);
    if (message != null) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        duration:const Duration(milliseconds: 1000),
        content: new Text(message,style: TextStyle(color: textColor,fontSize: fontSize)),
        backgroundColor: backgroundColor,
        // animation: ,
        // action: new SnackBarAction(
        // label: '取消',
        //     onPressed: () {
        //         // do something to undo
        //     }
        //  ),
      ));
    }
  }
/**
 * message: 提示语 成功了
 * textcolor： 文字颜色 Colors.blue
 * fontsize：文字大小 25.0
 * backgroundColor： 背景颜色 Colors.red[300]
 */
  void popLong([message,textColor,fontSize,backgroundColor]) {
    Navigator.pop(context);
    if (message != null) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        duration:const Duration(milliseconds: 5000),
        content: new Text(message,style: TextStyle(color: textColor,fontSize: fontSize)),
        backgroundColor: backgroundColor,
        // animation: ,
        // action: new SnackBarAction(
        // label: '取消',
        //     onPressed: () {
        //         // do something to undo
        //     }
        //  ),
      ));
    }
  }
  /**
   * 国际化
   */
  void openLanguageSelectMenu() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Wrap(
          children: <Widget>[
              ListTile(
                leading: Icon(Icons.label_outline),
                title: Text(
                  AppLocalizations.$t('common_mine_1.cn'),
                ),
                onTap: () {
                  AppLocalizations.changeLanguage(Locale('zh'));
                  this.popShort(AppLocalizations.$t('common_mine_1.success'),Colors.blue[300],25.0,Colors.red[300]);
                },
              ),
              ListTile(
                leading: Icon(Icons.label_outline),
                title: Text(AppLocalizations.$t('common_mine_1.en')),
                onTap: () {
                  AppLocalizations.changeLanguage(Locale('en'));
               this.popShort(AppLocalizations.$t('common_mine_1.success'),Colors.blue[300],25.0,Colors.red[300]);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /**
   * 环境选择
   */
  void openEnvSelectMenu() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.label_outline),
                title: Text(
                  AppLocalizations.$t('mine.loadNetwork'),
                ),
                onTap: () {
                  widget.model.dispatch('config', 'setEnv', true);
               this.popShort(AppLocalizations.$t('common_mine_1.success'),Colors.red[300],25.0,Colors.blue[300]);
                },
              ),
              ListTile(
                leading: Icon(Icons.label_outline),
                title: Text(AppLocalizations.$t('mine.loadLocal')),
                onTap: () {
                  widget.model.dispatch('config', 'setEnv', false);
              this.popShort(AppLocalizations.$t('common_mine_1.success'),Colors.red[300],25.0,Colors.blue[300]);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.$t('nav_title_1')),
        elevation: 0,
        centerTitle: true,
      ),
             
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _getList().length * 2,
        itemBuilder: (context, index) {
          double _index = index / 2;
          if (index % 2 == 0) {
            dynamic item = _getList()[_index.toInt()];
            return ListTile(
              onTap: () {
                actionsEvent(item['index']);
              },
              leading: Icon(
                IconData(
                  item['icon'],
                  fontFamily: 'MaterialIcons',
                  matchTextDirection: true,
                ),
              ),
              title: Text(item['name']),
            );
          } else {
            // return Divider(
              // color: Color(AppTheme.lineColor),
             return  new Image.asset(
              'images/test.jpg',        //图片的路径
              // 'assets/imgs/avatar.png',        //图片的路径
              // width: 600.0,              //图片控件的宽度
              // height: 40.0,            //图片控件的高度
             fit: BoxFit.cover,        //告诉引用图片的控件，图像应尽可能小，但覆盖整个控件。
            );
          }
        },
      ),
    );
  }
}

class Index extends StatefulWidget {
  final dynamic model;

  Index({Key key, this.model}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}
