import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/ads/domain/model/timetime_history_model.dart';

class TimeLineHistoryWidget extends StatelessWidget {
  const TimeLineHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<TimelineEvent> timelineEvents = [
      TimelineEvent(
          title: "Order Placed",
          date: "02/06/2024",
          period: "For 03/06/2024 to 06/06/2024"),
      TimelineEvent(
          title: "Payment Successfull", date: "02/06/2024", period: ''),
      TimelineEvent(
          title: "Order confirmed by Owner", date: "04/06/2024", period: ""),
      TimelineEvent(
          title: "Service Successfull", date: "08/06/2024", period: ""),
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final event = timelineEvents[index];

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // dot indicator
              index == 3
                  ? Stack(
                      children: [
                        SizedBox(
                          height: context.spaces.space_500,
                        ),
                        Positioned(
                          right: context.spaces.space_25 * 2.3,
                          child: Container(
                            width: 2.5,
                            height: context.spaces.space_150,
                            color: index == 0
                                ? Colors.green
                                : context.colors.textSubtle,
                          ),
                        ),
                        CircleAvatar(
                          radius: context.spaces.space_25 * 3,
                          backgroundColor: index == 0 || index == 1
                              ? Colors.green
                              : context.colors.secondary,
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        SizedBox(
                          height: context.spaces.space_500,
                        ),
                        Positioned(
                          right: context.spaces.space_25 * 2.3,
                          child: Container(
                            width: 2.5,
                            height: context.spaces.space_500,
                            color: index == 0
                                ? Colors.green
                                : context.colors.textSubtle,
                          ),
                        ),
                        CircleAvatar(
                          radius: context.spaces.space_25 * 3,
                          backgroundColor: index == 0 || index == 1
                              ? Colors.green
                              : context.colors.secondary,
                        ),
                      ],
                    ),
              // width spacer
              SizedBox(
                width: context.spaces.space_100,
              ),
              // contents
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title text
                      Text(
                        event.title,
                        style: context.typography.body,
                      ),
                      // date text
                      Text(
                        ' on ',
                        style: context.typography.bodySmall,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        event.date ?? '',
                        style: context.typography.bodySmall,
                      )
                    ],
                  ),
                  // period text
                  Text(event.period!, style: context.typography.bodySmall),
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // width spacer
            SizedBox(
              width: context.spaces.space_25 * 2.4,
            ),
            // line
            Container(
              width: 2.5,
              height: context.spaces.space_200,
              color: index == 0 ? Colors.green : context.colors.textSubtle,
            ),
          ],
        ),
        itemCount: timelineEvents.length,
      ),
    );
  }
}
