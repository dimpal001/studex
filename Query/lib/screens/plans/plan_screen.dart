import 'package:flutter/material.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Plans",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface, // Fixed
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              //
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildPlanCard(
                context,
                title: "Free Plan",
                price: "₹0",
                features: [
                  "10 Questions per Day",
                  "No Priority Support",
                  "No AI Enhancements"
                ],
                color: Theme.of(context).colorScheme.surface,
                onTap: () => _subscribeToPlan(context, "Free Plan"),
                isHideButton: true,
              ),
              _buildPlanCard(
                context,
                title: "Standard Plan",
                price: "₹199",
                features: [
                  "100 Questions per Day",
                  "Faster Responses",
                  "No AI Enhancements"
                ],
                color: Theme.of(context).colorScheme.surface,
                onTap: () => _subscribeToPlan(context, "Standard Plan"),
                isSolidButton: true,
              ),
              _buildPlanCard(
                context,
                title: "Premium Plan",
                price: "₹499",
                features: [
                  "Unlimited Questions",
                  "Fastest AI Responses",
                  "Priority Support"
                ],
                color: Theme.of(context).colorScheme.surface,
                onTap: () => _subscribeToPlan(context, "Premium Plan"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard(
    BuildContext context, {
    required String title,
    required String price,
    required List<String> features,
    required Color color,
    required VoidCallback onTap,
    bool isHideButton = false,
    bool isSolidButton = false,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Padding(
              padding: EdgeInsets.only(left: 0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: price,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: ' /month',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map((feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          children: [
                            Icon(Icons.check,
                                color: Theme.of(context).colorScheme.primary,
                                size: 18),
                            const SizedBox(width: 6),
                            Text(
                              feature,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 12),
            if (!isHideButton)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSolidButton
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    foregroundColor: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: !isSolidButton
                        ? BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1)
                        : null,
                  ),
                  child: Text("Subscribe",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSolidButton
                              ? Colors.white
                              : Theme.of(context).colorScheme.primary)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _subscribeToPlan(BuildContext context, String plan) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text("Subscribe to $plan",
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Do you want to proceed with this subscription?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                print("Subscribed to $plan");
              },
              child: const Text("Confirm",
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
