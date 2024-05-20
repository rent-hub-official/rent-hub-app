import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class ProductCardWidget extends StatelessWidget {
  final String productName;
  final double price;
  final String productLocation;
  final double destance;

  const ProductCardWidget({
    super.key,
    required this.productName,
    required this.price,
    required this.productLocation,
    required this.destance,
  });

  @override
  Widget build(BuildContext context) {
    final apptheme = AppTheme.of(context);

    return InkWell(
      onTap: () {
        log('message');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: apptheme.colors.cardBackground,
        ),
        width: double.infinity,
        // height: 200,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                  color: apptheme.colors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(14),
                  ),
                ),
                child: const Center(
                    child: Text(
                  'Rent Now',
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity, // Corrected MediaQuery usage
                        height: 120,

                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://static.autox.com/uploads/2022/06/Mahindra-Scorpio-N.jpg'),
                              fit: BoxFit.cover),
                          boxShadow: const [
                            BoxShadow(),
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 8,
                              left: 8,
                              child: CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.white.withOpacity(0.3),
                                child: const Icon(Icons.favorite),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'datahgdhsldkdodghfjkbnbgcxdzaghkkhj',
                                    style: apptheme.typography.h3SemiBold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  '${'price'}/perDay',
                                  style: apptheme.typography.bodyLargeSemiBold,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.place,
                                size: 16,
                              ),
                              Text(
                                'Kannur, Kerala',
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, top: 5),
                                child: Text(
                                  '10KM farAway',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ],
                      )
                    ],
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
