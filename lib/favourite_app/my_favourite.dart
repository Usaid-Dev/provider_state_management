import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favourite_provider.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({super.key});

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Items'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyFavourite(),
                ),
              );
            },
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteProvider.selectedItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text(
                        'Item ' + index.toString(),
                      ),
                      trailing: Icon(
                        value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
