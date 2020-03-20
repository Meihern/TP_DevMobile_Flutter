import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Gallery extends StatefulWidget{
  @override
  _GalleryState createState() => _GalleryState();

}



class _GalleryState extends State<Gallery>{
  String keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding : const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Key word'),
              onChanged: (value){
                setState(() {
                  this.keyword=value;
                });
              },
              onSubmitted: (value){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GalleryData(value)));
              },
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GalleryData(this.keyword)));
                },
                color: Colors.deepOrange,
                textColor: Colors.white,
                child: Text("Get Data"),
              ),
            )
          ],
        ),
      )
    );
  }

}

class GalleryData extends StatefulWidget {
  String keyword;
  GalleryData(this.keyword);

  @override
  _GalleryDataState createState() => _GalleryDataState();
}


class _GalleryDataState extends State<GalleryData>{
  int currentPage = 1;
  int pageSize = 10;
  int totalPages = 0;
  ScrollController _scrollController = new ScrollController();
  dynamic dataGallery;
  List<dynamic> hits = new List();

  getData(url){
    http.get(url).then((resp){
      setState(() {
        dataGallery = json.decode(resp.body);
        hits.addAll(dataGallery['hits']);
        if(dataGallery['totalHits']%this.pageSize==0){
          this.totalPages=dataGallery['totalHits']~/this.pageSize;
        }
        else{
          this.totalPages = 1+(dataGallery['totalHits']/this.pageSize).floor();
        }
      });
    }).catchError((err){
      print("Error : $err");
    });
  }


  @override
  void initState() {
    super.initState();
    this.loadData();
    this._scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        if(currentPage < totalPages){
          ++currentPage;
          this.loadData();
        }
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void loadData(){
    String url="https://pixabay.com/api/?key=15656401-d6ef99cbe14950055ebaec096&q=${widget.keyword}&page=$currentPage&per_page=$pageSize";
    print(url);
    this.getData(url);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.keyword} : $currentPage/$totalPages"),
        backgroundColor: Colors.deepOrange,
      ),
      body: (hits == null)?Center(child: CircularProgressIndicator()):
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: (hits == null)?0:hits.length,
              controller: _scrollController,
              itemBuilder: (context, index){
                return Card(
                  semanticContainer: true,
                  color: Colors.white,
                  child: ListTile(
                    title: Container(child: Center(child: Text("${hits[index]['tags']}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      )
                    ),
                    subtitle: Container(
                      child: Image(
                        image: NetworkImage("${hits[index]['webformatURL']}"),
                      ),
                    ),
                  ),

                );
              },
          )
    );
  }

}
