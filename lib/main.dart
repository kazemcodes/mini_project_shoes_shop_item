import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: DetailCard(),
      ),
    );
  }
}

class DetailCard extends StatefulWidget {
  const DetailCard({Key? key}) : super(key: key);

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(
      height: 300,
      width: 280,
      child: Card(
        color: Theme.of(context).colorScheme.background,
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 8.0,
        margin: const EdgeInsets.all(16.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16,16,16,4),
              child: BrandAndStarWidget(asset: "images/nike.svg",numberOfStar: 5,),),

            Expanded(
              flex: 1,
              child: Image.asset("images/shoes.jpg"),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(16,4,16,16),
                child: PriceWidget())
          ],
        ),
      ),
    ));
  }
}

class PriceWidget extends StatefulWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text("2.95 \$",style: TextStyle(fontWeight: FontWeight.w900),),
        GestureDetector(
          child: (isFavorite ? const Icon(Icons.favorite,color: Colors.red,) : const Icon(Icons.favorite_border,color: Colors.red)),
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
        )

      ],
    );
  }
}



class FavoriteCount extends StatelessWidget {
  const FavoriteCount({Key? key, required this.numberOfStar}) : super(key: key);

  final double numberOfStar;

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      const Icon(Icons.star, color: Colors.amber,),
      Text("$numberOfStar")
    ],);
  }
}

class BrandAndStarWidget extends StatelessWidget {
  const BrandAndStarWidget({Key? key, required this.asset, required this.numberOfStar}) : super(key: key);

  final String asset;
  final double numberOfStar;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(asset,width: 25,height: 25,),
        FavoriteCount(numberOfStar: numberOfStar,),
      ],
    );
  }
}
