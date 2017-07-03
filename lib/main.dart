import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main () {
  runApp(new DesignApp());
}

final ThemeData IOSTHEME = new ThemeData(
    primarySwatch: Colors.red[400],
    primaryColor: Colors.grey,
    primaryColorBrightness: Brightness.light,
    accentIconTheme: new IconThemeData(color: Colors.white),
);

final ThemeData DefaultTheme = new ThemeData(
    primarySwatch: Colors.lightBlue,
    accentColor: Colors.orangeAccent[400],
//    accentIconTheme: new IconThemeData(color: Colors.white),
    primaryIconTheme: new IconThemeData(color: Colors.white)
);

class DesignApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Design App",
      theme:  defaultTargetPlatform == TargetPlatform.iOS
          ? IOSTHEME
          : DefaultTheme,
      home: new GeekApp (),
    );
  }
}
class GeekApp extends StatefulWidget {

  @override
  State createState() {
    return new GeekAppState();
  }
}

enum _DesignAppMenuItems { gta, nfs, cod, ccc }
enum _DesignTab { android, ios }

class GeekAppState extends State<GeekApp> {

  final TextEditingController _controller = new TextEditingController();
  bool _isComposing = false;
  bool _isSearch = false;


  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(length: 2,
        child: new Scaffold(
            drawer: _buildDrawer(),
            appBar: _isSearch ? _buildSearchBar() :_buildAppBar(),
            body:new TabBarView (
              controller: null,
              children: <Widget>[],
            ),
        )
    );
  }

  /*
  new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Container(
                        decoration: new BoxDecoration(
                            color: Theme.of(context).cardColor
                        ),
                        child: _createTextInput(),
                      )
                    ],
                  ),
                ),
   */

  Widget _buildDrawer () {
    return new Drawer(
      elevation: 0.7,
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(child: null),
          new ListTile(
            title: new Text('Home'),
            leading: new Icon(Icons.home),
            onTap: null,
            onLongPress: null,
          ),
          new ListTile(
            title: new Text('About'),
            leading: new Icon(Icons.info_outline, color: Colors.blue,),
            onTap: null,
            onLongPress: null,
          ),
          new ListTile(
            title: new Text('Gallery'),
            leading: new Icon(Icons.photo_album, color: Colors.orange,),
            onTap: null,
            onLongPress: null,
          ),
          new ListTile(
            title: new Text('Video'),
            leading: new Icon(Icons.video_call, color: Colors.green,),
            onTap: null,
            onLongPress: null,
          ),
          new Divider(),
          new ListTile(
            title: new Text('Settings'),
            leading: new Icon(Icons.settings),
            onTap: null,
            onLongPress: null,
          ),
          new ListTile(
            title: new Text('Help'),
            leading: new Icon(Icons.help_outline),
            onTap: null,
            onLongPress: null,
          ),
          new Divider(),
          new ListTile(
            title: new Text('Dialogs'),
            leading: new Icon(Icons.do_not_disturb_alt, color: Colors.red,),
            onTap: null,
            onLongPress: null,
          ),
          new ListTile(
            title: new Text('Links'),
            leading: new Icon(Icons.link),
            onTap: null,
            onLongPress: null,
          ),
        ],
      ),
    );
  }
  Widget _buildSearchBar () {

    return new AppBar(
        leading: new IconButton(icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          color: Theme.of(context).accentColor,
        ),
        title: new TextField(
          controller: null,
          autofocus: true,
          decoration: const InputDecoration(
              hintText: 'Type here',
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
    );
  }
  Widget _buildAppBar () {
    return new AppBar(
      title: new Text('Some Text',style: new TextStyle(color: Colors.white),),
      actions: <Widget> [
        new IconButton(
            icon: new Icon(Icons.search, color: Colors.white,),
            onPressed: _handleSearchBegin),
        new PopupMenuButton<_DesignAppMenuItems>(
            onSelected: (_DesignAppMenuItems value) {_handleStockMenu (context, value);},
            itemBuilder: (BuildContext context) => <PopupMenuItem<_DesignAppMenuItems>> [
              new CheckedPopupMenuItem<_DesignAppMenuItems>(
                  value: _DesignAppMenuItems.gta,
                  child: const Text ('GTA')
              ),
              new PopupMenuItem<_DesignAppMenuItems>(
                  value: _DesignAppMenuItems.nfs,
                  child:const Text ('NFS')),
              new PopupMenuItem<_DesignAppMenuItems>(
                  value: _DesignAppMenuItems.cod,
                  child: const Text ('COD')),
              new PopupMenuItem<_DesignAppMenuItems>(
                  value: _DesignAppMenuItems.ccc,
                  child: const Text ('CCC'))
            ]
        )
      ],
      bottom: new TabBar(
          tabs: <Widget>[
            new Tab(text: 'Android'),
            new Tab(text: 'iOS',)
          ]
      ),
    );
  }
  void _handleStockMenu (BuildContext context, _DesignAppMenuItems value) {
    switch (value) {
      case _DesignAppMenuItems.gta :
        break;
      case _DesignAppMenuItems.nfs :
        break;
      case _DesignAppMenuItems.cod :
        break;
      case _DesignAppMenuItems.ccc :
        break;
    }
  }

  void _handleSearchBegin () {
    ModalRoute.of(context).addLocalHistoryEntry(new LocalHistoryEntry(
        onRemove: () {
          setState(() {
              _isSearch = false;
          });
        },
      ),
    );
    setState(() {
      _isSearch = true;
    });
  }
  Widget _createTextInput () {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child:new Container(
          margin: new EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon (Icons.attach_file,),
                    onPressed: null),
              ),
              new Flexible(
                  child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new TextField(
                      maxLines: null,
                      controller: _controller,
                      decoration: new InputDecoration(
                        hintText: 'Type something',
                      ),
                      onSubmitted: (String text) {
                        setState(() {
                          _isComposing = text.length > 0;
                        });
                      },
                      onChanged: (String text) {
                        setState(() {
                          _isComposing = text.length > 0;
                        });
                      },
                    )
                  ],
                )
              ),

              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: new RaisedButton(
                    onPressed : _isComposing ? () {
                      showDialog(context: context,
                          child: new AlertDialog(
                            title: new Text('Simple alert Dialog'),
                            content: new Text (_controller.text),
                          )
                      );
                    } : null ,
                    child: new Text ('Show'),
                  )
              ),
            ],
          ),
        )
    );
  }



}
