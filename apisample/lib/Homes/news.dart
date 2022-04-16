import 'package:apisample/Apis/api.dart';
import 'package:apisample/Apis/apimanager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<ApiNews> _news;
  @override
  void initState() {
    _news=Apimanager().getnews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api_Integration"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<ApiNews>(
        future: _news,
        builder: (context,snapshot){
          if(snapshot.hasData){
          return  ListView.builder(itemCount: snapshot.data!.articles.length,itemBuilder: ((context, index){
            var article=snapshot.data!.articles[index];
          return SizedBox(
            height: 100,
            width: 100,
            child: Row(
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return SafeArea(
                        child: Hero(tag: 'Hero', child:Container(
                          color: Colors.black,
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                  Flexible(
                                    child: SizedBox(
                                    height: 100,
                                    child: Card(
                                               clipBehavior: Clip.antiAlias,
                                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                               child: AspectRatio(aspectRatio:3,
                                               child: Image.network(article.urlToImage,fit:BoxFit.cover,),),
                                             ),
                                           ),
                                        ),                  
                        Text('Description\n'+article.description,style:const TextStyle(color:Colors.blue,fontSize: 15),),
                        const Spacer(),
                        Text('Content:\n'+article.content,style:const TextStyle(color:Colors.green,fontSize: 15),),                       
                              ],
                            ),
                          ),
                        )
                        ),
                      );
                    })
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: AspectRatio(aspectRatio:1,
                    child: Image.network(article.urlToImage,fit:BoxFit.cover,),),
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(article.title,style:const TextStyle(color: Colors.red,fontSize: 13,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                        subtitle:Text(article.description,maxLines:2,style:const TextStyle(color: Colors.blue,fontSize: 10,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),) , 
                        trailing: Text('-Author: '+article.author,style:const TextStyle(color: Colors.green,fontSize: 10,fontWeight: FontWeight.bold)),
                        hoverColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));}
        else{
          return shimmer();
        }
        },
      ),
    );
  }
}
Widget shimmer(){return Center(
  child: Shimmer.fromColors(
    baseColor: Colors.red,
    highlightColor: Colors.yellow,
    child:const Text(
      'Loading.....',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0,
        fontWeight:
        FontWeight.bold,
      ),
    ),
  ),
);}