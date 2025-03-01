import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/api_headers.dart';
import 'dart:convert';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/constants/bottom_nav_bar.dart';
import 'package:my_flutter_app/screens/searchUser/userScreen/user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchUsersScreen extends StatefulWidget {
  const SearchUsersScreen({super.key});

  @override
  _SearchUsersScreenState createState() => _SearchUsersScreenState();
}

class _SearchUsersScreenState extends State<SearchUsersScreen> {
  List<dynamic> _filteredUsers = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _filteredUsers = [];
    _searchController.addListener(_onSearchChanged);
    _fetchUsers('');
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _fetchUsers(_searchController.text);
    });
  }

  Future<void> _fetchUsers(String query) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    setState(() => _isLoading = true);

    // Only make API call if query is not empty
    if (query.isNotEmpty) {
      final url =
          Uri.parse('$baseUrl/friend/search-user?query=$query&userId=$userId');
      final headers = await getCustomHeaders();
      try {
        final response = await http.get(
          url,
          headers: headers,
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data['success']) {
            setState(() => _filteredUsers = data['users']);
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching users: $e')),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    } else {
      // Clear the list when query is empty
      setState(() {
        _filteredUsers = [];
        _isLoading = false;
      });
    }
  }

  void _clearSearch() {
    _searchController.clear();
    _fetchUsers('');
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Widget _buildSkeletonLoader() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Card(
          color: AppColors.foreground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(radius: 30, backgroundColor: Colors.grey[300]),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 20, width: 150, color: Colors.grey[300]),
                      const SizedBox(height: 6),
                      Container(
                          height: 14, width: 100, color: Colors.grey[300]),
                      const SizedBox(height: 6),
                      Container(height: 12, width: 80, color: Colors.grey[300]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.foreground,
        title: Row(
          children: [
            Icon(Icons.search, color: Colors.white70),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search users...',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: _searchController,
            builder: (context, value, child) {
              final isTextEmpty = value.text.isEmpty;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: IconButton(
                    key: ValueKey(isTextEmpty ? 'more_vert' : 'close'),
                    icon: Icon(
                      isTextEmpty ? Icons.more_vert : Icons.close,
                      color: Colors.white70,
                    ),
                    onPressed: isTextEmpty ? null : _clearSearch,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: _isLoading
            ? _buildSkeletonLoader()
            : ListView.builder(
                itemCount: _filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = _filteredUsers[index];
                  final status = user['status'] ?? 'Follow';
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Card(
                      color: AppColors.foreground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserProfileScreen(
                                userName: user['fullName'],
                                userEmail:
                                    "${user['fullName'].toLowerCase().replaceAll(' ', '')}@example.com",
                                profileImage: user['profileUrl'] ??
                                    "https://via.placeholder.com/150",
                                bio: user['bio'] ?? 'No bio available',
                                followers: 1200, // Add real data if available
                                following: 500,
                                posts: 25,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: user['profileUrl'] != null
                                    ? NetworkImage(user['profileUrl'])
                                    : null,
                                child: user['profileUrl'] == null
                                    ? Text(
                                        user['fullName'][0],
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user['fullName'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      user['class']['name'],
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Text(
                                          "1.2K Followers", // Add real data if available
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary
                                                .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            "75% Progress", // Dummy data
                                            style: const TextStyle(
                                              color: AppColors.primary,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              _buildStatusButton(status),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }

  Widget _buildStatusButton(String status) {
    switch (status) {
      case 'Friend':
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: AppColors.primary,
          ),
          child: Text('Friend', style: TextStyle(color: AppColors.white)),
        );
      case 'Requested':
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary.withOpacity(0.1),
          ),
          child: Text('Following', style: TextStyle(color: AppColors.primary)),
        );
      case 'Accept':
        return ElevatedButton(
          onPressed: () {}, // Add accept logic
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: Text('Accept', style: TextStyle(color: Colors.white)),
        );
      case 'Follow':
      default:
        return ElevatedButton(
          onPressed: () {}, // Add follow logic
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: AppColors.primary),
            ),
          ),
          child: Text('Follow', style: TextStyle(color: AppColors.primary)),
        );
    }
  }
}
