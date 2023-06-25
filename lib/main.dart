import 'package:flutter/material.dart';
import 'package:tecudiahotelbookingapp/models/hotels.dart';
import 'package:tecudiahotelbookingapp/models/iconbox.dart';
import 'package:tecudiahotelbookingapp/screens/hotdealhotels.dart';
import 'package:tecudiahotelbookingapp/widgets/boxwidget.dart';
import 'package:tecudiahotelbookingapp/widgets/hotdeals.dart';
import 'package:tecudiahotelbookingapp/widgets/hotels.dart';
import 'package:tecudiahotelbookingapp/widgets/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tecudia App',
      theme: ThemeData(primaryColor: Color(0xFFe6b56c)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BoxData> boxDataList = [
    BoxData(icon: Icons.hotel, text: 'Hotel'),
    BoxData(icon: Icons.flight, text: 'Flights'),
    BoxData(icon: Icons.place, text: 'Place'),
    BoxData(icon: Icons.food_bank, text: 'Food'),
  ];

  final List<HotelsData> hotelsDataList = [
    HotelsData(
        imageUrl:
            "https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/08/07/14/oia-santorini.jpg?width=982&height=726&auto=webp&quality=75",
        text: "Santorini",
        location: "Greece",
        money: 488,
        rating: 4.9),
    HotelsData(
        imageUrl:
            "https://royalsuite.fuerteventurahotelsmix.com/data/Images/OriginalPhoto/12075/1207590/1207590865/costa-calma-royal-suite-image-26.JPEG",
        text: "Hotel Royal",
        location: "Spain",
        money: 280,
        rating: 4.8),
    HotelsData(
        imageUrl:
            "https://cf.bstatic.com/xdata/images/hotel/max200/455081291.jpg?k=0f53b43eb9465024ca90509d1dd8e38decc91b120ce1a254b70338dbacd2abe3&o=&hp=1",
        text: "Hotel Ramada",
        location: "Canada",
        money: 500,
        rating: 4.8),
    HotelsData(
        imageUrl:
            "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/b9/5e/17/khach-s-n-palace.jpg?w=700&h=-1&s=1",
        text: "Bali Motel Vung Tau",
        location: "Indonesia",
        money: 580,
        rating: 4.9,
        offer: 25),

    // Add more data as needed
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavBar(),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: boxDataList.length,
                  itemBuilder: (context, index) {
                    return BoxWidget(
                      data: boxDataList[index],
                      isSelected: index == selectedIndex,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Populer Hotels",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      child: const Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 243, 173, 81),
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: hotelsDataList.length - 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HotelsWidget(data: hotelsDataList[index]),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Hot Deals",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: SizedBox(
                    height: 250,
                    width: 400,
                    child: HotelDealWidget(data: hotelsDataList[3]),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotDealHotels(
                                  data: hotelsDataList[3],
                                )));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
