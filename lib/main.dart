import 'package:flutter/material.dart';
import 'product_detail_page.dart';

void main() => runApp(const NovaApp());

const navy = Color(0xFF0C253C);
const orange = Color(0xFFFE893C);
const canvas = Color(0xFFF8F9FB);
const border = Color(0xFFE8ECF0);

class NovaApp extends StatelessWidget {
  const NovaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'NOVA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: canvas,
          colorScheme: ColorScheme.fromSeed(seedColor: navy, primary: navy),
          fontFamily: 'Arial',
        ),
        home: const NovaHome(),
      );
}

class Product {
  const Product(this.name, this.price, this.image, this.rating,
      {this.oldPrice, this.reviews = 0});
  final String name;
  final double price;
  final String image;
  final String rating;
  final double? oldPrice;
  final int reviews;
}

const deals = <Product>[
  Product('Wireless Headphones', 59, 'https://lh3.googleusercontent.com/aida-public/AB6AXuDrShuYZjAqrnCTFB5KxQQdnYzE7jvVBEixJsdnlJaR5LrEOSK39K6LKH5RkdOW5IE4E5NGtjJFKxb39q4sTr6pTiMYTdif96NHIcGVG1UWkxiffom6ED3s0cN-qdAxjMXz3fmXh_anF_mjUuUOVNWEHb1d8899W4sNF7vF-7AooWTVTrog4EvqrP0eFi-C2ipYUhfjrt_MAB5BstfJfnckHv5gfCAbGG5vi83XcQ0', '4.8', oldPrice: 89, reviews: 128),
  Product('Smart Watch', 89, 'https://lh3.googleusercontent.com/aida-public/AB6AXuAFCSFg_4EaM-TewF45O4vUH5omo7CRuh0HQXxrQPeJGU3IC7rCnxk5REp2ZpDx51uQ9HUTy0I1ffUGzSKoK0VQe18B80Ejn7S06oaRBZNrKY27E7gaLNOCy65ziyQmSIaXexT8fB4kg2G8eVOoqOh3uI5omIpY0rk0emT0O-1-lTn20vaeW4_0kPebZ6-7EeRdPjJiJa4fcjUiykmrcoE-HxjrKbuXZBjO7PGY-9U', '4.7', oldPrice: 120, reviews: 94),
  Product('Everyday Backpack', 45, 'https://lh3.googleusercontent.com/aida-public/AB6AXuDzwLLYN3uSVnyKN7W6VDapGSEhu68JFubPLZDrZEueRdZfxNgTCKl9ziJCETwhqtJiLVq4gSN0aTK4SGngkPm39gjeh348NPwJcSPfXnSKIAXzDNAazGmpnZcp7dnOpLkTO1TI2vm_6wjSY8U1VzPXBorkZ9PAZdemcvQ0nLC7yq8io5--XNcUAxSUTU68HNe7jywmfQdHdmVSZuBRegJXfoCwc-yaTQjUAHLxP78', '4.6', oldPrice: 65, reviews: 81),
];

