import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../theme/app_colors';
import 'offers_card.dart';

class OffersComponent extends StatelessWidget {
  final List<ImageProvider> offers;
  const OffersComponent({Key? key, required this.offers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: offers.map((offer) =>
                  OffersCard(image: offer),

              ).toList()
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: offers.length,
            effect: ColorTransitionEffect(
              activeDotColor: appColor.primary,
              dotColor: appColor.primary.withOpacity(0.4),
              dotHeight: 8,
              dotWidth: 8,
              radius: 7,
            ),
          ),
        ],
      ),
    );
  }
}
