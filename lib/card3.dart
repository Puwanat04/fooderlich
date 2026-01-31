import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wale.webp'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.book, color: Colors.white, size: 40),
              const SizedBox(height: 8),
              Text(
                'Manu is My Love',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 16),
              
              // ใช้ Wrap เพื่อจัดวางปุ่ม Chip
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  HoverChip(label: 'Lovely'),
                  HoverChip(label: 'Healthy'),
                  HoverChip(label: 'Careful'),
                  HoverChip(label: 'ForU'),
                  HoverChip(label: 'OnlyU'),
                  HoverChip(label: 'Marry'),
                  HoverChip(label: 'Pretty'),
                  HoverChip(label: 'MissingU'),
                  HoverChip(label: 'MyLove'),
                  HoverChip(label: 'GoingMyWay'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// สร้าง Widget แยกสำหรับ Chip ที่สามารถเปลี่ยนสีเมื่อเมาส์ชี้ได้
class HoverChip extends StatefulWidget {
  final String label;
  const HoverChip({super.key, required this.label});

  @override
  State<HoverChip> createState() => _HoverChipState();
}

class _HoverChipState extends State<HoverChip> {
  // ตัวแปรเก็บสถานะว่าเมาส์ชี้อยู่หรือไม่
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // เมื่อเมาส์เข้ามาในเขตของ Chip
      onEnter: (_) => setState(() => _isHovered = true),
      // เมื่อเมาส์ออกจากเขตของ Chip
      onExit: (_) => setState(() => _isHovered = false),
      child: Chip(
        label: Text(widget.label),
        // เปลี่ยนสีพื้นหลัง: ถ้าชี้อยู่เป็นสีเขียว (หรือสีที่คุณชอบ) ถ้าปกติเป็นสีเทาเข้ม
        backgroundColor: _isHovered ? const Color.fromARGB(255, 255, 150, 250) : Colors.black54,
        labelStyle: const TextStyle(color: Colors.white),
        // เพิ่มเส้นขอบให้นิดหน่อยตอนชี้จะดูสวยขึ้นครับ
        side: BorderSide(
          color: _isHovered ? Colors.white : Colors.transparent,
          width: 1,
        ),
      ),
    );
  }
}