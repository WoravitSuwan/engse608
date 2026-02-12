import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              const Text(
                "Material Components",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Interactive widget showcase",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30),

              Expanded(
                child: ListView(
                  children: [
                    buildMenu(
                      context,
                      "Navigation",
                      "AppBar • NavigationBar",
                      Icons.explore_rounded,
                      const Color(0xff344e41),
                      "/navigation",
                    ),
                    buildMenu(
                      context,
                      "Actions",
                      "Buttons • FAB • IconButton",
                      Icons.flash_on_rounded,
                      const Color(0xff6d597a),
                      "/actions",
                    ),
                    buildMenu(
                      context,
                      "Communication",
                      "SnackBar • Dialog",
                      Icons.forum_rounded,
                      const Color(0xff588157),
                      "/communication",
                    ),
                    buildMenu(
                      context,
                      "Containment",
                      "Card • Container",
                      Icons.layers_rounded,
                      const Color(0xffbc6c25),
                      "/containment",
                    ),
                    buildMenu(
                      context,
                      "Selection",
                      "Checkbox • Radio • Switch",
                      Icons.tune_rounded,
                      const Color(0xff3a5a40),
                      "/selection",
                    ),
                    buildMenu(
                      context,
                      "Text Inputs",
                      "Form • TextField",
                      Icons.edit_note_rounded,
                      const Color(0xff355070),
                      "/textinput",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenu(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color accent,
    String route,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => Navigator.pushNamed(context, route),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 8),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: accent.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: accent),
                ),
                const SizedBox(width: 18),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.black38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
