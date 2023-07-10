import 'package:flutter/material.dart';
import 'hospital_data.dart';

class HospitalsScreen extends StatefulWidget {
  @override
  _HospitalsScreenState createState() => _HospitalsScreenState();
}

class _HospitalsScreenState extends State<HospitalsScreen> {
  String searchQuery = '';

  List<Hospital> getFilteredHospitals() {
    if (searchQuery.isEmpty) {
      return HospitalData.hospitals;
    } else {
      return HospitalData.hospitals.where((hospital) {
        return hospital.area.title
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            hospital.department
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            hospital.name.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredHospitals = getFilteredHospitals();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hospitals'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search by Area, Treatment, Hospital',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: filteredHospitals.length,
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                Hospital hospital = filteredHospitals[index];
                return InkWell(
                  onTap: () {
                    // Handle tapping on a hospital
                  },
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(hospital.imageLink),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hospital.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  hospital.department,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HospitalListScreen extends StatefulWidget {
  final Area? area;

  HospitalListScreen({this.area});

  @override
  _HospitalListScreenState createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  String searchQuery = '';

  List<Hospital> getFilteredHospitals() {
    if (searchQuery.isEmpty) {
      if (widget.area != null) {
        return HospitalData.hospitals
            .where((hospital) => hospital.area == widget.area)
            .toList();
      } else {
        return HospitalData.hospitals;
      }
    } else {
      return HospitalData.hospitals.where((hospital) {
        return (hospital.area == widget.area || widget.area == null) &&
            (hospital.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
                hospital.department
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()));
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredHospitals = getFilteredHospitals();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: widget.area != null
            ? Text(widget.area!.title)
            : Text('All Hospitals'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search by Area, Treatment, Hospital',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            height: 250,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: filteredHospitals.length,
              itemBuilder: (BuildContext context, int index) {
                Hospital hospital = filteredHospitals[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HospitalDetailsPage(hospital: hospital),
                        ),
                      );
                    },
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 180,
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: NetworkImage(hospital.imageLink),
                              fit: BoxFit.cover,
                              // image: AssetImage(
                              //     "assets/wave_design_image.png"),
                              // fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 40,
                                left: 10,
                                child: Container(
                                  width: 180,
                                  child: Flexible(
                                    child: Text(
                                      hospital.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 10,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HospitalDetailsPage(
                                                hospital: hospital),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Click for details",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredHospitals.length,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (BuildContext context, int index) {
                Hospital hospital = filteredHospitals[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HospitalDetailsPage(hospital: hospital),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 10, left: 10, bottom: 15),
                    child: Container(
                      width: 150,
                      child: Material(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: NetworkImage(hospital.imageLink),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 30,
                                      left: 10,
                                      child: Container(
                                        width:
                                            100, // Adjust the width as desired
                                        child: Flexible(
                                          child: Text(
                                            hospital.name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 10,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HospitalDetailsPage(
                                                hospital: hospital,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Click for details",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
