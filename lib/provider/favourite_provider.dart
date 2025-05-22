
import 'package:favourite_app_riverpod/model/item.dart';
import 'package:favourite_app_riverpod/state/favourite_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favProvider = StateNotifierProvider<FavouriteNotifier,FavouriteState>((ref){
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteState>{
FavouriteNotifier(): super(FavouriteState(
    allItems: [], filteredItems: [], search: ''));
void addItems(){
  List<Item> item=[
    Item(name: 'mac', id: 1, favourite: false),
    Item(name: 'dell', id: 2, favourite: true),
    Item(name: 'hp', id: 3, favourite: false),
    Item(name: 'samsung', id: 4, favourite: true),
  ];
  state = state.copyWith(allItems: item.toList(),filteredItems: item.toList());
}
void toggleFavourite(int id ){
  final updatedAllItems = state.allItems.map((item){
    if(item.id == id){
      return item.copyWith(favourite: !item.favourite);
    }
    return item;
  }).toList();
final updatedFilteredItems = state.filteredItems.map((item){
  if(item.id== id){
    return item.copyWith(favourite: !item.favourite);
  }
  return item;
}).toList();

state = state.copyWith(
  filteredItems: updatedFilteredItems,
  allItems: updatedAllItems
);
}
}