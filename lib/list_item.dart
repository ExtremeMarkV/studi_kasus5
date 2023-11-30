import 'package:flutter/material.dart';
import 'package:studi_kasus5/detail_page.dart';
import 'package:studi_kasus5/style.dart';
import 'package:studi_kasus5/makanan.dart';
import 'package:studi_kasus5/http_helper.dart';



class ListItem extends StatelessWidget {
   HttpHelper api = HttpHelper();
  final Makanan makanan;

  ListItem(
  {super.key,required this.makanan,required this.api}
  );

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          makanan : makanan,
          api: api,
        ),
      ),
    );
  },
      child: Container(
        //...
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: 
                  BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 178, 178, 178),
                      offset: Offset(10.0, 10.0),
                      blurRadius: 6.0,
                  ),
                  ],
              ),
              height: 100,
              padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                 api.url + makanan.gambar,
              width: 85,
              height: 75,
              fit: BoxFit.cover,
          ),
          SizedBox(
              width: 10,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                  makanan.nama,
                  style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  ),
              ),
              Text(
                  makanan.deskripsi,
                  style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13
                  ),
              ),
              Text(
                  makanan.harga,
                  style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black45
                  ),
              ),
              ]),
              ],
            ),
      ),
    );
  }
}