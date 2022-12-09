import 'package:hermes_marketplace/objects/product.dart';

class FakeDatabase {
  static List<Product> getProducts() {
    return [
      Product(
          name: 'OCOOPA Hand Warmers Rechargeable, Magnetic Electric Handwarmer 2 Pack, 16 Hrs Warmth 4 Levels Heat, USB-C Portable Hand Heater Power Bank 5000mAh*2, Raynauds, Golf, Warm Gifts for Men, UT2s(MagTwins)',
          description: 'Magnetic Attraction, Beyond Imagination: Magical magnetic attraction makes the twins hand warmer attached to each other, and easy separate when needed. Slide them into the pockets, hold one in each hands, share one heater with your family or combine them to get 1 palm-sized hand warmer.Quick Heat Release: Feel Warm in Seconds. 20% power density increased, MagTwins produces a massive heat in seconds. Super durable, smooth, unibody high grade brushed aluminum housing promotes heat retention and even heat distribution.Ultimate Warming Experiences: Ergonomically comfortable. Aesthetically pleasing. MagTwins offers 4 levels of heating temperatures from cozy warmth to 145℉ hot. Choose your most comfortable heat. We simplify your operation by memorized the heating level you chose last time and turn to the level for the next time.Longer Lasting Warmth: Dual Purpose. Each piece of MagTwins armed with 5000mAh rechargeable battery, it can produces a massive heat output run time of 8+ hours on low, or charger your phone up to 1.5+ times at a full capacity.Built to Last: We refined the details, the rubber covers protect the charging ports to avoid dust or pocket crud. MagTwins will be a cool gift for people who love golf, camping, hunting, hiking and more outdoorsman.',
          networkImage: [
            'https://m.media-amazon.com/images/I/81RgRupm5jL._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/618S82iv9fL._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/71z8crsz62L._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/71cCexhND9L._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/71TdYH1Q9bL._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/61azj1PPb+L._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/81dia6g+vsL._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/71hbcKwr6pL._AC_SL1500_.jpg'
          ],
          price: '54.99', quantity: 1,
          source: 'https://www.tiktok.com', amazonLink: 'https://a.co/d/eSfwDiZ'
      ),
      Product(
          name: 'Venustas Heated Jacket with Battery Pack (Unisex), Heated Coat for Women and Men with Detachable Hood',
          description: 'LIGHTWEIGHT & BREATHABLE FABRIC - Breathable ultra light material, water-resistant coating, comfortable nylon fabric and hem seal in warmth. \nIt has excellent windproof and warm-keeping quality, ensure you be able to enjoy exceptional warmth while still maintaining your peak performance in many ways with unrestricted movement!\nSMART HEAT ACROSS BODY- Heat quickly in seconds, 4 carbon fiber heating elements generate heat across core body areas (left & right abdomen, collar & mid-back); \nAdjust 3 heating settings (High, medium, low) with just a simple press of the button.\nUPDATED DESIGN - New SILVER mylar thermal Lining is skin-friendly, the best POLY HEAT SYSTEM, ensures you don\'t lose any excess heat and enjoy more warmth than other heated linings on the market. \nHEAT UP TO 8 WORKING HOURS with certified Venustas battery, USB port for charging smartphones and other mobile devices.PREMIUM QUALITY - High quality hardware & premium zippers, easy access pockets plus a detachable hood is specially designed for chilly mornings and extra protection on windy days. Ideal Christmas gift for family members, friends, employees.MACHINE WASHABLE - Package include 1 * unisex heated apparel, 1* battery pack and 1* carry bag.',
          networkImage: [
            'https://m.media-amazon.com/images/I/71vHTCClUYL._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/717VU6BNY+L._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/717VU6BNY+L._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/71T8HsvaxQL._AC_SL1500_.jpg',
            'https://m.media-amazon.com/images/I/713aSrSVr3L._AC_SL1500_.jpg'
          ],
          price: '179.99',
          quantity: 1, source: 'https://www.tiktok.com',
          amazonLink: 'https://a.co/d/6xvenWP'
      )
    ];
  }//end get products
}