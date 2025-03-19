import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/confirm_modal.dart';
import 'package:my_flutter_app/screens/auth/login_screen.dart';
import 'package:my_flutter_app/screens/plans/plan_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullName = 'John Doe';
  bool isDarkMode = true;
  bool notificationsEnabled = true;
  final String appVersion = '1.0.0';
  String selectedClass = '10th';
  String selectedLanguage = 'English';
  List<String> selectedSubjects = ['Math', 'Science'];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? 'John Doe';
      selectedClass = prefs.getString('selectedClass') ?? '10th';
      selectedLanguage = prefs.getString('selectedLanguage') ?? 'English';
      selectedSubjects =
          prefs.getStringList('selectedSubjects') ?? ['Math', 'Science'];
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedClass', selectedClass);
    await prefs.setString('selectedLanguage', selectedLanguage);
    await prefs.setStringList('selectedSubjects', selectedSubjects);
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withAlpha(200),
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: "Logout",
          description: "Are you sure you want to log out?",
          variant: Colors.red,
          onConfirm: () => logout(context),
          confirmText: "Logout",
          cancelText: "Cancel",
        );
      },
    );
  }

  void _showAcademicOptions(BuildContext context, String type) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select $type',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              if (type == 'Class') _buildClassOptions(),
              if (type == 'Subjects') _buildSubjectsOptions(),
              if (type == 'Language') _buildLanguageOptions(),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    _saveData();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildClassOptions() {
    final List<String> classes = ['8th', '9th', '10th', '11th', '12th'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: classes.map((className) {
        final isSelected = selectedClass == className;
        return ChoiceChip(
          label: Text(className),
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              setState(() => selectedClass = className);
            }
          },
          selectedColor: Theme.of(context).colorScheme.primary,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
          ),
          backgroundColor: Colors.grey.withOpacity(0.2),
        );
      }).toList(),
    );
  }

  Widget _buildSubjectsOptions() {
    final List<String> availableSubjects = [
      'Math',
      'Science',
      'English',
      'History',
      'Geography',
      'Physics',
      'Chemistry'
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: availableSubjects.map((subject) {
        final isSelected = selectedSubjects.contains(subject);
        return ChoiceChip(
          label: Text(subject),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                selectedSubjects.add(subject);
              } else {
                selectedSubjects.remove(subject);
              }
            });
          },
          selectedColor: Theme.of(context).colorScheme.primary,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
          ),
          backgroundColor: Colors.grey.withOpacity(0.2),
        );
      }).toList(),
    );
  }

  Widget _buildLanguageOptions() {
    final List<String> languages = ['English', 'Hindi', 'Assamese', 'Bangali'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: languages.map((language) {
        final isSelected = selectedLanguage == language;
        return ChoiceChip(
          label: Text(language),
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              setState(() => selectedLanguage = language);
            }
          },
          selectedColor: Theme.of(context).colorScheme.primary,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
          ),
          backgroundColor: Colors.grey.withOpacity(0.2),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        actions: [
          IconButton(
              icon: const Icon(Icons.settings_outlined, size: 28),
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(180),
              onPressed: () {}),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        fullName[0].toUpperCase(),
                        style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fullName,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.school,
                                  color: Colors.grey, size: 18),
                              const SizedBox(width: 6),
                              Text(
                                'Class $selectedClass',
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildPremiumButton(context),
              const SizedBox(height: 24),
              Text("Academic Settings",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary)),
              const SizedBox(height: 12),
              _buildSettingsCard([
                _buildSettingItem(
                  "Change Class",
                  selectedClass,
                  icon: Icons.class_,
                  hasArrow: true,
                  onTap: () => _showAcademicOptions(context, 'Class'),
                ),
                _buildSettingItem(
                  "Manage Subjects",
                  selectedSubjects.join(', '),
                  icon: Icons.subject,
                  hasArrow: true,
                  onTap: () => _showAcademicOptions(context, 'Subjects'),
                ),
                _buildSettingItem(
                  "Prefered Language",
                  selectedLanguage,
                  icon: Icons.language,
                  hasArrow: true,
                  onTap: () => _showAcademicOptions(context, 'Language'),
                ),
              ]),
              const SizedBox(height: 24),
              Text("App Settings",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary)),
              const SizedBox(height: 12),
              _buildSettingsCard([
                _buildToggleItem("Dark Mode", isDarkMode,
                    (value) => setState(() => isDarkMode = value),
                    icon: Icons.dark_mode),
                _buildToggleItem("Notifications", notificationsEnabled,
                    (value) => setState(() => notificationsEnabled = value),
                    icon: Icons.notifications),
              ]),
              const SizedBox(height: 24),
              Text("Account",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary)),
              const SizedBox(height: 12),
              _buildSettingsCard([
                _buildSettingItem("Privacy Policy", null,
                    icon: Icons.lock_outline,
                    hasArrow: true,
                    onTap: () => launchUrl(Uri.parse('https://dimpaldas.in'))),
                _buildSettingItem("Terms of Service", null,
                    icon: Icons.description, hasArrow: true),
              ]),
              const SizedBox(height: 24),
              _buildLogoutButton(context),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'App Version: $appVersion',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingItem(String title, String? value,
      {required IconData icon, bool hasArrow = false, VoidCallback? onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withOpacity(0.1),
        highlightColor: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          leading: Icon(icon,
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(180),
              size: 24),
          title: Text(title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(140),
                  fontSize: 16)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value != null)
                Text(
                  value,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              if (hasArrow)
                const Icon(Icons.arrow_forward_ios,
                    color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleItem(String title, bool value, Function(bool) onChanged,
      {required IconData icon}) {
    return ListTile(
      leading: Icon(icon,
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(180),
          size: 24),
      title: Text(title,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(140),
              fontSize: 16)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: Theme.of(context).colorScheme.primary,
        activeColor: Theme.of(context).colorScheme.onPrimary,
        inactiveThumbColor: Colors.grey,
        inactiveTrackColor: Colors.grey.withOpacity(0.5),
      ),
    );
  }

  Widget _buildPremiumButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PlansScreen()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.black, size: 20),
            SizedBox(width: 8),
            Text(
              "Go to Premium Plans",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.red, width: 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.red.withOpacity(0.1),
        ),
        onPressed: () => _showLogoutConfirmation(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.logout, color: Colors.red, size: 20),
            SizedBox(width: 8),
            Text(
              "Log Out",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
