import 'package:flutter/material.dart';
import 'package:mobile_app/core/app_export.dart';
import 'package:mobile_app/features/book/pages/chapter.page.dart';
import 'package:mobile_app/features/book/pages/chapter2.page.dart';
import 'package:mobile_app/widgets/app_bar/appbar_image.dart';
import 'package:mobile_app/widgets/app_bar/appbar_subtitle.dart';

import '../../../widgets/widgets.dart';

class IndexPage extends StatelessWidget {
  static const String route = 'book/index';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as EpubArguments;
    final book = arguments.book;
    var pos = findOcurrenceChapterArr(book);
    print('epaleeee $pos');
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Indice',
      ),
      body: Center(
        child: ListView.builder(
            itemCount: book!.Chapters!.length,
            itemBuilder:(context, index) {
             
              if(pos.length > 0){
               return (comparateIndexPos(index, pos) ?  ListTile(
                
                 title: Text(
                   book.Chapters![index].Title!,
                    style: AppStyle.txtNunitoSansRegular16,
               
                  )
                  ,
                   subtitle: Text(book.Chapters![index + 1].Title!),
                  onTap: () {
                    print(book);
                    Navigator.pop(context);
                    Navigator.popAndPushNamed(context, ChapterPage.route,
                        arguments: EpubArguments(
                            book: book, chapter: book.Chapters![index]));
                  },
                  
                ) :
                 Container() );
              }else{
               return ListTile(
                
                 title: Text(
                   book.Chapters![index].Title!,
                    style: AppStyle.txtNunitoSansRegular16,
               
                  )
                  ,
                   subtitle: comparateIndexPos(index, pos) ?  Text(book.Chapters![index + 1].Title!) : Text(''),
                  onTap: () {
                    print(book);
                    Navigator.pop(context);
                    Navigator.popAndPushNamed(context, ChapterPage.route,
                        arguments: EpubArguments(
                            book: book, chapter: book.Chapters![index]));
                  },
                  
                ); 

              }
             
            },
            
            
            
            ),
      ),
    );
  }

  showTitle(String data, index, items){
    print('title---------------- $data $index $items');
    var textToShow = '';
  
    return data;
  }

  findOcurrenceChapterArr(book){
   var band = true;
   var pos = [];
    for(var i = 0 ; i < book!.Chapters!.length; i ++){

      String mainString = book.Chapters![i].Title.toLowerCase();
      String substring = "capítulo";

     
        if(mainString.contains(substring)){
            band = false;
            pos.add(i);
        } 
        
      
    }


  return pos;
  }

  comparateIndexPos(index, items){
    var band = false;
    for( var i = 0; i < items.length; i ++){
      if(items[i] == index){
        band = true;
      }
    }

    return band;
  }

   valueArrMenor(index, items){
      var band = false;
    for( var i = 0; i < items.length; i ++){
      if(items[i] < index){
        band = true;
      }
    }

    return band;
  }
}
