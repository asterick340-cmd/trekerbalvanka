import 'package:flutter/material.dart';
import '../utils/colors_app.dart';
import '../utils/style.dart';

class StatsTabView extends StatelessWidget {
  const StatsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final days = <DayStats>[
      DayStats(date: '07 декабря', ordersCount: 16, totalSum: '2 900 ₽', orders: _sampleOrders()),
      DayStats(date: '06 декабря', ordersCount: 16, totalSum: '2 900 ₽', orders: _sampleOrders()),
      DayStats(date: '05 декабря', ordersCount: 16, totalSum: '2 900 ₽', orders: _sampleOrders()),
      DayStats(date: '04 декабря', ordersCount: 16, totalSum: '2 900 ₽', orders: _sampleOrders()),
      DayStats(date: '03 декабря', ordersCount: 16, totalSum: '2 900 ₽', orders: _sampleOrders()),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final day in days) ...[
          _DayBlock(day: day),
          const SizedBox(height: 32),
        ],
      ],
    );
  }

  List<Order> _sampleOrders() {
    return [
      Order(
        time: '16:21 - 00:00',
        sum: '290 ₽',
        address: 'Нахимовский проспект, д.29, кв.55',
        first: true,
      ),
      Order(
        time: '14:02 - 15:40',
        sum: '290 ₽',
        address: 'Нахимовский проспект, д.29, кв.55',
      ),
      Order(
        time: '11:15 - 12:30',
        sum: '290 ₽',
        address: 'Нахимовский проспект, д.29, кв.55',
      ),
    ];
  }
}

class _DayBlock extends StatelessWidget {
  final DayStats day;
  const _DayBlock({required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(day.date, style: AppText.dayDate),
        const SizedBox(height: 4),
        Text('${day.ordersCount} заказов, ${day.totalSum}',
            style: AppText.daySummary),
        const SizedBox(height: 16),
        Column(
          children: [
            for (final order in day.orders) ...[
              _OrderCard(order: order),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ],
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Order order;
  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 37,
            height: 37,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.purpleLight, width: 3),
            ),
            child: Icon(
              Icons.check,
              size: 16,
              color: order.first ? AppColors.purpleLight : Colors.white,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order.time, style: AppText.orderTime),
                const SizedBox(height: 4),
                Text(order.address, softWrap: true, style: AppText.orderAddress),
              ],
            ),
          ),
          Text(order.sum, style: AppText.orderSum),
          const SizedBox(width: 8),
          const Icon(Icons.more_horiz, color: AppColors.textGrey, size: 20),
        ],
      ),
    );
  }
}

class DayStats {
  final String date;
  final int ordersCount;
  final String totalSum;
  final List<Order> orders;

  DayStats({
    required this.date,
    required this.ordersCount,
    required this.totalSum,
    required this.orders,
  });
}

class Order {
  final String time;
  final String sum;
  final String address;
  final bool first;

  Order({
    required this.time,
    required this.sum,
    required this.address,
    this.first = false,
  });
}