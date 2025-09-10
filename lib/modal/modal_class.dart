class Product {
  final String id;
  final String name;
  final String description;
  final String url;
  final double price;
  final String discount;
  int quantity;
  final String category;
  final String buyers;
  bool inCart;
  bool isFavourite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.price,
    required this.discount,
    this.quantity = 1,
    required this.category,
    required this.buyers,
    this.inCart = false,
    this.isFavourite = false,
  });
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      url: map['url'] ?? '',
      price: (map['price'] is int)
          ? (map['price'] as int).toDouble()
          : (map['price'] as num?)?.toDouble() ?? 0.0,
      discount: map['discount'] ?? '',
      buyers: map['buyers'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'url': url,
      'price': price,
      'discount': discount,
      'buyers': buyers,
    };
  }
}

// class ProductClass {
//   final List<Product> productlist = [
//     Product(
//       buyers: '5K+ bought in past... ',
//       name: 'Apple iPhone 14 Pro',
//       description:
//           'Experience the ultimate smartphone performance with the Apple iPhone 14 Pro, featuring the A16 Bionic chip, ProMotion display, and a triple-lens camera system for stunning photos and videos.Experience unmatched comfort and style with our premium cotton T-shirt, designed for everyday wear. Made from ultra-soft, breathable fabric, it keeps you cool in summer and cozy in winter. The modern fit, vibrant colors, and durable stitching make it perfect for casual outings, workouts, or lounging at home. Easy to wash, quick to dry, and built to last — your new go-to wardrobe essential.',
//       url:
//           'https://media-ik.croma.com/prod/https://media.tatacroma.com/Croma%20Assets/Communication/Mobiles/Images/243459_0_cvj2b5.png?tr=w-600',
//       price: 109999.99,
//       discount: '10% off',
//       quantity: 0,
//       category: 'Electronics',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '2K+ bought in past...  ',
//       name: 'Mens Shirt',
//       description:
//           'Elevate your style with this elegant and reliable mens watch — a perfect blend of craftsmanship, performance, and fashion.Experience unmatched comfort and style with our premium cotton T-shirt, designed for everyday wear. Made from ultra-soft, breathable fabric, it keeps you cool in summer and cozy in winter. The modern fit, vibrant colors, and durable stitching make it perfect for casual outings, workouts, or lounging at home. Easy to wash, quick to dry, and built to last — your new go-to wardrobe essential.',
//       url:
//           'https://thumbs.dreamstime.com/b/navy-white-men-shirt-isolated-white-background-men-shirt-isolated-white-background-clipping-path-included-cotton-twill-check-332195715.jpg',
//       price: 299.38,
//       discount: '50% off',
//       quantity: 0,
//       category: 'Mens',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '2K+ bought in past...  ',
//       name: 'Green Shirt',
//       description:
//           'Stay cozy and stylish with this classic hoodie — the perfect blend of comfort and fashion. Made from soft, breathable cotton-blend fabric, this hoodie keeps you warm during chilly days while offering all-day comfort. Experience unmatched comfort and style with our premium cotton T-shirt, designed for everyday wear. Made from ultra-soft, breathable fabric, it keeps you cool in summer and cozy in winter. The modern fit, vibrant colors, and durable stitching make it perfect for casual outings, workouts, or lounging at home. Easy to wash, quick to dry, and built to last — your new go-to wardrobe essential.',
//       url:
//           'https://assets.ajio.com/medias/sys_master/root/20240129/gBVZ/65b6c0c18cdf1e0df5d322fe/-473Wx593H-467015363-aqua-MODEL.jpg',
//       price: 396.38,
//       discount: '50% off',
//       quantity: 0,
//       category: 'Mens',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '1.5K bought in past... ',
//       name: 'Samsung 55" QLED ',
//       description:
//           'Enjoy breathtaking picture quality with Samsung’s 55-inch QLED 4K Smart TV. Powered by Quantum Processor 4K, it offers vibrant colors, deep blacks, and ultra-smooth motion for an immersive experience.Experience unmatched comfort and style with our premium cotton T-shirt, designed for everyday wear. Made from ultra-soft, breathable fabric, it keeps you cool in summer and cozy in winter. The modern fit, vibrant colors, and durable stitching make it perfect for casual outings, workouts, or lounging at home. Easy to wash, quick to dry, and built to last — your new go-to wardrobe essential.',
//       url:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqGbXJwUrCh9ZygdxAPMgLMTWrAoqliDkucg&s',
//       price: 64999.00,
//       discount: '15% off',
//       quantity: 0,
//       category: 'Electronics',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '3K+ bought in past... ',
//       name: 'Dell XPS 15 Laptop',
//       description:
//           'Dell XPS 15 with Intel® Core™ i9 processor, 32GB RAM, 1TB SSD, and NVIDIA GeForce RTX graphics delivers powerful performance for professionals and creators.Experience unmatched comfort and style with our premium cotton T-shirt, designed for everyday wear. Made from ultra-soft, breathable fabric, it keeps you cool in summer and cozy in winter. The modern fit, vibrant colors, and durable stitching make it perfect for casual outings, workouts, or lounging at home. Easy to wash, quick to dry, and built to last — your new go-to wardrobe essential.',
//       url:
//           'https://rukminim2.flixcart.com/image/704/844/xif0q/computer/i/7/r/latitude-3420-business-laptop-dell-original-imagn6hrwnczrmzv.jpeg?q=90&crop=false',
//       price: 185000.00,
//       discount: '22% off',
//       quantity: 0,
//       category: 'Electronics',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '4.2K bought in past... ',
//       name: 'Sony Headphones',
//       description:
//           'Immerse yourself in pure sound with Sony WH-1000XM5 wireless headphones, featuring industry-leading noise cancellation, crystal-clear calls, and up to 30 hours of battery life.Experience unmatched comfort and style with our premium cotton T-shirt, designed for everyday wear. Made from ultra-soft, breathable fabric, it keeps you cool in summer and cozy in winter. The modern fit, vibrant colors, and durable stitching make it perfect for casual outings, workouts, or lounging at home. Easy to wash, quick to dry, and built to last — your new go-to wardrobe essential.',
//       url:
//           'https://x.imastudent.com/content/0020662_sony-wh-ch710n-noise-canceling-wireless-over-ear-headphones_500.jpeg',
//       price: 29999.00,
//       discount: '18% off',
//       quantity: 0,
//       category: 'Electronics',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '900+ bought in past... ',
//       name: 'Canon R10 Camera',
//       description:
//           'Capture every moment in stunning detail with the Canon EOS R10 mirrorless camera. Boasting a 24.2MP APS-C sensor, advanced autofocus, and 4K video recording, it’s perfect for photography lovers.',
//       url:
//           'https://5.imimg.com/data5/SELLER/Default/2024/1/373966642/UV/PH/WR/205157623/canon-eos-2000d-ef-s-18-55-is-ii-dslr-camera-kit-black.jpg',
//       price: 79999.99,
//       discount: '12% off',
//       quantity: 0,
//       category: 'Electronics',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '7K+ bought in past... ',
//       name: 'Logitech 3S Mouse',
//       description:
//           'Enhance your productivity with the Logitech MX Master 3S, featuring ultra-fast scrolling, ergonomic design, and cross-computer control. Perfect for designers, developers, and office work.',
//       url:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF-hbFCMDbG35y1VTy6O1hRZoxMD5LmfxuZQ&s',
//       price: 7499.00,
//       discount: '15% off',
//       quantity: 0,
//       category: 'Electronics',
//       inCart: false,
//       isFavourite: false,
//     ),

