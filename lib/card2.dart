import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wale.webp'), // รูปสมูทตี้วาฬ
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            // ส่วนที่ 1: AuthorCard ที่สามารถเปลี่ยนสีหัวใจได้
            const AuthorCard(
              authorName: 'Puwanat P.',
              title: 'Lover of Whale Smoothies',
              imageProvider: AssetImage('assets/images/Dog.jpg'), // รูปโปรไฟล์
            ),
            
            // ส่วนที่ 2: ข้อความด้านล่าง
            Expanded(
              child: Stack(
                children: [
                  // คำว่า Whale Smoothies (แนวตั้ง)
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Whale Smoothies',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: const Color.fromARGB(221, 0, 0, 0),
                          fontSize: 32, // ปรับขนาดให้ใหญ่ตามดีไซน์
                        ),
                      ),
                    ),
                  ),
                  // คำว่า Recipe (ล่างขวา)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      'I want to swim with whales',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: const Color.fromARGB(221, 0, 0, 0),
                        fontSize: 16, // ปรับขนาดให้เหมาะสม
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// แยก Widget AuthorCard เป็น StatefulWidget เพื่อจัดการสถานะการกดหัวใจ
class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider imageProvider;

  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    required this.imageProvider,
  });

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  // สร้างตัวแปรเก็บสถานะการกด Favorite
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // กลุ่มด้านซ้าย: รูป + ชื่อ
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: widget.imageProvider,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.authorName,
                    style: const TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 14, 
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // กลุ่มด้านขวา: ไอคอนหัวใจที่เปลี่ยนสถานะได้
          IconButton(
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            // ถ้ากดแล้วให้เป็นสีแดง ถ้ายังไม่กดให้เป็นสีเทา
            color: _isFavorited ? Colors.red : Colors.grey,
            onPressed: () {
              // แจ้ง Flutter ให้วาด UI ใหม่เมื่อค่าเปลี่ยน
              setState(() {
                _isFavorited = !_isFavorited;
              });

              final message = _isFavorited ? 'Added to Favorites' : 'Removed from Favorites';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}