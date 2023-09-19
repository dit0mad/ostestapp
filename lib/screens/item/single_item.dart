import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/middleware_bloc/bloc.dart';
import 'package:ostestapp/blocs/middleware_bloc/events.dart';
import 'package:ostestapp/models/item.dart';

class SingleItem extends StatelessWidget {
  final Item item;

  const SingleItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          BlocProvider.of<MiddlewareBloc>(context).add(
            GoToItemDetail(
              item: item,
            ),
          );
        },
        child: Ink(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: themedata.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              ...item.variant.map((e) => Row(
                    children: [
                      Expanded(
                        child: RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(text: e.label),
                            const WidgetSpan(
                                child: SizedBox(
                              width: 2,
                            )),
                            const TextSpan(text: ":"),
                            const WidgetSpan(
                                child: SizedBox(
                              width: 2,
                            )),
                            TextSpan(text: '\$${e.price}'),
                          ],
                        )),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