const popular = <Product>[
  Product('Minimalist Sneakers', 72, 'https://lh3.googleusercontent.com/aida-public/AB6AXuBn1JMY4vb4wxwCIWgx_W2ZOIKkzz297y305eFQBDxrZ49BslSK1yBND_rz_x_OqhKV4FhgtnasooTi8IvuZXBNfBCB_5FfwFtPCY8g1nX_BKwaSdfKz1B87HUvuJFz5v8jR_ReNRF0ocYxVoMSfpv7ctbKfdQgr_CiwhSC_Xgj1aVp4Xiu43c-nixU2A7rWTOGceb8K5XGG0YsTloHM2JlokSVrWKlUZfZ9OxWN-Q', '4.9', reviews: 214),
  Product('Everyday Tote Bag', 38, 'https://lh3.googleusercontent.com/aida-public/AB6AXuBZC-UFZdTJ7xLnRBa-cNVeAvAN7dDctI6n3JrqtAUXnL3PzAAUw8p5U3Q6aKYJzuM4eYl3jeeYxlNp5bE_YAaioPuT_hitRfrVzVEwVO2CV0dyZZX5tja3vNUOOZVSe7uys4UUraEY5YG-2AhfidUPxNiGQygny54zJyd5JhboLhmbnoyy24PvEG-JTBvst8eHS_NOx87Rf-Mt2BRvo2bguqKCb4trSsP__qEEogY', '4.7', reviews: 156),
  Product('Bluetooth Speaker', 49, 'https://lh3.googleusercontent.com/aida-public/AB6AXuAPeVw3rAlpwVteu_zvUmm7jy-FltRdEBptN6S05Ux1gZnNDVSi_kP-0HxT1nScezq-gR_3tRWShHLCs97O73-k2q26X5O7RXDjSKoeygZibCLhV7ffnudKrxMvliK7KvxAKXbS4uacUb5o7EOeHPvih-OtaDjRNIdeR7b5uecuVH-PVaEX3DcaL1sz6uLSuvvpopgNJxlPbWtxyD7F2vbWPhKrBejPVUwDwpI4Ha0', '4.8', reviews: 312),
  Product('Ceramic Coffee Set', 32, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCXfAlh9ommoAfILabzyWQ1gwtRrsCK_VE60xCvhwUnpoBSguM9Bd_EIDJy4e_NwrEu3tNRoWH2wscMrtmx9OBf8Y71KoORwgjatO5jdJUjq2lQKMaurPO1Mmvg4LX7KGi1x0HQZP6iS6R2G-oPZ4u3qwdLmktutw5-d8JTaWsvMK0reV0EO6i0TqYjKtQ57HlyXombDdp0Yi-oXIPt5XbLDwGOSvJfFEJTH4f0ROw', '4.6', reviews: 79),
];

class NovaHome extends StatefulWidget {
  const NovaHome({super.key});

  @override
  State<NovaHome> createState() => _NovaHomeState();
}

class _NovaHomeState extends State<NovaHome> {
  final Set<String> _saved = {};
  final Set<String> _cart = {};
  int _tab = 0;
  String _query = '';

  void _add(Product p) {
    setState(() => _cart.add(p.name));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${p.name} added to cart'),
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final allProducts = [...deals, ...popular];
    final visible = allProducts
        .where((p) => p.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          index: _tab,
          children: [
            _home(visible),
            _explore(visible),
            _wishlistPage(),
            _cartPage(),
            _profilePage(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _home(List<Product> visible) => CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverToBoxAdapter(child: _header()),
          SliverToBoxAdapter(child: _greeting()),
          SliverToBoxAdapter(child: _search()),
          SliverToBoxAdapter(child: _hero()),
          SliverToBoxAdapter(child: _categories()),
          SliverToBoxAdapter(
              child: _sectionHeader('Flash deals', trailing: 'Ends in 04:32:18')),
          SliverToBoxAdapter(child: _dealList(visible)),
          SliverToBoxAdapter(
              child: _sectionHeader('Popular right now', trailing: 'View all')),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _productCard(visible[index % visible.length]),
                childCount: visible.isEmpty ? 0 : visible.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: .69,
              ),
            ),
          ),
        ],
      );

  Widget _header() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 8),
        child: Row(children: [
          const Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('NOVA', style: TextStyle(fontSize: 24, height: 1.05, fontWeight: FontWeight.w900, letterSpacing: -.8, color: navy)),
              Text('Shop your way.', style: TextStyle(fontSize: 12, color: Color(0xFF74777E))),
            ]),
          ),
          _roundIcon(Icons.notifications_none_rounded, () => _notice('You are all caught up')),
        ]),
      );

  Widget _greeting() => const Padding(
        padding: EdgeInsets.fromLTRB(20, 14, 20, 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Good morning, Alex', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, letterSpacing: -.6, color: Color(0xFF202833))),
          SizedBox(height: 3),
          Text("Find something you'll love today.", style: TextStyle(fontSize: 14, color: Color(0xFF74777E))),
        ]),
      );

  Widget _search() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Container(
          height: 48,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: border)),
          child: Row(children: [
            const SizedBox(width: 13),
            const Icon(Icons.search, color: Color(0xFF74777E), size: 21),
            const SizedBox(width: 9),
            Expanded(
              child: TextField(
                onChanged: (value) => setState(() => _query = value),
                decoration: const InputDecoration(hintText: 'Search products, brands...', border: InputBorder.none, isDense: true, hintStyle: TextStyle(fontSize: 14, color: Color(0xFF74777E))),
              ),
            ),
            IconButton(onPressed: () => _notice('Filters coming soon'), icon: const Icon(Icons.tune_rounded, size: 20, color: Color(0xFF43474D))),
          ]),
        ),
      );

  Widget _hero() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Container(
          height: 190,
          decoration: BoxDecoration(color: const Color(0xFF243B53), borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: Stack(children: [
            Positioned(right: -7, top: 20, bottom: 10, width: 170,
              child: Image.network(deals.first.image, fit: BoxFit.contain, errorBuilder: (_, __, ___) => const Icon(Icons.headphones_rounded, size: 108, color: Colors.white24))),
            Padding(
              padding: const EdgeInsets.all(18),
              child: SizedBox(width: 220, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(20)), child: const Text('WEEKLY SPECIAL', style: TextStyle(fontSize: 10, letterSpacing: 1, fontWeight: FontWeight.bold, color: Color(0xFFFFDBC9)))),
                const SizedBox(height: 11),
                const Text('Find your next favorite.', style: TextStyle(fontSize: 20, height: 1.15, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 5),
                const Text('Discover deals worth exploring.', style: TextStyle(fontSize: 12, color: Color(0xFFCFD8E3))),
                const Spacer(),
                FilledButton.icon(onPressed: () => _notice('Explore all deals'), icon: const Icon(Icons.arrow_forward, size: 16), label: const Text('Explore deals'), style: FilledButton.styleFrom(backgroundColor: orange, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 14), minimumSize: const Size(0, 36))),
              ])),
            ),
          ]),
        ),
      );

  Widget _categories() {
    final items = [
      ('Electronics', Icons.headphones_rounded), ('Fashion', Icons.checkroom_rounded),
      ('Home', Icons.chair_alt_rounded), ('Beauty', Icons.spa_rounded),
      ('Sports', Icons.fitness_center_rounded), ('Accessories', Icons.watch_rounded),
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _sectionHeader('Shop by category', trailing: 'See all'),
      SizedBox(height: 88, child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20), scrollDirection: Axis.horizontal,
        itemCount: items.length, separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemBuilder: (context, i) => SizedBox(width: 68, child: Column(children: [
          Container(width: 62, height: 62, decoration: BoxDecoration(color: Colors.white, border: Border.all(color: border), borderRadius: BorderRadius.circular(17)), child: Icon(items[i].$2, color: navy, size: 27)),
          const SizedBox(height: 7), Text(items[i].$1, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
        ])),
      )),
      const SizedBox(height: 22),
    ]);
  }

  Widget _sectionHeader(String title, {required String trailing}) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
        child: Row(children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: navy))),
          if (trailing.startsWith('Ends'))
            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5), decoration: BoxDecoration(color: const Color(0xFFFFF0E6), borderRadius: BorderRadius.circular(20)), child: Text(trailing, style: const TextStyle(fontSize: 9, color: Color(0xFF9A4600), fontWeight: FontWeight.bold)))
          else
            TextButton(onPressed: () => _notice('$title: coming soon'), child: Text(trailing, style: const TextStyle(color: Color(0xFF9A4600), fontSize: 12, fontWeight: FontWeight.w600))),
        ]),
      );

  Widget _dealList(List<Product> products) {
    final list = products.where((p) => deals.any((d) => d.name == p.name)).toList();
    return SizedBox(height: 260, child: ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 18), scrollDirection: Axis.horizontal,
      itemCount: list.length, separatorBuilder: (_, __) => const SizedBox(width: 14),
      itemBuilder: (context, i) => SizedBox(width: 168, child: _productCard(list[i], deal: true)),
    ));
  }

  Widget _productCard(Product p, {bool deal = false}) => InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (_) => ProductDetailPage(
            product: p,
            initiallySaved: _saved.contains(p.name),
            onWishlistChanged: (saved) => setState(() {
              if (saved) {
                _saved.add(p.name);
              } else {
                _saved.remove(p.name);
              }
            }),
            onAddToCart: () => _add(p),
          ),
        )),
        child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: border), borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Stack(children: [
            Positioned.fill(child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Container(color: canvas, child: Image.network(p.image, fit: BoxFit.contain, errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.image_not_supported_outlined, color: Colors.black26, size: 36)))))),
            if (deal && p.oldPrice != null) Positioned(left: 7, top: 7, child: Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFFFF0E6), borderRadius: BorderRadius.circular(6)), child: Text('-${((1 - p.price / p.oldPrice!) * 100).round()}%', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF9A4600))))),
            Positioned(right: 6, top: 6, child: _roundIcon(_saved.contains(p.name) ? Icons.favorite : Icons.favorite_border, () => setState(() => _saved.contains(p.name) ? _saved.remove(p.name) : _saved.add(p.name)), small: true, active: _saved.contains(p.name))),
          ])),
          const SizedBox(height: 8),
          Row(children: [const Icon(Icons.star_rounded, color: Color(0xFFFFB300), size: 15), const SizedBox(width: 3), Text(p.rating, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)), const SizedBox(width: 4), Text('(${p.reviews})', style: const TextStyle(fontSize: 10, color: Color(0xFF74777E)))]),
          const SizedBox(height: 4),
          Text(p.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF202833))),
          const SizedBox(height: 5),
          Row(children: [Expanded(child: Text('\$${p.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: navy))), if (p.oldPrice != null && deal) Text('\$${p.oldPrice!.toStringAsFixed(0)}', style: const TextStyle(fontSize: 11, color: Color(0xFF74777E), decoration: TextDecoration.lineThrough)), if (!deal) InkWell(onTap: () => _add(p), borderRadius: BorderRadius.circular(9), child: Container(width: 30, height: 30, decoration: BoxDecoration(color: const Color(0xFFE1E9F8), borderRadius: BorderRadius.circular(9)), child: const Icon(Icons.add, color: navy, size: 19))) ]),
        ]),
      ));

  Widget _explore(List<Product> products) => CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(20, 22, 20, 14), child: Text('Explore', style: _pageTitle))),
        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: _search())),
        SliverPadding(padding: const EdgeInsets.fromLTRB(20, 8, 20, 24), sliver: SliverGrid(delegate: SliverChildBuilderDelegate((_, i) => _productCard(products[i]), childCount: products.length), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 14, mainAxisSpacing: 14, childAspectRatio: .69))),
      ]);

  Widget _cartPage() {
    final items = [...deals, ...popular].where((p) => _cart.contains(p.name)).toList();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.fromLTRB(20, 22, 20, 16), child: Text('Your cart', style: _pageTitle)),
      if (items.isEmpty) const Expanded(child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.shopping_bag_outlined, size: 58, color: Color(0xFF9AA2AC)), SizedBox(height: 12), Text('Your cart is empty', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)), SizedBox(height: 4), Text('Add something you love to get started.', style: TextStyle(color: Color(0xFF74777E)))]))) else ...[
        Expanded(child: ListView(padding: const EdgeInsets.symmetric(horizontal: 20), children: items.map((p) => Container(margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.white, border: Border.all(color: border), borderRadius: BorderRadius.circular(14)), child: Row(children: [ClipRRect(borderRadius: BorderRadius.circular(10), child: SizedBox(width: 72, height: 72, child: Image.network(p.image, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.image)))), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600)), const SizedBox(height: 6), Text('\$${p.price.toStringAsFixed(2)}', style: const TextStyle(color: navy, fontWeight: FontWeight.bold))])), IconButton(onPressed: () => setState(() => _cart.remove(p.name)), icon: const Icon(Icons.delete_outline, color: Color(0xFF74777E)))]))).toList())),
        Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 25), child: SizedBox(width: double.infinity, child: FilledButton(onPressed: () => _notice('Checkout coming soon'), style: FilledButton.styleFrom(backgroundColor: navy, padding: const EdgeInsets.all(15)), child: Text('Checkout · \$${items.fold<double>(0, (sum, p) => sum + p.price).toStringAsFixed(2)}')))),
      ],
    ]);
  }

  Widget _wishlistPage() {
    final items = [...deals, ...popular]
        .where((product) => _saved.contains(product.name))
        .toList();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 16),
        child: Text('Your wishlist', style: _pageTitle),
      ),
      if (items.isEmpty)
        const Expanded(
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.favorite_border, size: 58, color: Color(0xFF9AA2AC)),
              SizedBox(height: 12),
              Text('Your wishlist is empty', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              Text('Save products to find them here.', style: TextStyle(color: Color(0xFF74777E))),
            ]),
          ),
        )
      else
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: .69,
            ),
            itemBuilder: (_, index) => _productCard(items[index]),
          ),
        ),
    ]);
  }

  Widget _profilePage() => ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('My Profile', style: _pageTitle),
            _roundIcon(Icons.notifications_none, () => _notice('You are all caught up')),
          ]),
          const SizedBox(height: 18),
          _profileCard(),
          const SizedBox(height: 16),
          _profileOrders(),
          const SizedBox(height: 20),
          _profileMenuSection('Account', [
            _ProfileMenuItem(Icons.person_outline, 'Personal Information', 'Manage your account details'),
            _ProfileMenuItem(Icons.location_on_outlined, 'Saved Addresses', 'Manage delivery locations'),
            _ProfileMenuItem(Icons.credit_card, 'Payment Methods', 'Manage payment preferences'),
            _ProfileMenuItem(Icons.favorite_border, 'My Wishlist', 'Products you have saved', trailing: '14 items'),
            _ProfileMenuItem(Icons.history, 'Recently Viewed', 'Products you viewed recently'),
          ]),
          const SizedBox(height: 18),
          _profileMenuSection('Preferences & Support', [
            _ProfileMenuItem(Icons.notifications_none, 'Notifications', 'Manage alerts and updates'),
            _ProfileMenuItem(Icons.language, 'Language', 'English', trailing: 'EN (US)'),
            _ProfileMenuItem(Icons.help_outline, 'Help Center', 'Get assistance with your orders'),
            _ProfileMenuItem(Icons.shield_outlined, 'Terms & Privacy', 'Review policies and privacy information'),
          ]),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: _confirmLogout,
            icon: const Icon(Icons.logout, color: Color(0xFFBA1A1A)),
            label: const Text('Log Out', style: TextStyle(color: Color(0xFFBA1A1A))),
            style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(52), side: const BorderSide(color: Color(0x55BA1A1A))),
          ),
          const SizedBox(height: 12),
          const Center(child: Text('NOVA Curation App v2.4.0', style: TextStyle(fontSize: 10, color: Color(0x9974777E)))),
        ],
      );

  Widget _profileCard() => Container(
        padding: const EdgeInsets.all(16),
        decoration: _profileDecoration(),
        child: Column(children: [
          Row(children: [
            const CircleAvatar(radius: 32, backgroundColor: Color(0xFFE1E9F8), child: Icon(Icons.person, size: 34, color: navy)),
            const SizedBox(width: 14),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Alex Morgan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: navy)),
              SizedBox(height: 3), Text('alex.morgan@example.com', style: TextStyle(fontSize: 12, color: Color(0xFF74777E))),
              SizedBox(height: 7), Text('?  NOVA Member', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF9A4600))),
            ])),
          ]),
          const Divider(height: 26),
          SizedBox(width: double.infinity, child: OutlinedButton.icon(onPressed: () => _notice('Edit profile coming soon'), icon: const Icon(Icons.edit, size: 16), label: const Text('Edit Profile'))),
        ]),
      );

  Widget _profileOrders() => Container(
        padding: const EdgeInsets.all(16), decoration: _profileDecoration(),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('My Orders', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: navy)), TextButton(onPressed: () => _notice('All orders'), child: const Text('View all orders'))]),
          Row(children: [
            _orderShortcut(Icons.account_balance_wallet_outlined, 'To Pay', '1'),
            _orderShortcut(Icons.inventory_2_outlined, 'Processing', '2'),
            _orderShortcut(Icons.local_shipping_outlined, 'Shipped', '1'),
            _orderShortcut(Icons.check_circle_outline, 'Completed', '8'),
          ]),
        ]),
      );

  Widget _orderShortcut(IconData icon, String label, String count) => Expanded(child: InkWell(onTap: () => _notice('$label orders'), child: Padding(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2), child: Column(children: [Stack(clipBehavior: Clip.none, children: [Icon(icon, size: 25, color: navy), Positioned(right: -9, top: -7, child: CircleAvatar(radius: 8, backgroundColor: orange, child: Text(count, style: const TextStyle(fontSize: 9, color: Colors.white))))]), const SizedBox(height: 7), Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Color(0xFF43474D)))]))));

  Widget _profileMenuSection(String title, List<_ProfileMenuItem> items) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(padding: const EdgeInsets.only(left: 2, bottom: 9), child: Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: navy))),
    Container(decoration: _profileDecoration(), child: Column(children: [for (var i = 0; i < items.length; i++) _profileMenuRow(items[i], i < items.length - 1)])),
  ]);

  Widget _profileMenuRow(_ProfileMenuItem item, bool showDivider) => InkWell(onTap: () => _notice('${item.title}'), child: Column(children: [Padding(padding: const EdgeInsets.all(14), child: Row(children: [Container(width: 38, height: 38, decoration: BoxDecoration(color: const Color(0xFFE6EEFD), borderRadius: BorderRadius.circular(9)), child: Icon(item.icon, color: navy, size: 20)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(item.title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF141C27))), const SizedBox(height: 3), Text(item.subtitle, style: const TextStyle(fontSize: 11, color: Color(0xFF74777E)))])), if (item.trailing != null) Padding(padding: const EdgeInsets.only(right: 6), child: Text(item.trailing!, style: const TextStyle(fontSize: 10, color: Color(0xFF74777E)))), const Icon(Icons.chevron_right, color: Color(0xFF74777E), size: 20)])), if (showDivider) const Divider(height: 1, indent: 64)]));

  BoxDecoration _profileDecoration() => BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: border), boxShadow: const [BoxShadow(color: Color(0x0A202833), blurRadius: 8, offset: Offset(0, 2))]);

  Future<void> _confirmLogout() async {
    final confirmed = await showDialog<bool>(context: context, builder: (dialogContext) => AlertDialog(
      icon: const Icon(Icons.logout, color: Color(0xFFBA1A1A)),
      title: const Text('Log out?'),
      content: const Text('Are you sure you want to log out of your NOVA account?'),
      actions: [TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancel')), FilledButton(onPressed: () => Navigator.pop(dialogContext, true), child: const Text('Log Out'))],
    ));
    if (confirmed == true && mounted) _notice('Logged out successfully.');
  }

  Widget _bottomNav() {
    final labels = ['Home', 'Explore', 'Wishlist', 'Cart', 'Profile'];
    final icons = [Icons.home_rounded, Icons.search, Icons.favorite_border, Icons.shopping_bag_outlined, Icons.person_outline];
    return Container(height: 66, decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Color(0x18000000), blurRadius: 16, offset: Offset(0, -3))]), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: List.generate(labels.length, (i) {
      final active = i == _tab;
      return Expanded(child: InkWell(onTap: () => setState(() => _tab = i), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Stack(clipBehavior: Clip.none, children: [Icon(icons[i], color: active ? navy : const Color(0xFF74777E), size: 23), if (i == 3 && _cart.isNotEmpty) Positioned(right: -9, top: -6, child: Container(padding: const EdgeInsets.symmetric(horizontal: 4), height: 15, decoration: BoxDecoration(color: orange, borderRadius: BorderRadius.circular(10)), child: Text('${_cart.length}', style: const TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold))))]), const SizedBox(height: 4), Text(labels[i], style: TextStyle(fontSize: 10, color: active ? navy : const Color(0xFF74777E), fontWeight: active ? FontWeight.bold : FontWeight.w500))])));
    })));
  }

  Widget _roundIcon(IconData icon, VoidCallback onTap, {bool small = false, bool active = false}) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(30), child: Container(width: small ? 28 : 40, height: small ? 28 : 40, decoration: BoxDecoration(color: small ? Colors.white.withOpacity(.94) : Colors.white, shape: BoxShape.circle, border: Border.all(color: border)), child: Icon(icon, size: small ? 16 : 20, color: active ? orange : const Color(0xFF43474D))));

  void _notice(String message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 2), behavior: SnackBarBehavior.floating));

  static const _pageTitle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: navy);
}

class _ProfileMenuItem {
  const _ProfileMenuItem(this.icon, this.title, this.subtitle, {this.trailing});
  final IconData icon;
  final String title;
  final String subtitle;
  final String? trailing;
}

