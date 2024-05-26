import 'package:ag/order.dart';
import 'package:ag/date.dart';
import 'package:ag/order_item.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final orderTimelines = ['Processing', 'Picking', 'Shipping', 'Delivering'];
    int activeStep = 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          EasyStepper(
            activeStep: activeStep,
            //  lineLength: 70,
            //  lineSpace: 0,
            //  defaultLineColor: Colors.grey.shade300,
            // finishedLineColor: theme.colorScheme.primary,
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: Colors.black87,
            internalPadding: 0,
            showLoadingAnimation: true,
            stepRadius: 8,
            // lineThickness: 1.5,
            steps: List.generate(orderTimelines.length, (index) {
              return EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: activeStep > index
                      ? theme.colorScheme.primary.withOpacity(0.5)
                      : Colors.grey.shade400,
                  child: CircleAvatar(
                    radius: 2.5,
                    backgroundColor: activeStep > index
                        ? theme.colorScheme.primary
                        : Colors.grey.shade200,
                  ),
                ),
                title: orderTimelines[index],
                topTitle: true,
              );
            }),
            onStepReached: (index) {},
          ),
          const SizedBox(height: 20),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: const Color.fromARGB(255, 206, 81, 81)),
            ),
            elevation: 0.1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order: ${order.id}",
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Chip(
                        shape: const StadiumBorder(),
                        side: BorderSide.none,
                        backgroundColor:
                            theme.colorScheme.primaryContainer.withOpacity(0.4),
                        labelPadding: EdgeInsets.zero,
                        avatar: const Icon(Icons.fire_truck),
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        label: Text(
                          orderTimelines[activeStep],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Delivery estimate"),
                      Text(
                        order.date.deliveryDate,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Lidya Samson",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(IconlyLight.home, size: 15),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "Addis Ababa Ayat, house no 5561",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(IconlyLight.call, size: 15),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "251 99346542",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment method"),
                      Text(
                        "Credit Card **1234",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          OrderItem(order: order, visibleProducts: 1),
        ],
      ),
    );
  }
}
