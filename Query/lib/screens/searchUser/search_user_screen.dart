import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/constants/api.dart';
import 'package:my_flutter_app/constants/api_headers.dart';
import 'dart:convert';
import 'package:my_flutter_app/constants/bottom_nav_bar.dart';
import 'package:my_flutter_app/screens/searchUser/user_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        title: Row(
          children: [
            Icon(Icons.search,
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(170)),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.onPrimary.withAlpha(170)),
                decoration: InputDecoration(
                  hintText: 'Search users...',
                  hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(170)),
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
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(170),
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
        child: Skeletonizer(
          enabled: _isLoading,
          child: ListView.builder(
            itemCount: _isLoading ? 4 : _filteredUsers.length,
            itemBuilder: (context, index) {
              if (_isLoading) {
                return Container(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey[300],
                        ),
                        title: Container(
                          width: double.infinity,
                          height: 10,
                          color: Colors.grey[300],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4),
                            Container(
                              width: 100,
                              height: 8,
                              color: Colors.grey[300],
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: 50,
                              height: 8,
                              color: Colors.grey[300],
                            ),
                          ],
                        ),
                        trailing: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ));
              }

              // Show actual user data
              final user = _filteredUsers[index];
              final status = user['status'] ?? 'Follow';
              return UserCard(user: user, status: status);
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }
}
