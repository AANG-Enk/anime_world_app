import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ComponentLoaderCard extends StatelessWidget{
  const ComponentLoaderCard({super.key, required this.panjang});
  final int panjang;

  @override
  Widget build(BuildContext context) {
    if(panjang == 1){
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!, 
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 300.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: Colors.white
          ),
        )
      );
    }else{
      return SizedBox(
        height: 350.0,
        child: ListView.separated(
          itemCount: panjang,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (context, index){
            return const SizedBox(width: 10.0,);
          }, 
          itemBuilder: (context, index){
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!, 
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 150.0,
                height: 300.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.white
                ),
              )
            );
          }, 
        ),
      );
    }
  }
}