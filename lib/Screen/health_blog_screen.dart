import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;

class HealthBlog {
  final String title;
  final String imageUrl;

  HealthBlog({
    required this.title,
    required this.imageUrl,
  });
}

class HealthBlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Health Blogs'),
      // ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 7),
        child: FutureBuilder<List<HealthBlog>>(
          future: fetchHealthBlogs(),
          builder:
              (BuildContext context, AsyncSnapshot<List<HealthBlog>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List<HealthBlog> healthBlogs = snapshot.data!;
              return SizedBox(
                height: 180,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: healthBlogs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return null;
                  
                    // ... your item widget code ...
                  },
                ),
              );
            } else {
              return Center(child: Text('No data found'));
            }
          },
        ),
      ),
    );
  }

  Future<List<HealthBlog>> fetchHealthBlogs() async {
    List<String> healthBlogUrls = [
      'https://www.webmd.com/',
      'https://www.healthline.com/',
      'https://www.mayoclinic.org/',
      'https://www.medicalnewstoday.com/',
      'https://www.health.harvard.edu/blog',
      'https://health.clevelandclinic.org/',
      'https://www.health.com/',
      'https://www.medscape.com/',
      'https://www.verywellhealth.com/',
      'https://www.healthaffairs.org/do/10.1377/hblog',
    ];

    List<HealthBlog> allHealthBlogs = [];

    for (String apiUrl in healthBlogUrls) {
      try {
        final response = await http.get(Uri.parse(apiUrl));
        if (response.statusCode == 200) {
          List<HealthBlog> healthBlogs = parseHealthBlogs(response.body);
          allHealthBlogs.addAll(healthBlogs);
        } else {
          print('Failed to fetch data from $apiUrl');
        }
      } catch (e) {
        print('Error fetching data from $apiUrl: $e');
      }
    }

    return allHealthBlogs;
  }

  List<HealthBlog> parseHealthBlogs(String htmlData) {
    List<HealthBlog> healthBlogs = [];

    // Parse the HTML data
    dom.Document document = htmlParser.parse(htmlData);

    // Extract blog information
    var blogElements = document.querySelectorAll('.blog-post');
    for (var blogElement in blogElements) {
      String title = blogElement.querySelector('.blog-title')?.text ?? '';
      String imageUrl =
          blogElement.querySelector('.blog-image')?.attributes['src'] ?? '';

      HealthBlog healthBlog = HealthBlog(
        title: title,
        imageUrl: imageUrl,
      );
      healthBlogs.add(healthBlog);
    }

    return healthBlogs;
  }
}
