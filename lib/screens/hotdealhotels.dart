import 'package:flutter/material.dart';
import 'package:tecudiahotelbookingapp/models/hotels.dart';
import 'package:readmore/readmore.dart';
import 'package:tecudiahotelbookingapp/models/iconbox.dart';
import 'package:tecudiahotelbookingapp/widgets/boxwidget.dart';

class HotDealHotels extends StatefulWidget {
  final HotelsData data;

  const HotDealHotels({Key? key, required this.data}) : super(key: key);

  @override
  State<HotDealHotels> createState() => _HotDealHotelsState();
}

class _HotDealHotelsState extends State<HotDealHotels> {
  final List<BoxData> offerDataList = [
    BoxData(icon: Icons.bed, text: '2 Bed'),
    BoxData(icon: Icons.food_bank, text: 'Dinner'),
    BoxData(icon: Icons.hot_tub, text: 'Hot Tub'),
    BoxData(icon: Icons.ac_unit, text: '1 AC'),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.data.imageUrl), fit: BoxFit.cover),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 70),
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 70),
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.share,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 70),
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height - 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.text,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                      color: Colors.black,
                    ),
                    Text(
                      widget.data.location,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 206, 135, 28),
                          size: 20,
                        ),
                        Text(
                          "${widget.data.rating} (6.8K review)",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${widget.data.money}/",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "night",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 1.0,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 15),
                const ReadMoreText(
                  'Set in Vung Tau, 100 meters from Beach, BaLi Motel Vung Tau Offers accommodation with a garden, private parking and a shared...',
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Show less',
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 206, 135, 28)),
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 206, 135, 28)),
                ),
                const SizedBox(height: 15),
                const Text(
                  "What we offer",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: offerDataList.length,
                    itemBuilder: (context, index) {
                      return BoxWidget(
                        data: offerDataList[index],
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
                const SizedBox(height: 15),
                const Text(
                  "Hosted by",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://media.gettyimages.com/id/160792386/photo/tiffany-hines-poses-for-photos-at-sls-hotel-on-february-5-2013-in-beverly-hills-california.jpg?s=612x612&w=gi&k=20&c=9WQM_zMAWJGmSV1VMl4HmC-rweO8n0qPPMM4y1Os8ps='), // Replace with your image URL
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Harleen Smith",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 206, 135, 28),
                                  size: 20,
                                ),
                                Text(
                                  "4.9 (6.8K review)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4bN0nHSX1YUjVfK98RgdGfv0o1jb-PHzsjExwWYr-cVwol5EqPoVkcAgnz1HZJaY6VEQ&usqp=CAU'), // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: 600, // Customize the width
                  height: 50, // Customize the height
                  child: ElevatedButton(
                    onPressed: () {
                      // Button onPressed logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF318CE7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Book Now'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
