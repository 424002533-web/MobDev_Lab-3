import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const IFoundApp());
}

const Color primaryColor = Color(0xFF176B87);
const Color secondaryColor = Color(0xFF64CCC5);
const Color backgroundColor = Color(0xFFF4F8FB);

class IFoundApp extends StatelessWidget {
  const IFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I-Found',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: Color(0xFF123047),
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE1EAF0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: primaryColor, width: 1.5),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// Reusable widgets ------------------------------------------------------------

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon ?? Icons.arrow_forward),
        label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(subtitle!, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ],
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.13),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 14),
            Text(value,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text(title, style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}

class FeatureShortcut extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const FeatureShortcut({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE5F4F5),
          child: Icon(icon, color: primaryColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

// Screen 1: Login --------------------------------------------------------------

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 25),
                  const CircleAvatar(
                    radius: 48,
                    backgroundColor: primaryColor,
                    child: Icon(Icons.search, color: Colors.white, size: 52),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'I-FOUND',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Lost something? Find it here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 38),
                  const Text('Welcome Back',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Log in to your I-Found account.',
                      style: TextStyle(color: Colors.grey.shade600)),
                  const SizedBox(height: 22),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Email or Username',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => hidePassword = !hidePassword),
                        icon: Icon(hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(label: 'Login', onPressed: login),
                  const SizedBox(height: 14),
                  Text(
                    'UI prototype only — any input will open the dashboard.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Screen 2: Dashboard ----------------------------------------------------------

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void open(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I-Found'),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications.')),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          const Text('Hello, User!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text('Let’s help reunite people with their belongings.',
              style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 22),
          const SectionTitle(
              title: 'Community Overview',
              subtitle: 'Sample statistics for the UI prototype'),
          const SizedBox(height: 12),
          Row(
            children: const [
              SummaryCard(
                title: 'Lost Items',
                value: '12',
                icon: Icons.search,
                color: Color(0xFFE89B35),
              ),
              SizedBox(width: 12),
              SummaryCard(
                title: 'Found Items',
                value: '08',
                icon: Icons.inventory_2_outlined,
                color: Color(0xFF219A83),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SectionTitle(
              title: 'Quick Access', subtitle: 'Choose what you want to do'),
          const SizedBox(height: 10),
          FeatureShortcut(
            title: 'Report a Lost Item',
            subtitle: 'Submit details about an item you lost',
            icon: Icons.add_circle_outline,
            onTap: () => open(context, const ReportLostItemScreen()),
          ),
          FeatureShortcut(
            title: 'Browse Found Items',
            subtitle: 'View items reported as found',
            icon: Icons.inventory_2_outlined,
            onTap: () => open(context, const FoundItemsScreen()),
          ),
          FeatureShortcut(
            title: 'My Profile',
            subtitle: 'View your account and settings',
            icon: Icons.person_outline,
            onTap: () => open(context, const ProfileScreen()),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE5F4F5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: primaryColor, size: 28),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'For safety, verify ownership before claiming an item at the Barangay Hall.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            open(context, const FoundItemsScreen());
          } else if (index == 2) {
            open(context, const ProfileScreen());
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined), label: 'Found Items'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

// Screen 3: Report Lost Item ---------------------------------------------------

class ReportLostItemScreen extends StatefulWidget {
  const ReportLostItemScreen({super.key});

  @override
  State<ReportLostItemScreen> createState() => _ReportLostItemScreenState();
}

class _ReportLostItemScreenState extends State<ReportLostItemScreen> {
  final formKey = GlobalKey<FormState>();
  final itemController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  String category = 'Personal Belongings';
  DateTime? dateLost;

  @override
  void dispose() {
    itemController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Future<void> chooseDate() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (selected != null) setState(() => dateLost = selected);
  }

  void submitReport() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sample report submitted successfully!'),
        ),
      );
      formKey.currentState!.reset();
      itemController.clear();
      descriptionController.clear();
      locationController.clear();
      setState(() {
        category = 'Personal Belongings';
        dateLost = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report a Lost Item')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SectionTitle(
              title: 'Lost Item Details',
              subtitle: 'Provide information to help identify your item.',
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: itemController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                hintText: 'e.g. Black wallet',
                prefixIcon: Icon(Icons.inventory_2_outlined),
              ),
              validator: (value) =>
                  value == null || value.trim().isEmpty
                      ? 'Please enter the item name'
                      : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: category,
              decoration: const InputDecoration(
                labelText: 'Category',
                prefixIcon: Icon(Icons.category_outlined),
              ),
              items: const [
                DropdownMenuItem(
                    value: 'Personal Belongings',
                    child: Text('Personal Belongings')),
                DropdownMenuItem(value: 'Electronics', child: Text('Electronics')),
                DropdownMenuItem(value: 'Documents', child: Text('Documents')),
                DropdownMenuItem(value: 'Accessories', child: Text('Accessories')),
                DropdownMenuItem(value: 'Other', child: Text('Other')),
              ],
              onChanged: (value) =>
                  setState(() => category = value ?? category),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Describe the item, color, brand, or unique marks',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.description_outlined),
              ),
              validator: (value) =>
                  value == null || value.trim().isEmpty
                      ? 'Please describe the item'
                      : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: 'Last Seen Location',
                hintText: 'e.g. Near Barangay Hall',
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              validator: (value) =>
                  value == null || value.trim().isEmpty
                      ? 'Please enter the last seen location'
                      : null,
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: chooseDate,
              icon: const Icon(Icons.calendar_month),
              label: Text(dateLost == null
                  ? 'Select Date Lost'
                  : 'Date Lost: ${dateLost!.month}/${dateLost!.day}/${dateLost!.year}'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Submit Lost Item Report',
              icon: Icons.send,
              onPressed: submitReport,
            ),
            const SizedBox(height: 12),
            Text(
              'Prototype notice: this form only demonstrates the interface. It does not save data to a database.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 4: Browse Found Items -----------------------------------------------

class FoundItemsScreen extends StatefulWidget {
  const FoundItemsScreen({super.key});

  @override
  State<FoundItemsScreen> createState() => _FoundItemsScreenState();
}

class _FoundItemsScreenState extends State<FoundItemsScreen> {
  final searchController = TextEditingController();
  String searchText = '';

  final List<Map<String, String>> foundItems = const [
    {
      'name': 'Black Wallet',
      'category': 'Personal Belongings',
      'location': 'Near Barangay Hall',
      'date': 'November 18, 2026',
      'description': 'A black wallet with cards inside.'
    },
    {
      'name': 'USB Flash Drive',
      'category': 'Electronics',
      'location': 'Community Center',
      'date': 'November 16, 2026',
      'description': 'A small blue USB flash drive.'
    },
    {
      'name': 'Student ID',
      'category': 'Documents',
      'location': 'Main Street',
      'date': 'November 14, 2026',
      'description': 'An identification card was turned in.'
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = foundItems.where((item) {
      return item['name']!.toLowerCase().contains(searchText.toLowerCase()) ||
          item['category']!.toLowerCase().contains(searchText.toLowerCase()) ||
          item['location']!.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Browse Found Items')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionTitle(
            title: 'Found Items',
            subtitle: 'Browse items turned in by the community.',
          ),
          const SizedBox(height: 16),
          TextField(
            controller: searchController,
            onChanged: (value) => setState(() => searchText = value),
            decoration: InputDecoration(
              hintText: 'Search item, category, or location',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () {
                  searchController.clear();
                  setState(() => searchText = '');
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('Recently Reported',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text('${filteredItems.length} items',
                  style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
          const SizedBox(height: 10),
          if (filteredItems.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Text('No matching items found.',
                  textAlign: TextAlign.center),
            ),
          ...filteredItems.map(
            (item) => Card(
              elevation: 0,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xFFE5F4F5),
                          child: Icon(Icons.inventory_2_outlined,
                              color: primaryColor),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(item['name']!,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ),
                        const Icon(Icons.verified_user_outlined,
                            color: Color(0xFF219A83)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(item['description']!),
                    const Divider(height: 22),
                    Text('Category: ${item['category']}'),
                    const SizedBox(height: 4),
                    Text('Location: ${item['location']}'),
                    const SizedBox(height: 4),
                    Text('Date Found: ${item['date']}'),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(item['name']!),
                              content: Text(
                                'If this item belongs to you, visit the Barangay Hall and provide details that can verify your ownership.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.info_outline),
                        label: const Text('View Details'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Screen 5: Profile / Settings -----------------------------------------------

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xFFE5F4F5),
                  child: Icon(Icons.person, size: 52, color: primaryColor),
                ),
                SizedBox(height: 14),
                Text('Juan Dela Cruz',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('juan.delacruz@email.com',
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 10),
                Chip(
                  avatar: Icon(Icons.verified, size: 17, color: primaryColor),
                  label: Text('Community Member'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SectionTitle(title: 'Account Information'),
          const SizedBox(height: 10),
          Card(
            elevation: 0,
            color: Colors.white,
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.person_outline, color: primaryColor),
                  title: Text('Full Name'),
                  subtitle: Text('Juan Dela Cruz'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.email_outlined, color: primaryColor),
                  title: Text('Email Address'),
                  subtitle: Text('juan.delacruz@email.com'),
                ),
                Divider(height: 1),
                ListTile(
                  leading:
                      Icon(Icons.location_on_outlined, color: primaryColor),
                  title: Text('Community'),
                  subtitle: Text('Barangay 650, Tondo, Manila'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SectionTitle(title: 'Settings'),
          const SizedBox(height: 10),
          Card(
            elevation: 0,
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: const Text('Notifications'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () =>
                      showMessage(context, 'Notification settings selected.'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Privacy and Security'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () =>
                      showMessage(context, 'Privacy settings selected.'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('Help and Support'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => showMessage(context, 'Help and Support selected.'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout, color: Colors.red),
            label: const Text('Log Out', style: TextStyle(color: Colors.red)),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              side: const BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ],
      ),
    );
  }
}
