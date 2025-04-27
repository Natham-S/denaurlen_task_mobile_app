import 'package:denaurlen_task/widgets/coinValidateScreen/PostInteractions.dart';
import 'package:flutter/material.dart';

import '../Services/ApiService.dart';
import '../models/PostData.dart';
import '../widgets/coinValidateScreen/CountdownTimerWidget.dart';
import '../widgets/coinValidateScreen/LeadButton.dart';
import '../widgets/coinValidateScreen/LogoutBtn.dart';


class CoinValuationScreen extends StatefulWidget {
  final String username;
  const CoinValuationScreen({Key? key, required this.username}) : super(key: key);

  @override
  _CoinValuationScreenState createState() => _CoinValuationScreenState();
}

class _CoinValuationScreenState extends State<CoinValuationScreen> {
  PostData? postData;
  bool isLoading = false; 

  @override
  void initState() {
    super.initState();
    fetchPostData();
  }

  Future<void> fetchPostData() async {
    try {
      final fetchedData = await ApiService.fetchPostData();
      setState(() {
        postData = fetchedData;
      });
    } catch (e) {
      print('Failed to fetch post data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load post data')),
      );
    }
  }

  Future<void> handleLeadButton() async {
    setState(() {
      isLoading = true;
    });

    try {
      await ApiService.performLead(widget.username);
      await fetchPostData();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to lead: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Duration calculateRemainingTime(DateTime createdAt) {
    final endTime = createdAt.add(const Duration(hours: 144));
    final now = DateTime.now();
    final remaining = endTime.difference(now);

    if (remaining.isNegative) {
      return Duration.zero;
    } else {
      return remaining;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (postData == null) {
      return Scaffold(
        body: const Center(child: Text("There is no post Data, try again")),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/user-profile.jpg"),
                          ),
                          const SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.username, style: theme.textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.secondary)),
                              const SizedBox(height: 2),
                              Text("6 June 2021, 12:10 pm", style: theme.textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSecondary)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/icons/coins.png'),
                                  Text(postData!.grossCoins.toString(), style: theme.textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.secondary)),
                                ],
                              ),
                              Text("Gross Coins", style: theme.textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.onSecondary)),
                            ],
                          ),
                          const SizedBox(width: 4),
                          Image.asset('assets/icons/grow.png'),
                          const SizedBox(width: 4),
                          LogOutBtn()
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Image.asset('assets/images/post.jpg'),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PostInteractions(),
                      LeadButton(
                        isLoading: isLoading,
                        onPressed: handleLeadButton,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Lead Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/lead-profile.jpg"),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/icons/coins.png'),
                                  const SizedBox(width: 4),
                                  Text(postData!.netCoins.toString(), style: theme.textTheme.headlineMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.secondary)),
                                  const SizedBox(width: 4),
                                  Image.asset('assets/icons/grow.png'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(postData!.leadUser, style: theme.textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.secondary)),
                                  Text(" in Lead", style: theme.textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.onSecondary)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      CountdownTimerWidget(
                        initialDuration: calculateRemainingTime(postData!.createdAt),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "@${widget.username} "
                        "If everything seems under control, you're going fast enough. Be Fast, Be Curious..! 😎",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
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
