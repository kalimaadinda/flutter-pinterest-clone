import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';


class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> imageList = [
    'https://images.unsplash.com/photo-1638735037874-d6141ffd9d8a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633114127188-99b4dd741180?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1638726202464-33c60417b103?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1626718349853-c9430b2b9fdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1617182396737-0ca1ff273b1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1612352090591-f73f08ffb772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1638695214225-dcd28b4cb3a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(12),
          child: StaggeredGridView.countBuilder(
            crossAxisSpacing: 8,
            crossAxisCount: 3, 
            itemCount: imageList.length,
            mainAxisSpacing: 8,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  showModalBottomSheet(
                    context: context, 
                    builder: (context) => SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child:Image.network(imageList[index])
                    ),
                    );
                },
                child: Container(
                  //child: Image.network(imageList[index]),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(12),),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12),
                    ),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage, 
                      image: imageList[index],
                      fit: BoxFit.cover,
                      ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index){
              return StaggeredTile.count(1, index.isOdd ? 1.2 : 1.8);
            }
              )
          
        ),
      ),
    );
  }
}