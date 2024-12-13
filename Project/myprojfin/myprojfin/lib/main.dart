import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';

// global.dart
Map<String, dynamic>? selectedFlight=null;
Map<String, dynamic>? selectedHotel=null;
Color appBackgroundColor = Colors.lightBlue[50]!;
String appLanguage = 'English';


void main() async {
  await dotenv.load();
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Companion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LET'S",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const Text(
              "EXPLORE",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Text(
              "THE WORLD",
              style: TextStyle(
                fontSize: 24,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "We emphasise on making your travel experience easier and fun.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FlightSchedulesPage()),
                );
              },
              child: const Text(
                'Flight Schedules',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HotelBookingPage()),
                );
              },
              child: const Text(
                'Hotel Booking',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TravelItinerariesPage()),
                );
              },
              child: const Text(
                'Travel Itineraries',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()),
                );
              },
              child: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/travel.png',
              height: 350,
            ),
          ],
        ),
      ),
    );
  }
}



class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<Color> _backgroundColors = [
    Colors.lightBlue[50]!,
    Colors.white,
    Colors.grey[200]!,
    Colors.pink[50]!,
    Colors.green[50]!
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Change Background Color',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: _backgroundColors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      appBackgroundColor = color;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: appBackgroundColor == color
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'App Version',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}



List<Map<String, dynamic>> filterFlights(String jsonResponse, String departureIATA, String arrivalIATA, String flightDate) {
  // Parse the JSON response
  final Map<String, dynamic> responseData = json.decode(jsonResponse);

  // Check if 'data' key exists and contains a list
  if (responseData.containsKey('data') && responseData['data'] is List) {
    // Filter the flights
    final List<Map<String, dynamic>> filteredFlights = responseData['data']
        .where((flight) =>
    flight['departure']['iata'] == departureIATA &&
        flight['arrival']['iata'] == arrivalIATA &&
        flight['flight_date'] == flightDate)
        .toList()
        .cast<Map<String, dynamic>>();

    return filteredFlights;
  }

  // Return an empty list if no valid data is found
  return [];
}




class FlightSchedulesPage extends StatefulWidget {
  const FlightSchedulesPage({super.key});

  @override
  _FlightSchedulesPageState createState() => _FlightSchedulesPageState();
}


class _FlightSchedulesPageState extends State<FlightSchedulesPage> {
  final TextEditingController _dateController = TextEditingController();
  String _selectedFrom = 'AKL'; // Default IATA code for "From"
  String _selectedTo = 'SIN';   // Default IATA code for "To"
  List<Map<String, dynamic>> _filteredFlights = [];
  bool _isLoading = false;