//     Product(
//       buyers: '1K+ bought in past...  ',
//       name: 'Yellow Hoodie',
//       description:
//           'Stay cozy and stylish with this classic hoodie — the perfect blend of comfort and fashion. Made from soft, breathable cotton-blend fabric, this hoodie keeps you warm during chilly days while offering all-day comfort. ',
//       url:
//           'https://pictures.kartmax.in/cover/live/600x800/quality=6/sites/w0ACRcy407Pb14QWUoSQ/product-images/BHHLSLV22508-YELLOW_2.jpg',
//       price: 199.38,
//       discount: '25% off',
//       quantity: 0,
//       category: 'Mens',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '100+ bought in past...  ',
//       name: 'Gaming Remote',
//       description:
//           'Level up your gaming experience with this high-performance gaming remote! Designed for precision, comfort, and versatility',
//       url:
//           'https://bearhugs.in/cdn/shop/files/buy-flydigi-vader-3-pro-wireless-gaming-controller-at-bear-hugs-49017.webp?v=1750014707',
//       price: 209.56,
//       discount: '25% off',
//       quantity: 1,
//       category: 'Electronics',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '500+ bought in past...  ',
//       name: 'LG Machine',
//       description:
//           'Upgrade your laundry routine with the advanced technology of the LG Washing Machine, designed for performance, efficiency, and fabric care. Whether its daily wear or heavy loads',
//       url:
//           'https://media.croma.com/image/upload/h_300,w_300/v1683557529/Croma%20Assets/Large%20Appliances/Washers%20and%20Dryers/Images/270727_0_f6gqxj.png',
//       price: 1256.38,
//       discount: '10% off',
//       quantity: 0,
//       category: 'Electronics',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '2K+ bought in past...  ',
//       name: 'Mens Watch',
//       description:
//           'Elevate your style with this elegant and reliable mens watch — a perfect blend of craftsmanship, performance, and fashion.',
//       url:
//           'https://i5.walmartimages.com/seo/POEDAGAR-New-Luxury-Rose-Gold-Quartz-Watch-for-Men-Stainless-Steel-Sports-Waterproof-Luminous-Date-Fashion-Square-Men-s-Watches_58a2499a-f309-447f-8d13-5e9c49feb860.485bc23b1d87e436f68c6b4f6a415bbf.jpeg',
//       price: 599.38,
//       discount: '10% off',
//       quantity: 0,
//       category: 'Electronics',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '2K+ bought in past...  ',
//       name: 'Blue Shirt',
//       description:
//           'HP Laptop powered by Intel® Core™ i7 13th Gen processor. Perfect for multitasking, gaming, and productivity, this laptop comes with 16GB RAM, a 512GB SSD, and Intel Iris Xe graphics to handle every task with ease.',
//       url:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuC3vzZYgW6UUDmtFbCsWIeqAG9JrxomgGhw&s',
//       price: 450.44,
//       discount: '25% off',
//       quantity: 0,
//       category: 'Mens',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '2K+ bought in past...  ',
//       name: 'Check Shirt',
//       description:
//           'Hero Cycles brings you a perfect combination of performance, durability, and style. Whether you re riding through city streets, off-road trails, or heading to school or work',
//       url:
//           'https://thumbs.dreamstime.com/b/navy-grey-check-men-s-shirt-isolated-white-background-navy-grey-check-men-s-shirt-men-s-shirt-isolated-white-332195702.jpg',
//       price: 2099.38,
//       discount: '50% off',
//       quantity: 0,
//       category: 'Mens & Girls',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '2K+ bought in past...  ',
//       name: 'HP Laptop i7',
//       description:
//           'HP Laptop powered by Intel® Core™ i7 13th Gen processor. Perfect for multitasking, gaming, and productivity, this laptop comes with 16GB RAM, a 512GB SSD, and Intel Iris Xe graphics to handle every task with ease.',
//       url:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3kmzZD5LIVxwvNcfWXbADvWduV3Fv4P3Vjg&s',
//       price: 19999.38,
//       discount: '25% off',
//       quantity: 0,
//       category: 'Electronics',
//       inCart: false,
//       isFavourite: false,
//     ),

