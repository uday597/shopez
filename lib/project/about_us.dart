import 'package:flutter/material.dart';

class AboutUspage extends StatelessWidget {
  const AboutUspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: Text('About us'),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'We are a passionate team dedicated to delivering \nhigh-quality products and customer satisfaction through continuous improvement ',
                  style: TextStyle(fontSize: 15),
                ),
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '|',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 200, 93, 0),
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  Text(
                    'Why Choose Us:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'We offer reliable solutions,\n expert support, and\n customer-first service\n to ensure your\n satisfaction with every experience. ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaB25eq4bX28JH9z9fBXh4kyjqi1wIcaCPKg&s',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(
                thickness: 4,
                color: const Color.fromARGB(136, 0, 0, 0),
                endIndent: 30,
                indent: 30,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      '|',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 200, 93, 0),
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 6, top: 3),
                      child: Text(
                        'Our Value',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'BUILDING ON INTEGRITY AND EXCELLENCE',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://tngdefense.com/wp-content/uploads/2024/01/TNG-Core-Values_v3-1024x506.png',
                  height: 300,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '|',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 200, 93, 0),
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  Text(
                    'Worldwide Brand Associates',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtPGuM5hw2piuF_uv3SgGC7nmIpZqMrWRk-A&s',
                      ),
                      height: 80,
                      width: 120,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvMkYWSk2Bd1GJRDyXR6eAwXfjnKRhCbroijt8GTKpwkj73bPKVxvDNd5n0RL41ujY2j8&usqp=CAU',
                      ),
                      height: 80,
                      width: 120,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNGaADCkZwbprPNGJbt1CGk-_vCGUYe8eYWA&s',
                      ),
                      height: 80,
                      width: 120,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage(
                        'https://logomaster.ai/hs-fs/hubfs/silver-logo-nissan-1.jpg?width=1700&height=1148&name=silver-logo-nissan-1.jpg',
                      ),
                      height: 80,
                      width: 120,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage(
                        'https://dynamic.brandcrowd.com/asset/logo/ad66b265-4fc6-4552-acba-3a402853e98c/logo-search-grid-2x?logoTemplateVersion=1&v=638676060524570000',
                      ),
                      height: 80,
                      width: 120,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage(
                        'https://cdn.logojoy.com/wp-content/uploads/2018/08/23155513/18927550-1024x776.png',
                      ),
                      height: 80,
                      width: 120,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