  final List<String> _iataCodes = [
    'AKL', 'SIN', 'MEL', 'CHC', 'LHR', 'DXB', 'HKG', 'CGN', 'BER', 'YYZ'
  ];

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        // Format the date as YYYY-MM-DD
        _dateController.text = pickedDate.toIso8601String().split('T').first;
      });
    }
  }

  Future<void> _searchFlights() async {
    setState(() {
      _isLoading = true;
    });

    String from = _selectedFrom;
    String to = _selectedTo;
    String date = _dateController.text;

    if (from.isNotEmpty && to.isNotEmpty && date.isNotEmpty) {
      const String endpoint =
          'https://api.aviationstack.com/v1/flights?access_key=7cd90096d6b9d6169a749bafee8d8053';

      try {
        final response = await http.get(Uri.parse(endpoint));

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          final filteredData =
          filterFlights(response.body, from, to, date); // Filtered flights

          setState(() {
            _filteredFlights = filteredData;
          });

          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FlightResultsPage(flights: _filteredFlights),
            ),
          );
          if (result != null) {
            setState(() {
              selectedFlight = result; // Store the selected flight globally

            });
          }



        } else {
          setState(() {
            _filteredFlights = [];
          });
        }
      } catch (e) {
        setState(() {
          _filteredFlights = [];
        });
      }
    } else {
      setState(() {
        _filteredFlights = [];
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Flight Schedules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedFrom,
              decoration: const InputDecoration(
                labelText: 'From',
                border: OutlineInputBorder(),
              ),
              items: _iataCodes.map((code) {
                return DropdownMenuItem<String>(
                  value: code,
                  child: Text(code),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedFrom = value!;
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedTo,
              decoration: const InputDecoration(
                labelText: 'To',
                border: OutlineInputBorder(),
              ),
              items: _iataCodes.map((code) {
                return DropdownMenuItem<String>(
                  value: code,
                  child: Text(code),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTo = value!;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Date (YYYY-MM-DD)',
                border: OutlineInputBorder(),
              ),
              onTap: _selectDate,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: _searchFlights,
              child: _isLoading
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
                  : const Text(
                'Search Flights',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightResultsPage extends StatelessWidget {
  final List<Map<String, dynamic>> flights;

  const FlightResultsPage({super.key, required this.flights});

  // Convert UTC time to IST
  String convertToIST(String utcTime) {
    try {
      DateTime utcDateTime = DateTime.parse(utcTime).toUtc();
      DateTime canadaDateTime = utcDateTime.subtract(const Duration(hours: 5));
      return canadaDateTime.toString().substring(0, 16); // Format as YYYY-MM-DD HH:mm
    } catch (e) {
      return 'Invalid Time';
    }
  }

  // Mock price generator from flight number
  String generatePrice(String flightNumber) {
    int price = flightNumber.hashCode % 10000 + 5000; // Generate mock price
    return '\$ ${price.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Flight Results'),
      ),
      body: flights.isEmpty
          ? const Center(
        child: Text(
          'No flights found',
          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: flights.length,
        itemBuilder: (context, index) {
          final flight = flights[index];
          final departureTime = convertToIST(flight['departure']['scheduled'] ?? '');
          final arrivalTime = convertToIST(flight['arrival']['scheduled'] ?? '');
          final price = generatePrice(flight['flight']['number'] ?? 'Unknown');

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Pass selected flight back to the previous screen
                Navigator.pop(context, flight);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flight ${flight['flight']['number']}',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Departure: $departureTime IST',
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  Text(
                    'Arrival: $arrivalTime IST',
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  Text(
                    'Price: $price',
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HotelBookingPage extends StatefulWidget {
  const HotelBookingPage({super.key});

  @override
  _HotelBookingPageState createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  final TextEditingController _checkInController = TextEditingController();
  final TextEditingController _checkOutController = TextEditingController();
  String? _selectedLocation; // Selected location
  List<Map<String, dynamic>> _hotels = []; // List of hotels
  bool _isLoading = false;

  // List of IATA codes for locations
  final List<String> _iataCodes = [
    'AKL', 'SIN', 'MEL', 'CHC', 'LHR', 'DXB', 'HKG', 'SYD', 'KUL', 'YYZ'
  ];

  Future<void> _loadHotels() async {
    if (_selectedLocation == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Load the JSON data from the file
      final String response = await rootBundle.loadString('assets/hotels.json');
      final Map<String, dynamic> data = jsonDecode(response);

      // Filter hotels by the selected location
      setState(() {
        _hotels = List<Map<String, dynamic>>.from(data[_selectedLocation!] ?? []);
      });
    } catch (e) {
      setState(() {
        _hotels = [];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error loading hotel data')),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _selectCheckInDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _checkInController.text = pickedDate.toIso8601String().split('T').first;

        // If check-out date is earlier than check-in date, reset check-out date
        if (_checkOutController.text.isNotEmpty) {
          DateTime checkOutDate = DateTime.parse(_checkOutController.text);
          if (pickedDate.isAfter(checkOutDate)) {
            _checkOutController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Check-out date reset. Please select a valid date.'),
              ),
            );
          }
        }
      });
    }
  }

  Future<void> _selectCheckOutDate(BuildContext context) async {
    if (_checkInController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a check-in date first.'),
        ),
      );
      return;
    }

    DateTime checkInDate = DateTime.parse(_checkInController.text);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: checkInDate,
      firstDate: checkInDate, // Ensures check-out date is the same or after check-in date
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _checkOutController.text = pickedDate.toIso8601String().split('T').first;
      });
    }
  }

  void _searchHotels() {
    if (_selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select a location'),
          duration: const Duration(seconds: 2), // Auto-dismiss after 2 seconds
        ),
      );
      return;
    }

    if (_checkInController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Check-in date cannot be empty'),
          duration: const Duration(seconds: 2), // Auto-dismiss after 2 seconds
        ),
      );
      return;
    }

    if (_checkOutController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Check-out date cannot be empty'),
          duration: const Duration(seconds: 2), // Auto-dismiss after 2 seconds
        ),
      );
      return;
    }

    // Proceed with searching hotels if validation passes
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HotelResultsPage(hotels: _hotels),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Hotel Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "LET'S BOOK YOUR STAY",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedLocation,
              decoration: const InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
              items: _iataCodes.map((location) {
                return DropdownMenuItem<String>(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLocation = value;
                  _loadHotels(); // Load hotels for the selected location
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _checkInController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Check-in Date',
                border: OutlineInputBorder(),
              ),
              onTap: () => _selectCheckInDate(context),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _checkOutController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Check-out Date',
                border: OutlineInputBorder(),
              ),
              onTap: () => _selectCheckOutDate(context),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: _searchHotels,
              child: _isLoading
                  ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white))
                  : const Text(
                'Search Hotels',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelResultsPage extends StatelessWidget {
  final List<Map<String, dynamic>> hotels;

  const HotelResultsPage({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Hotel Results'),
      ),
      body: hotels.isEmpty
          ? const Center(
        child: Text(
          'No hotels found',
          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Store the selected hotel in the global variable
                selectedHotel = hotel;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${hotel['name']} selected'),
                  ),
                );

                // Optionally navigate back to the previous page
                Navigator.pop(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel['name'],
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Price per day: \$${hotel['price_per_day']}',
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  Text(
                    'Pool: ${hotel['pool'] ? "Yes" : "No"}',
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  Text(
                    'Pet Friendly: ${hotel['pet_friendly'] ? "Yes" : "No"}',
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class TravelItinerariesPage extends StatelessWidget {
  const TravelItinerariesPage({super.key});

  // Function to convert UTC time to Canada (EST)
  String convertToCanadaTime(String? utcTime) {
    if (utcTime == null) return 'Not Selected';
    try {
      DateTime utcDateTime = DateTime.parse(utcTime).toUtc();
      // Convert UTC to EST (UTC - 5:00)
      DateTime canadaDateTime = utcDateTime.subtract(const Duration(hours: 5));
      return canadaDateTime.toString().substring(0, 16); // Format as YYYY-MM-DD HH:mm
    } catch (e) {
      return 'Invalid Time';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Travel Itineraries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'YOUR TRAVEL ITINERARY',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),
            selectedFlight != null
                ? ListTile(
              leading: const Icon(Icons.flight, color: Colors.blue),
              title: Text(
                'Flight ${selectedFlight!['flight']['number']} to ${selectedFlight!['arrival']['iata']}',
              ),
              subtitle: Text(
                'Departure: ${convertToCanadaTime(selectedFlight!['departure']['scheduled'])} EST\n'
                    'Arrival: ${convertToCanadaTime(selectedFlight!['arrival']['scheduled'])} EST',
              ),
            )
                : const ListTile(
              leading: Icon(Icons.flight, color: Colors.grey),
              title: Text('No flight selected'),
            ),
            const SizedBox(height: 10),
            selectedHotel != null
                ? ListTile(
              leading: const Icon(Icons.hotel, color: Colors.blue),
              title: Text('Hotel: ${selectedHotel!['name']}'),
              subtitle: Text(
                'Price per day: \$${selectedHotel!['price_per_day']}\n'
                    'Pool access: ${selectedHotel!['pool'] ? "Yes" : "None"}\n'
                    'Pet Friendly: ${selectedHotel!['pet_friendly'] ? "Yes" : "No"}',
              ),
            )
                : const ListTile(
              leading: Icon(Icons.hotel, color: Colors.grey),
              title: Text('No hotel selected'),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.blue),
              title: Text('Sightseeing Tour'),
              subtitle: Text('4:00 PM - 7:00 PM'),
            ),
          ],
        ),
      ),
    );
  }
}