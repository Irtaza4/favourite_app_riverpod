
import 'package:favourite_app_riverpod/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return  Scaffold(
    appBar:AppBar(
      title: Text('Favourite App',style: TextStyle(
        fontWeight: FontWeight.bold
      ),),
      centerTitle: true,
    ) ,
    body: Consumer(builder: (context,ref,child){
      final provider = ref.watch(favProvider);
      return ListView.builder(
          itemCount: provider.filteredItems.length,
          itemBuilder: (context,index){
          final item = provider.filteredItems[index];
            return ListTile(
         title:Text(item.name),
              trailing: IconButton(onPressed: (){
                ref.read(favProvider.notifier).toggleFavourite(item.id);
              }, icon: Icon(item.favourite?Icons.favorite:Icons.favorite_outline_rounded)),
        );
      });
    }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(favProvider.notifier).addItems();
      }),
    );
  }
}