//     Product(
//       buyers: '2K+ bought in past...  ',
//       name: 'Gaming Remote',
//       description:
//           'Level up your gaming experience with this high-performance gaming remote! Designed for precision, comfort, and versatility',
//       url:
//           'https://bearhugs.in/cdn/shop/files/buy-flydigi-vader-3-pro-wireless-gaming-controller-at-bear-hugs-49017.webp?v=1750014707',
//       price: 209.56,
//       discount: '25% off',
//       quantity: 0,
//       category: 'Mens',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '2K+ bought in past...  ',
//       name: 'Girls Shirt',
//       description:
//           'Upgrade your laundry routine with the advanced technology of the LG Washing Machine, designed for performance, efficiency, and fabric care. Whether its daily wear or heavy loads',
//       url:
//           'https://rukminim3.flixcart.com/image/850/1000/xif0q/shirt/1/j/j/12-13-years-regular-fit-solid-casual-shirt-for-girls-dreamy-original-imagscvtneuqznps.jpeg?q=90&crop=false',
//       price: 1256.38,
//       discount: '25% off',
//       quantity: 0,
//       category: 'Girls',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '1.8K bought in past... ',
//       name: 'Floral Summer Dress',
//       description:
//           'Lightweight and breathable floral summer dress perfect for casual outings, parties, or vacations. Made with soft cotton fabric for comfort.',
//       url:
//           'https://5.imimg.com/data5/MG/TE/MM/SELLER-21852735/black-floral-print-dress-500x500.jpg',
//       price: 899.50,
//       discount: '30% off',
//       quantity: 0,
//       category: 'Girls',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '3K+ bought in past... ',
//       name: 'Winter Wool Sweater',
//       description:
//           'Cozy knitted wool sweater for girls, designed to keep warm during chilly days. Soft texture and stylish patterns.',
//       url:
//           'https://rukminim2.flixcart.com/image/704/844/xif0q/sweater/g/n/v/m-9061dkcamel-winter-knit-original-imaguzv22m6qrpha.jpeg?q=90&crop=false',
//       price: 1499.00,
//       discount: '20% off',
//       quantity: 0,
//       category: 'Girls',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '2.5K bought in past... ',
//       name: 'Party Wear Gown',
//       description:
//           'Elegant party gown with sequin detailing, perfect for birthdays, weddings, and festive occasions.',
//       url:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWOn6Vq6rVroymuJLzVBR0jet91uwsZXjR7BR8cmuxoxzZFT-QPe6RzX7C1EeIo6mEaMs&usqp=CAU',
//       price: 2499.00,
//       discount: '35% off',
//       quantity: 0,
//       category: 'Girls',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '1.2K bought in past... ',
//       name: 'Cotton Casual T-shirt',
//       description:
//           'Soft cotton T-shirt with cute graphic print, ideal for daily wear and school outfits.',
//       url:
//           'https://assets.ullapopken.de/images/products/820860825_ecom_g_01.jpg',
//       price: 499.00,
//       discount: '15% off',
//       quantity: 0,
//       category: 'Girls',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '4K+ bought in past... ',
//       name: 'Denim Jacket',
//       description:
//           'Stylish denim jacket with front buttons, perfect for layering over dresses or tops in cool weather.',
//       url:
//           'https://rukminim2.flixcart.com/image/514/616/xif0q/jacket/s/8/k/m-1-no-0522-plounge-original-imahe4hkawyehj7d.jpeg?q=90&crop=false',
//       price: 1799.00,
//       discount: '28% off',
//       quantity: 0,
//       category: 'Girls',
//       inCart: false,
//       isFavourite: false,
//     ),
//     Product(
//       buyers: '900+ bought in past... ',
//       name: 'Printed Skirt',
//       description:
//           'Vibrant printed skirt with elastic waistband, comfortable for casual outings and school events.',
//       url:
//           'https://img500.exportersindia.com/product_images/bc-500/2020/5/6368848/ladies-cotton-printed-skirts-1589793288-5437638.jpeg',
//       price: 799.00,
//       discount: '22% off',
//       quantity: 0,
//       category: 'Girls',
//       inCart: false,
//       isFavourite: false,
//     ),
//   ];
// }
