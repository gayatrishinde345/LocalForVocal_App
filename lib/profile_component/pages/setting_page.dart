import 'package:flutter/material.dart';
import 'package:vocal4local/component/appbar.dart';
import 'package:vocal4local/constant/app_color.dart';
import 'package:vocal4local/profile_component/pages/cms_page.dart';
import 'package:vocal4local/profile_component/pages/contact_us_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, this.onSettingSelected}) : super(key: key);
  final Function(Widget)? onSettingSelected;
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final items = [
      _SettingItem("About Us", Icons.info_outline, const AboutUsPage()),
      _SettingItem(
        "Privacy Policy",
        Icons.privacy_tip_outlined,
        const PrivacyPolicyPage(),
      ),
      _SettingItem(
        "Terms & Conditions",
        Icons.description_outlined,
        const TermsConditionsPage(),
      ),
      _SettingItem("Contact Us", Icons.email_outlined, const ContactUsPage()),
    ];
 return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      appBar: CustomAppBar(title: 'Settings'),    
      
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item.page),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _SettingCard(item: item),
            ),
          );
        },
      ),
    );
  }
}

class _SettingItem {
  final String title;
  final IconData icon;
  final Widget page;

  _SettingItem(this.title, this.icon, this.page);
}

class _SettingCard extends StatefulWidget {
  final _SettingItem item;

  const _SettingCard({required this.item});

  @override
  State<_SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<_SettingCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        // onTap: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => widget.item.page),
        // ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isHovered ? Colors.blue[50] :Theme.of(context).colorScheme.primaryContainer, //Color(0xFFF5F6F9),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: isHovered ? 8 : 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            children: [
              Icon(widget.item.icon, color: AppColor.primaryColor, size: 28),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  widget.item.title,
                  style:  Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  // const TextStyle(
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.w500,
                  //   color: Color(0xFF757575),
                  // ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
