import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:melaka_wanderlust/models/place.dart';
import 'package:melaka_wanderlust/models/wishlist.dart';
import 'package:melaka_wanderlust/pages/review_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailPage extends StatelessWidget {
  final Place place;

  PlaceDetailPage({
    Key? key,
    required this.place,
  }) : super(key: key);

  // Function to open the website
  void _launchURL() async {
    final String website = place.website;

    try {
      if (await canLaunch(website)) {
        await launch(website);
      } else {
        // Fallback to opening in the browser
        await launch(website);
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  // double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  //   var p = 0.017453292519943295; // Pi/180
  //   var a = 0.5 - cos((lat2 - lat1) * p)/2 +
  //       cos(lat1 * p) * cos(lat2 * p) *
  //           (1 - cos((lon2 - lon1) * p))/2;
  //   return 12742 * asin(sqrt(a)); // 2 * R; R = 6371 km
  // }
  //
  // Future<List<Place>> fetchNearbyPlaces(double currentLat, double currentLon) async {
  //   List<Place> nearbyPlaces = [];
  //   const double maxDistance = 10.0; // Max distance in kilometers
  //
  //   var snapshot = await FirebaseFirestore.instance.collection('places').get();
  //   for (var doc in snapshot.docs) {
  //     var placeData = doc.data();
  //     double lat = placeData['latitude'];
  //     double lon = placeData['longitude'];
  //
  //     double distance = calculateDistance(currentLat, currentLon, lat, lon);
  //     if (distance <= maxDistance) {
  //       nearbyPlaces.add(Place.fromMap(placeData)); // Convert Map to Place object
  //     }
  //   }
  //
  //   return nearbyPlaces;
  // }

  Future<void> addBeachToWishlist(BuildContext context, Place place) async {
    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? username = prefs.getString('username');
      await Provider.of<Wishlist>(context, listen: false).addPlaceToUserWishlist(username!,place);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Successfully added!'),
          content: Text('Check your wishlist'),
        ),
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to add to wishlist: $error'),
        ),
      );
    }
  }

  Widget buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget scroll(BuildContext context) {
    return Stack(
      children: [
        DraggableScrollableSheet(
          initialChildSize: 0.65,
          maxChildSize: 1.0,
          minChildSize: 0.65,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 35,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      place.name,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 5,
                      ),
                    ),
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold, // Make it bold
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      place.description,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 5,
                      ),
                    ),
                    Text(
                      'Operating hour',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold, // Make it bold
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      place.operatingHours,
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 5,
                      ),
                    ),
                    Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold, // Make it bold
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          place.minPrice == 0 ? 'Free Entry' : 'RM ${place.minPrice} - RM ${place.maxPrice}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        if (place.minPrice != 0)
                          ElevatedButton(
                            onPressed: () {
                              _launchURL(); // Pass the URL to the function
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            ),
                            child: Text(
                              'Book now!',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 5,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 90,
          child: ElevatedButton.icon(
            onPressed: () => addBeachToWishlist(context, place),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              backgroundColor: Colors.orange,
            ),
            icon: Icon(
              Icons.favorite,
              size: 24,
            ),
            label: Text(
              'Add to wishlist',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
              child: Image.asset(
                place.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            buttonArrow(context),
            scroll(context),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to ReviewListScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReviewListScreen(place: place)),
            );
          },
          child: Icon(Icons.comment), // Icon for the FAB
          tooltip: 'Comment',
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}
