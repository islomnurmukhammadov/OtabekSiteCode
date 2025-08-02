import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 10),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0.3),
              centerTitle: true,
              title: Text(
                "OTABEK RAVSHANOV",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile ? 16 : 22,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF6F9FC), Color(0xFFE6EEF3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: isMobile ? 120 : 160, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _glassCard(
                  isMobile: isMobile,
                  title: "MEN HAQIMDA",
                  child: Text(
                    "Otabek Ravshanov - 6 yillik tajribaga ega Kompyuter muhandisi. Web dizayn va UI/UX dizayn sohalarida faoliyat yuritaman. 2 yildan beri xalqaro export bilan shug'ullanaman. Maqsadim - yangi tajribalar orttirish va innovatsion loyihalarda ishtirok etish.",
                    style: GoogleFonts.afacad(fontSize: 17),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "YO'NALISHLAR",
                  style: GoogleFonts.montserrat(
                    fontSize: isMobile ? 22 : 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      _skillCard("Web dizayn", isMobile, context),
                      _skillCard("UI/UX dizayn", isMobile, context),
                      _skillCard("Kompyuter Muhandisligi", isMobile, context),
                      _skillCard("Telefon mutahasisligi", isMobile, context),
                      _skillCard("Web-sayt yaratish", isMobile, context),
                      _skillCard("Xalqaro export", isMobile, context),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "ALOQA",
                  style: GoogleFonts.montserrat(
                    fontSize: isMobile ? 22 : 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 30,
                  alignment: WrapAlignment.center,
                  children: [
                    _contactIcon(
                      icon: Icons.telegram,
                      label: "Telegram",
                      url:
                          "https://t.me/otabek_avazbekovich", // O'zingizga moslashtiring
                    ),
                    _contactIcon(
                      icon: FontAwesomeIcons.instagram,
                      label: "Instagram",
                      url: "https://instagram.com/otabe_ravshanov",
                    ),
                    _contactIcon(
                      icon: Icons.phone,
                      label: "Telefon",
                      url: "tel:++998880016777",
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  "Otabek Ravshanov ©️. All rights reserved.",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _glassCard({
    required bool isMobile,
    required String title,
    required Widget child,
  }) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            width: isMobile ? double.infinity : 700,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.35),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white.withOpacity(0.4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _skillCard(String skillName, bool isMobile, BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showSkillDialog(context, skillName, _getSkillDescription(skillName));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 14 : 20,
          vertical: isMobile ? 10 : 14,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Text(
          skillName,
          style: GoogleFonts.montserrat(
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  void _showSkillDialog(
    BuildContext context,
    String title,
    String description,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white.withOpacity(0.95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          title,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        content: Text(description, style: GoogleFonts.afacad(fontSize: 17)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Yopish", style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  String _getSkillDescription(String skill) {
    switch (skill) {
      case 'Web dizayn':
        return 'Zamonaviy dizayn printsiplari asosida web interfeyslar chizaman.';
      case 'UI/UX dizayn':
        return 'Photoshop, Adobe XD va boshqa vositalar orqali professional foydalanuvchi interfeysi ishlab chiqaman.';
      case 'Kompyuter Muhandisligi':
        return "Kompyuter texnologiyalari, tarmoq, apparat va dasturiy ta’minot bilan ishlayman. Bu bo'yicha 6 yillik tajribaga egaman.";
      case 'Telefon mutahasisligi':
        return "Telefonlarni dasturiy va texnik jihatdan tuzatish, texnik ko‘rik bo'yicha 5 yillik tajribaga egaman.";
      case 'Web-sayt yaratish':
        return 'HTML, CSS, JS orqali funksional va zamonaviy saytlar yarataman.';
      case 'Xalqaro export':
        return 'Xalqaro savdo, eksport bo‘yicha 2 yillik tajriba va xalqaro hamkorlik.';
      default:
        return 'Bu yo‘nalish haqida batafsil ma’lumot yo‘q.';
    }
  }

  Widget _contactIcon({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return InkWell(
      onTap: () => launchUrlString(url),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Icon(icon, size: 28, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
