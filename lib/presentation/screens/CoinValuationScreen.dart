import 'package:flutter/material.dart';

import '../../models/PostData.dart';
import '../../network/ApiService.dart';

import '../widgets/coinValidateScreen/CountdownTimerWidget.dart';
import '../widgets/coinValidateScreen/GrossCoins.dart';
import '../widgets/coinValidateScreen/LeadButton.dart';
import '../widgets/coinValidateScreen/LeadUserInfo.dart';
import '../widgets/coinValidateScreen/LogoutBtn.dart';
import '../widgets/coinValidateScreen/PostDescription.dart';
import '../widgets/coinValidateScreen/PostInteractions.dart';
import '../widgets/coinValidateScreen/PostUserInfo.dart';


class CoinValuationScreen extends StatefulWidget {
  final String username;
  const CoinValuationScreen({super.key, required this.username});

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
    if (postData == null) {
      return Scaffold(
        body: const Center(child: Column(
          children: [
            CircularProgressIndicator(),
            Text("There is no post Data, try again"),
          ],
        )),
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
                      PostUserInfo(username: widget.username),
                      Row(
                        children: [
                          GrossCoins(grossCoins: postData!.grossCoins),
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
                      LeadButton(isLoading: isLoading, onPressed: handleLeadButton),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Lead Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LeadUserInfo(
                        netCoins: postData!.netCoins,
                        leadUser: postData!.leadUser,
                      ),
                      CountdownTimerWidget(
                        initialDuration: calculateRemainingTime(postData!.createdAt),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  PostDescription(username: widget.username)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
