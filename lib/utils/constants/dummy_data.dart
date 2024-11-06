import 'package:sky_store/features/shop/models/brand_category_model.dart';
import 'package:sky_store/features/shop/models/brand_model.dart';
import 'package:sky_store/features/shop/models/category_model.dart';
import 'package:sky_store/features/shop/models/product_attribute_model.dart';
import 'package:sky_store/features/shop/models/product_category_model.dart';
import 'package:sky_store/features/shop/models/product_model.dart';
import 'package:sky_store/features/shop/models/product_variation_model.dart';
import 'package:sky_store/utils/constants/image_strings.dart';
import 'package:sky_store/routes/routes.dart';

import '../../features/shop/models/banner_model.dart';

class DummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
        active: true,
        imageUrl: SkyImages.banner1,
        targetScreen: SkyRouts.order),
    BannerModel(
        active: true, imageUrl: SkyImages.banner2, targetScreen: SkyRouts.cart),
    BannerModel(
        active: true,
        imageUrl: SkyImages.banner3,
        targetScreen: SkyRouts.favourites),
    BannerModel(
        active: true,
        imageUrl: SkyImages.banner4,
        targetScreen: SkyRouts.userAddress),
    BannerModel(
        active: true,
        imageUrl: SkyImages.banner5,
        targetScreen: SkyRouts.settings),
    BannerModel(
        active: true,
        imageUrl: SkyImages.banner6,
        targetScreen: SkyRouts.checkout),
  ];

  /// -- User

  /// -- Cart

  /// -- Order

  /// -- List of all Categories
  static final List<CategoryModel> categories = [
    /// Main Categories
    CategoryModel(
        id: '1', name: 'Sports', image: SkyImages.sports, isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: SkyImages.electronic,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Clothes', image: SkyImages.clothes, isFeatured: true),
    CategoryModel(
        id: '4',
        name: 'Animals',
        image: SkyImages.animalCare,
        isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: SkyImages.furniture,
        isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: SkyImages.shoes, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: SkyImages.cosmetics,
        isFeatured: true),
    CategoryModel(
        id: '8', name: 'Jewellery', image: SkyImages.jewelry, isFeatured: true),

    /// Sub-Categories

    // Sports
    CategoryModel(
        id: '9',
        name: 'Sport Shoes',
        image: SkyImages.shoes_1,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        name: 'Track Suits',
        image: SkyImages.tracksuitGreen,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '11',
        name: 'Sport Equipments',
        image: SkyImages.football_1,
        parentId: '1',
        isFeatured: false),

    // Furniture
    CategoryModel(
        id: '12',
        name: 'Bedroom furniture',
        image: SkyImages.bedroomBed_1,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        name: 'Kitchen furniture',
        image: SkyImages.kitchenCounter_1,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '14',
        name: 'Office furniture',
        image: SkyImages.officeDesk_1,
        parentId: '5',
        isFeatured: false),

    // Electronics
    CategoryModel(
        id: '15',
        name: 'Laptop',
        image: SkyImages.laptop_1,
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '16',
        name: 'Mobile',
        image: SkyImages.iPhone12,
        parentId: '2',
        isFeatured: false),

    // Clothes
    CategoryModel(
        id: '17',
        name: 'Shirts',
        image: SkyImages.tShirt_1,
        parentId: '3',
        isFeatured: false),
    CategoryModel(
        id: '18',
        name: 'Jacket',
        image: SkyImages.leatherJacket_1,
        parentId: '3',
        isFeatured: false),

    // Shoes
    CategoryModel(
        id: '19',
        name: 'Sports Shoes',
        image: SkyImages.nikeShoesAirJordan_1,
        parentId: '6',
        isFeatured: false),

    // Jewellery
    CategoryModel(
        id: '20',
        name: 'Necklace',
        image: SkyImages.jewellery_1,
        parentId: '8',
        isFeatured: false),

    // Cosmetics
    CategoryModel(
        id: '21',
        name: 'Cosmetic_1',
        image: SkyImages.cosmetics_1,
        parentId: '7',
        isFeatured: false),

    // Animal Product
    CategoryModel(
        id: '22',
        name: 'Pedigree',
        image: SkyImages.animalFood,
        parentId: '4',
        isFeatured: false),
  ];

  /// -- List of all Brand Categories
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: SkyImages.brandNike,
        name: 'Nike',
        productsCount: 110,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: SkyImages.brandAdidas,
        name: 'Adidas',
        productsCount: 70,
        isFeatured: true),
    BrandModel(
        id: '3',
        image: SkyImages.brandJordan,
        name: 'Jordan',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: SkyImages.brandPuma,
        name: 'Puma',
        productsCount: 35,
        isFeatured: true),
    BrandModel(
        id: '5',
        image: SkyImages.brandApple,
        name: 'Apple',
        productsCount: 16,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: SkyImages.brandZara,
        name: 'ZARA',
        productsCount: 42,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: SkyImages.brandSamsung,
        name: 'Samsung',
        productsCount: 40,
        isFeatured: false),
    BrandModel(
        id: '8',
        image: SkyImages.brandKenwood,
        name: 'Kenwood',
        productsCount: 55,
        isFeatured: false),
    BrandModel(
        id: '9',
        image: SkyImages.brandIkea,
        name: 'IKEA',
        productsCount: 47,
        isFeatured: false),
    BrandModel(
        id: '10',
        image: SkyImages.brandAcer,
        name: 'Acer',
        productsCount: 30,
        isFeatured: true),
    BrandModel(
        id: '11',
        image: SkyImages.brandPedigree,
        name: 'Pedigree',
        productsCount: 0,
        isFeatured: false),
    BrandModel(
        id: '12',
        image: SkyImages.brandKalyan,
        name: 'Kalyan',
        productsCount: 18,
        isFeatured: false),
    BrandModel(
        id: '13',
        image: SkyImages.brandLakeMe,
        name: 'LAKEME',
        productsCount: 27,
        isFeatured: false),
  ];

  /// -- List of all Products
  static final List<ProductModel> products = [
    /// Shoes
    ProductModel(
      id: '001',
      title: 'Nike sports shoes.',
      stock: 15,
      price: 3600,
      isFeatured: true,
      thumbnail: SkyImages.shoes_1,
      description: 'Nike sports shoes with green color combination.',
      brand: BrandModel(
        id: '1',
        image: SkyImages.brandNike,
        name: 'Nike',
        productsCount: 110,
        isFeatured: true,
      ),
      images: [],
      salePrice: 1250,
      sku: 'ABR4568',
      categoryId: '6',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel(
            name: 'Size- UK/India', values: ['7', '8', '9', '10']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 20,
          price: 3600,
          salePrice: 1500,
          image: SkyImages.shoes_1,
          description: 'Product description for Green Nike sport shoes.',
          attributeValues: {'Color': 'Green', 'Size': '8'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 1760,
          salePrice: 1620,
          image: SkyImages.shoes_2,
          description: 'Product description for Blue Nike sport shoes.',
          attributeValues: {'Color': 'Blue', 'Size': '7'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 18,
          price: 1550,
          salePrice: 1350,
          image: SkyImages.shoes_3,
          description: 'Product description for Red Nike sport shoes.',
          attributeValues: {'Color': 'Red', 'Size': '9'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Nike Air Jordan Retro Shoes',
      stock: 45,
      price: 3700,
      isFeatured: true,
      thumbnail: SkyImages.nikeShoesAirJordan_1,
      description:
          'Elevate your sneaker game with iconic Nike Air Jordan Retro and Nike Air Jordan Mid kicks. Explore the legendary collection of Air Jordan shoes.',
      brand: BrandModel(
        id: '3',
        image: SkyImages.brandJordan,
        name: 'Jordan',
        productsCount: 36,
        isFeatured: true,
      ),
      images: [],
      salePrice: 2750,
      sku: 'ABR4568',
      categoryId: '6',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color',
            values: ['Black', 'White', 'Blue', 'Orange', 'Purple', 'Red']),
        ProductAttributeModel(
            name: 'Size- UK/India', values: ['7', '8', '9', '10']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 17,
          price: 3500,
          salePrice: 2850,
          image: SkyImages.nikeShoesAirJordan_1,
          description: 'Product description for Black-Red Nike sport shoes.',
          attributeValues: {'Color': 'Black', 'Size': '7'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 20,
          price: 3500,
          salePrice: 2850,
          image: SkyImages.nikeShoesAirJordan_2,
          description: 'Product description for White-Orange Nike sport shoes.',
          attributeValues: {'Color': 'White', 'Size': '9'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 20,
          price: 3500,
          salePrice: 2850,
          image: SkyImages.nikeShoesAirJordan_3,
          description: 'Product description for  Nike sport shoes.',
          attributeValues: {'Color': 'Blue', 'Size': '10'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 20,
          price: 3500,
          salePrice: 2850,
          image: SkyImages.nikeShoesAirJordan_4,
          description: 'Product description for  Nike sport shoes.',
          attributeValues: {'Color': 'Orange', 'Size': '8'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 20,
          price: 3500,
          salePrice: 2850,
          image: SkyImages.nikeShoesAirJordan_5,
          description: 'Product description for  Nike sport shoes.',
          attributeValues: {'Color': 'Purple', 'Size': '9'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 20,
          price: 3500,
          salePrice: 2850,
          image: SkyImages.nikeShoesAirJordan_6,
          description: 'Product description for  Nike sport shoes.',
          attributeValues: {'Color': 'Red', 'Size': '8'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '003',
      title: 'Nike Air Max',
      stock: 32,
      price: 4000,
      isFeatured: true,
      thumbnail: SkyImages.nikeAirMax,
      description:
          'Elevate your sneaker game with iconic Nike Air Max. Explore the legendary collection of Air Max shoes.',
      brand: BrandModel(
        id: '1',
        image: SkyImages.brandNike,
        name: 'Nike',
        productsCount: 110,
        isFeatured: true,
      ),
      images: [],
      salePrice: 3750,
      sku: 'ABR4568',
      categoryId: '6',
      productAttributes: [
        ProductAttributeModel(
            name: 'Size- UK/India', values: ['6', '7', '8', '9', '10']),
      ],
      productType: 'ProductType.single',
    ),

    /// Electronics
    ProductModel(
      id: '004',
      title:
          'Acer Predator Helios Neo 14 Gaming Laptop/ Intel Core Ultra 7-155H Processor/16 GB DDR4 RAM/ MS-Office provided.',
      stock: 25,
      price: 67500,
      isFeatured: true,
      thumbnail: SkyImages.gamingLaptop_4,
      description:
          'Acer Predator Helios Neo 14 Gaming Laptop Intel Core Ultra 7-155H Processor (Windows 11 Home/16 GB/1 TB SSD/NVIDIA GeForce RTX 4050/120 Hz)',
      brand: BrandModel(
        id: '10',
        image: SkyImages.brandAcer,
        name: 'Acer',
        productsCount: 30,
        isFeatured: true,
      ),
      images: [],
      salePrice: 65750,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Variant', values: [
          'i5/8 GB/512 GB',
          'i5/16 GB/1 TB',
          'i7/8 GB/512 GB',
          'i7/16 GB/1 TB',
        ]),
        ProductAttributeModel(name: 'Color', values: ['Black']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 12,
          price: 57000,
          salePrice: 55560,
          image: SkyImages.gamingLaptop_1,
          description:
              'Acer Predator Helios Neo 14 Gaming Laptop Intel Core Ultra 5-155H Processor (Windows 11 Home/8 GB/512 GB SSD/NVIDIA GeForce RTX 4050/120 Hz)',
          attributeValues: {'Color': 'Black', 'Variant': 'i5/8 GB/512 GB'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 62300,
          salePrice: 59960,
          image: SkyImages.gamingLaptop_2,
          description:
              'Acer Predator Helios Neo 14 Gaming Laptop Intel Core Ultra 5-155H Processor (Windows 11 Home/16 GB/1 TB SSD/NVIDIA GeForce RTX 4050/120 Hz)',
          attributeValues: {'Color': 'Black', 'Variant': 'i5/16 GB/1 TB'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 15,
          price: 65900,
          salePrice: 62830,
          image: SkyImages.gamingLaptop_3,
          description:
              'Acer Predator Helios Neo 14 Gaming Laptop Intel Core Ultra 7-155H Processor (Windows 11 Home/8 GB/512 GB SSD/NVIDIA GeForce RTX 4050/120 Hz)',
          attributeValues: {'Color': 'Black', 'Variant': 'i7/8 GB/512 GB'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 10,
          price: 67500,
          salePrice: 65750,
          image: SkyImages.gamingLaptop_4,
          description:
              'Acer Predator Helios Neo 14 Gaming Laptop Intel Core Ultra 7-155H Processor (Windows 11 Home/16 GB/1 TB SSD/NVIDIA GeForce RTX 4050/120 Hz)',
          attributeValues: {'Color': 'Black', 'Variant': 'i7/16 GB/1 TB'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '005',
      title:
          'Acer Aspire Notebook Core i5 12TH Gen/8 GB DDR4 RAM/512 SSD/ MS-Office provided.',
      stock: 35,
      price: 58400,
      isFeatured: true,
      thumbnail: SkyImages.laptop_1,
      description:
          'Acer Aspire Notebook Core i5 12TH Gen/8 GB DDR4 RAM/512 SSD/MS-Office provided/Windows 11 Home.',
      brand: BrandModel(
        id: '10',
        image: SkyImages.brandAcer,
        name: 'Acer',
        productsCount: 30,
        isFeatured: true,
      ),
      images: [],
      salePrice: 54560,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Variant', values: [
          'i5/8 GB/512 GB',
        ]),
        ProductAttributeModel(name: 'Color', values: [
          'Sky Blue',
          'Silver Grey',
          'Turquoise Blue',
          'Shiny Black',
        ]),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 10,
          price: 58400,
          salePrice: 54560,
          image: SkyImages.laptop_1,
          description:
              'Acer Aspire Notebook Core i5 12TH Gen/8 GB DDR4 RAM/512 SSD/MS-Office provided/Windows 11 Home.',
          attributeValues: {'Color': 'Sky Blue', 'Variant': 'i5/8 GB/512 GB'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 57600,
          salePrice: 54200,
          image: SkyImages.laptop_2,
          description:
              'Acer Aspire Notebook Core i5 12TH Gen/8 GB DDR4 RAM/512 SSD/MS-Office provided/Windows 11 Home.',
          attributeValues: {
            'Color': 'Silver Grey',
            'Variant': 'i5/8 GB/512 GB'
          },
        ),
        ProductVariationModel(
          id: '3',
          stock: 10,
          price: 59200,
          salePrice: 56590,
          image: SkyImages.laptop_3,
          description:
              'Acer Aspire Notebook Core i5 12TH Gen/8 GB DDR4 RAM/512 SSD/MS-Office provided/Windows 11 Home.',
          attributeValues: {
            'Color': 'Turquoise Blue',
            'Variant': 'i5/8 GB/512 GB'
          },
        ),
        ProductVariationModel(
          id: '4',
          stock: 10,
          price: 56200,
          salePrice: 53880,
          image: SkyImages.laptop_4,
          description:
              'Acer Aspire Notebook Core i5 12TH Gen/8 GB DDR4 RAM/512 SSD/MS-Office provided/Windows 11 Home.',
          attributeValues: {
            'Color': 'Shiny Black',
            'Variant': 'i5/8 GB/512 GB'
          },
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '006',
      title: 'Apple iPhone 12 (6GB RAM /64GB ROM)',
      stock: 12,
      price: 45400,
      isFeatured: true,
      thumbnail: SkyImages.iPhone12,
      description: 'Apple iPhone 12 (6GB RAM /64GB ROM)',
      brand: BrandModel(
        id: '5',
        image: SkyImages.brandApple,
        name: 'Apple',
        productsCount: 16,
        isFeatured: true,
      ),
      images: [
        SkyImages.iPhone12Dual,
        SkyImages.iPhone12Front,
        SkyImages.iPhone12Back,
      ],
      salePrice: 37900,
      sku: 'ABR4568',
      categoryId: '2',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'Apple iPhone 13 (8GB RAM /128GB ROM)',
      stock: 12,
      price: 72400,
      isFeatured: true,
      thumbnail: SkyImages.iPhone13,
      description: 'Apple iPhone 13 (8GB RAM /128GB ROM)',
      brand: BrandModel(
        id: '5',
        image: SkyImages.brandApple,
        name: 'Apple',
        productsCount: 16,
        isFeatured: true,
      ),
      images: [
        SkyImages.iPhone13Pro,
      ],
      salePrice: 56854,
      sku: 'ABR4568',
      categoryId: '2',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '008',
      title: 'Apple iPhone 14 PRO (8GB RAM /128GB ROM)',
      stock: 12,
      price: 92400,
      isFeatured: true,
      thumbnail: SkyImages.iPhone14ProWhite,
      description: 'Apple iPhone 14 PRO (8GB RAM /128GB ROM)',
      brand: BrandModel(
        id: '5',
        image: SkyImages.brandApple,
        name: 'Apple',
        productsCount: 16,
        isFeatured: true,
      ),
      images: [
        SkyImages.iPhone14Pro,
      ],
      salePrice: 78425,
      sku: 'ABR4568',
      categoryId: '2',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '009',
      title: 'Samsung Galaxy S24 Ultra 256GB｜12GB Titanium Violet (SM-S928BZVC)',
      stock: 10,
      price: 97180,
      isFeatured: true,
      thumbnail: SkyImages.samsungS23Ultra,
      description: 'Samsung Galaxy S24 Ultra 256GB｜12GB Titanium Violet (SM-S928BZVC)',
      brand: BrandModel(
        id: '7',
        image: SkyImages.brandSamsung,
        name: 'Samsung',
        productsCount: 40,
        isFeatured: false,
      ),
      images: [SkyImages.samsungS23Front],
      salePrice: 78489,
      sku: 'ABR4568',
      categoryId: '2',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '010',
      title: 'Samsung RS53K4400 Refrigerator Auto-defrost Freezers',
      stock: 10,
      price: 35150,
      isFeatured: true,
      thumbnail: SkyImages.refrigerator,
      description: 'Samsung RS53K4400 Refrigerator Auto-defrost Freezers.',
      brand: BrandModel(
        id: '7',
        image: SkyImages.brandSamsung,
        name: 'Samsung',
        productsCount: 40,
        isFeatured: true,
      ),
      images: [SkyImages.refrigerator_2, SkyImages.refrigerator_3],
      salePrice: 27489,
      sku: 'ABR4568',
      categoryId: '2',
      productType: 'ProductType.single',
    ),

    /// Sports
    ProductModel(
      id: '011',
      title: 'ADIDAS TIRO LGE TB Football - Size: 5 (Pack of 1, White)',
      stock: 50,
      price: 3510,
      isFeatured: true,
      thumbnail: SkyImages.football_1,
      description: 'ADIDAS TIRO LGE TB Football - Size: 5 (Pack of 1, White)',
      brand: BrandModel(
        id: '2',
        image: SkyImages.brandAdidas,
        name: 'Adidas',
        productsCount: 70,
        isFeatured: true,
      ),
      images: [
        SkyImages.football_2,
        SkyImages.football_3,
        SkyImages.football_4
      ],
      salePrice: 2550,
      sku: 'ABR4568',
      categoryId: '1',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '012',
      title: 'Wooden Willow Baseball Bat(650-680 g)',
      stock: 50,
      price: 799,
      isFeatured: true,
      thumbnail: SkyImages.baseballBat,
      description:
          'Rajshree enterprises meerut RJM-720 wooden Willow Baseball Bat(650-680 g)',
      brand: BrandModel(
        id: '2',
        image: SkyImages.brandAdidas,
        name: 'Adidas',
        productsCount: 70,
        isFeatured: true,
      ),
      images: [
        SkyImages.baseballBat_2,
        SkyImages.baseballBat_3,
      ],
      salePrice: 589,
      sku: 'ABR4568',
      categoryId: '1',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '013',
      title: 'PUMA Future EW SNR 7.1 English Willow Cricket Bat (1180-1220 g)',
      stock: 25,
      price: 3799,
      isFeatured: true,
      thumbnail: SkyImages.cricketBat,
      description:
          'PUMA Future EW SNR 7.1 English Willow Cricket Bat (1180-1220 g)',
      brand: BrandModel(
        id: '4',
        image: SkyImages.brandPuma,
        name: 'Puma',
        productsCount: 35,
        isFeatured: true,
      ),
      images: [
        SkyImages.cricketBat_2,
        SkyImages.cricketBat_3,
      ],
      salePrice: 2889,
      sku: 'ABR4568',
      categoryId: '1',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '014',
      title: 'Adidas 25 Blue Strung Tennis Racquet  (Pack of: 1, 240 g)',
      stock: 25,
      price: 8599,
      isFeatured: true,
      thumbnail: SkyImages.tennisRacquet,
      description: 'Adidas 25 Blue Strung Tennis Racquet  (Pack of: 1, 240 g)',
      brand: BrandModel(
        id: '2',
        image: SkyImages.brandAdidas,
        name: 'Adidas',
        productsCount: 70,
        isFeatured: true,
      ),
      images: [],
      salePrice: 6889,
      sku: 'ABR4568',
      categoryId: '1',
      productType: 'ProductType.single',
    ),

    /// Slipper
    ProductModel(
      id: '015',
      title: 'Ultralightweight all Seasons Men Slippers',
      stock: 25,
      price: 775,
      isFeatured: false,
      thumbnail: SkyImages.slipper,
      description:
          '3 Pairs|EVA|Ultralightweight|Premium|Comfort|All Seasons Men Slippers(Multicolor , 9)',
      brand: BrandModel(
        id: '2',
        image: SkyImages.brandAdidas,
        name: 'Adidas',
        productsCount: 70,
        isFeatured: true,
      ),
      images: [
        SkyImages.slipper_2,
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['White', 'Blue']),
        ProductAttributeModel(
            name: 'Size- UK/India', values: ['7', '8', '9', '10']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 12,
          price: 725,
          salePrice: 589,
          image: SkyImages.slipper,
          description:
              '3 Pairs|EVA|Ultralightweight|Premium|Comfort|All Seasons Men Slippers(Multicolor , 9)',
          attributeValues: {'Color': 'White', 'Size': '8'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 805,
          salePrice: 556,
          image: SkyImages.slipper_2,
          description:
              '3 Pairs|EVA|Ultralightweight|Premium|Comfort|All Seasons Men Slippers(Multicolor , 9)',
          attributeValues: {'Color': 'Blue', 'Size': '10'},
        ),
      ],
      salePrice: 589,
      sku: 'ABR4568',
      categoryId: '6',
      productType: 'ProductType.variable',
    ),

    /// Furniture
    ProductModel(
      id: '016',
      title: 'Vintej Home Florentine Sheesham Solid Wood Queen Size Bed',
      stock: 45,
      price: 22700,
      isFeatured: true,
      thumbnail: SkyImages.bedroomBed_1,
      description: 'Vintej Home Florentine Sheesham Solid Wood Queen Size Bed.',
      brand: BrandModel(
        id: '9',
        image: SkyImages.brandIkea,
        name: 'IKEA',
        productsCount: 47,
        isFeatured: false,
      ),
      images: [],
      salePrice: 19950,
      sku: 'ABR4568',
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Brown', 'Black', 'Grey', 'White']),
        ProductAttributeModel(name: 'Size', values: ['King', 'Queen']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 12,
          price: 22700,
          salePrice: 19950,
          image: SkyImages.bedroomBed_1,
          description:
              'Vintej Home Florentine Sheesham Solid Wood Queen Size Bed',
          attributeValues: {'Color': 'Brown', 'Size': 'Queen'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 12,
          price: 22700,
          salePrice: 19950,
          image: SkyImages.bedroomBed_2,
          description:
              'Vintej Home Florentine Sheesham Solid Wood Queen Size Bed',
          attributeValues: {'Color': 'Black', 'Size': 'Queen'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 10,
          price: 22700,
          salePrice: 19950,
          image: SkyImages.bedroomBed_3,
          description:
              'Vintej Home Florentine Sheesham Solid Wood Queen Size Bed',
          attributeValues: {'Color': 'Grey', 'Size': 'Queen'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 5,
          price: 22700,
          salePrice: 19950,
          image: SkyImages.bedroomBed_4,
          description:
              'Vintej Home Florentine Sheesham Solid Wood King Size Bed',
          attributeValues: {'Color': 'Brown', 'Size': 'King'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 12,
          price: 22700,
          salePrice: 19950,
          image: SkyImages.bedroomBed_5,
          description:
              'Vintej Home Florentine Sheesham Solid Wood King Size Bed',
          attributeValues: {'Color': 'White', 'Size': 'King'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '017',
      title: 'Crosscut Furniture Club Floor Lamp',
      stock: 45,
      price: 2700,
      isFeatured: true,
      thumbnail: SkyImages.bedroomLamp_1,
      description: 'Crosscut Furniture Club Floor Lamp.',
      brand: BrandModel(
        id: '8',
        image: SkyImages.brandKenwood,
        name: 'Kenwood',
        productsCount: 55,
        isFeatured: false,
      ),
      images: [],
      salePrice: 1850,
      sku: 'ABR4568',
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Brown', 'Black', 'White', 'Grey']),
        ProductAttributeModel(
            name: 'Length', values: ['40cm', '45cm', '50cm', '55cm']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 5,
          price: 2700,
          salePrice: 1850,
          image: SkyImages.bedroomLamp_1,
          description: 'Crosscut Furniture Club Floor Lamp (40cm height)',
          attributeValues: {'Color': 'Brown', 'Length': '40cm'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 8,
          price: 2500,
          salePrice: 1700,
          image: SkyImages.bedroomLamp_2,
          description: 'Crosscut Furniture Club Floor Lamp (45cm height)',
          attributeValues: {'Color': 'Black', 'Length': '45cm'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 8,
          price: 2500,
          salePrice: 1700,
          image: SkyImages.bedroomLamp_3,
          description: 'Crosscut Furniture Club Floor Lamp (50cm height)',
          attributeValues: {'Color': 'White', 'Length': '50cm'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 8,
          price: 2600,
          salePrice: 1800,
          image: SkyImages.bedroomLamp_4,
          description: 'Crosscut Furniture Club Floor Lamp (55cm height)',
          attributeValues: {'Color': 'Grey', 'Length': '55cm'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '018',
      title:
          'Kendalwood Furniture Solid Wood Wooden Sofa set for living Room Furniture Fabric',
      stock: 15,
      price: 18200,
      isFeatured: true,
      thumbnail: SkyImages.bedroomSofa_1,
      description:
          'Kendalwood Furniture Solid Wood Wooden Sofa set for living Room Furniture Fabric.',
      brand: BrandModel(
        id: '9',
        image: SkyImages.brandIkea,
        name: 'IKEA',
        productsCount: 47,
        isFeatured: true,
      ),
      images: [],
      salePrice: 15355,
      sku: 'ABR4568',
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['White', 'Black', 'Brown', 'Grey']),
        ProductAttributeModel(
            name: 'Capacity', values: ['3 Seater', '5 Seater']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 5,
          price: 18200,
          salePrice: 15355,
          image: SkyImages.bedroomSofa_1,
          description:
              'Kendalwood Furniture Solid Wood Wooden Sofa set for living Room Furniture Fabric.',
          attributeValues: {'Color': 'White', 'Capacity': '5 Seater'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 8,
          price: 18200,
          salePrice: 15355,
          image: SkyImages.bedroomSofa_2,
          description:
              'Kendalwood Furniture Solid Wood Wooden Sofa set for living Room Furniture Fabric.',
          attributeValues: {'Color': 'Black', 'Capacity': '5 Seater'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 6,
          price: 17900,
          salePrice: 14745,
          image: SkyImages.bedroomSofa_3,
          description:
              'Kendalwood Furniture Solid Wood Wooden Sofa set for living Room Furniture Fabric.',
          attributeValues: {'Color': 'Brown', 'Capacity': '3 Seater'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 7,
          price: 17900,
          salePrice: 14745,
          image: SkyImages.bedroomSofa_4,
          description:
              'Kendalwood Furniture Solid Wood Wooden Sofa set for living Room Furniture Fabric.',
          attributeValues: {'Color': 'Grey', 'Capacity': '3 Seater'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '019',
      title:
          'Nilkamal WILLY Engineered Wood 3 Door Wardrobe (Finish Color - Silver)',
      stock: 15,
      price: 19600,
      isFeatured: true,
      thumbnail: SkyImages.bedroomWardrobe_1,
      description:
          'Nilkamal WILLY Engineered Wood 3 Door Wardrobe (Finish Color - Silver).',
      brand: BrandModel(
        id: '9',
        image: SkyImages.brandIkea,
        name: 'IKEA',
        productsCount: 47,
        isFeatured: false,
      ),
      images: [
        SkyImages.bedroomWardrobe_2,
        SkyImages.bedroomWardrobe_3,
      ],
      salePrice: 15539,
      sku: 'ABR4568',
      categoryId: '5',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '020',
      title: 'Brown wooden kitchen cabinet',
      stock: 15,
      price: 20600,
      isFeatured: true,
      thumbnail: SkyImages.kitchenCounter_1,
      description: 'Brown wooden kitchen cabinet.',
      brand: BrandModel(
        id: '9',
        image: SkyImages.brandIkea,
        name: 'IKEA',
        productsCount: 47,
        isFeatured: false,
      ),
      images: [
        SkyImages.kitchenCounter_2,
      ],
      salePrice: 18400,
      sku: 'ABR4568',
      categoryId: '5',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '021',
      title: 'Ikea Solid Wood 6 Seater Dining Table',
      stock: 15,
      price: 15300,
      isFeatured: true,
      thumbnail: SkyImages.diningTable,
      description: 'Ikea Solid Wood 6 Seater Dining Table.',
      brand: BrandModel(
        id: '9',
        image: SkyImages.brandIkea,
        name: 'IKEA',
        productsCount: 47,
        isFeatured: false,
      ),
      images: [],
      salePrice: 10400,
      sku: 'ABR4568',
      categoryId: '5',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '022',
      title: 'Apollo High Back Mesh Office Executive Chair',
      stock: 15,
      price: 10900,
      isFeatured: true,
      thumbnail: SkyImages.officeChair_1,
      description: 'Apollo High Back Mesh Office Executive Chair.',
      brand: BrandModel(
        id: '9',
        image: SkyImages.brandIkea,
        name: 'IKEA',
        productsCount: 47,
        isFeatured: false,
      ),
      images: [
        SkyImages.officeChair_2,
      ],
      salePrice: 7400,
      sku: 'ABR4568',
      categoryId: '5',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '023',
      title: 'Apollo High Back Mesh Office Executive Desk',
      stock: 12,
      price: 13900,
      isFeatured: true,
      thumbnail: SkyImages.officeDesk_1,
      description: 'Apollo High Back Mesh Office Executive Desk.',
      brand: BrandModel(
        id: '9',
        image: SkyImages.brandIkea,
        name: 'IKEA',
        productsCount: 47,
        isFeatured: false,
      ),
      images: [
        SkyImages.officeDesk_2,
      ],
      salePrice: 9300,
      sku: 'ABR4568',
      categoryId: '5',
      productType: 'ProductType.single',
    ),

    /// Animal
    ProductModel(
      id: '024',
      title:
          'PEDIGREE CHICKEN AND VEGETABLE 3KG Chicken,Vegetable 3 kg Dry Adult Dog Food',
      stock: 0,
      price: 900,
      isFeatured: false,
      thumbnail: SkyImages.animalFood,
      description:
          'PEDIGREE CHICKEN AND VEGETABLE 3KG Chicken, Vegetable 3 kg Dry Adult Dog Food.',
      brand: BrandModel(
        id: '11',
        image: SkyImages.brandPedigree,
        name: 'Pedigree',
        productsCount: 0,
        isFeatured: false,
      ),
      images: [],
      salePrice: 560,
      sku: 'ABR4568',
      categoryId: '4',
      productType: 'ProductType.single',
    ),

    /// Clothes
    ProductModel(
      id: '025',
      title: 'Men Solid Polo Neck Cotton Blend Purple T-Shirt',
      stock: 50,
      price: 950,
      isFeatured: true,
      thumbnail: SkyImages.tShirt_1,
      description: 'Men Solid Polo Neck Cotton Blend Purple T-Shirt.',
      brand: BrandModel(
        id: '6',
        image: SkyImages.brandZara,
        name: 'ZARA',
        productsCount: 42,
        isFeatured: true,
      ),
      images: [],
      salePrice: 680,
      sku: 'ABR4568',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Purple', 'Red', 'White', 'Green', 'Blue', 'Black'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL', 'XXL', '3XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 15,
          price: 950,
          salePrice: 680,
          image: SkyImages.tShirt_1,
          description: 'Men Solid Polo Neck Cotton Blend Purple T-Shirt.',
          attributeValues: {'Color': 'Purple', 'Size': 'S'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 18,
          price: 1050,
          salePrice: 775,
          image: SkyImages.tShirt_2,
          description: 'Men Solid Polo Neck Cotton Blend Red T-Shirt.',
          attributeValues: {'Color': 'Red', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 12,
          price: 899,
          salePrice: 560,
          image: SkyImages.tShirt_3,
          description: 'Men Solid Polo Neck Cotton Blend White T-Shirt.',
          attributeValues: {'Color': 'White', 'Size': 'L'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 22,
          price: 1070,
          salePrice: 710,
          image: SkyImages.tShirt_4,
          description: 'Men Solid Polo Neck Cotton Blend Green T-Shirt.',
          attributeValues: {'Color': 'Green', 'Size': 'XL'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 14,
          price: 960,
          salePrice: 690,
          image: SkyImages.tShirt_5,
          description: 'Men Solid Polo Neck Cotton Blend Blue T-Shirt.',
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 17,
          price: 880,
          salePrice: 540,
          image: SkyImages.tShirt_6,
          description: 'Men Solid Polo Neck Cotton Blend Black T-Shirt.',
          attributeValues: {'Color': 'Black', 'Size': 'XXL'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '026',
      title: 'Tape Poly Suit Solid Men Track Suit',
      stock: 40,
      price: 4350,
      isFeatured: true,
      thumbnail: SkyImages.tracksuitBlack,
      description: 'Tape Poly Suit Solid Men Black Track Suit.',
      brand: BrandModel(
        id: '1',
        image: SkyImages.brandNike,
        name: 'Nike',
        productsCount: 110,
        isFeatured: true,
      ),
      images: [],
      salePrice: 2420,
      sku: 'ABR4568',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Black', 'Blue', 'Green', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL', 'XXL', '3XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 15,
          price: 4350,
          salePrice: 2420,
          image: SkyImages.tracksuitBlack,
          description: 'Tape Poly Suit Solid Men Black Track Suit.',
          attributeValues: {'Color': 'Black', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 18,
          price: 4780,
          salePrice: 2690,
          image: SkyImages.tracksuitBlue,
          description: 'Tape Poly Suit Solid Men Blue Track Suit.',
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 18,
          price: 4780,
          salePrice: 2690,
          image: SkyImages.tracksuitGreen,
          description: 'Tape Poly Suit Solid Men Green Track Suit.',
          attributeValues: {'Color': 'Green', 'Size': 'L'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 18,
          price: 4780,
          salePrice: 2690,
          image: SkyImages.tracksuitRed,
          description: 'Tape Poly Suit Solid Men Red Track Suit.',
          attributeValues: {'Color': 'Red', 'Size': 'XL'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '027',
      title: 'Full Sleeve Self Design Men Leather Jacket',
      stock: 40,
      price: 5499,
      isFeatured: true,
      thumbnail: SkyImages.leatherJacket_1,
      description: 'Full Sleeve Self Design Men Leather Jacket.',
      brand: BrandModel(
        id: '6',
        image: SkyImages.brandZara,
        name: 'ZARA',
        productsCount: 42,
        isFeatured: true,
      ),
      images: [],
      salePrice: 2520,
      sku: 'ABR4568',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Black', 'Brown', 'Maroon', 'Yellow'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 15,
          price: 5499,
          salePrice: 2520,
          image: SkyImages.leatherJacket_1,
          description: 'Full Sleeve Self Design Men Leather Jacket.',
          attributeValues: {'Color': 'Black', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 5799,
          salePrice: 2680,
          image: SkyImages.leatherJacket_2,
          description: 'Full Sleeve Self Design Men Leather Jacket.',
          attributeValues: {'Color': 'Brown', 'Size': 'L'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 15,
          price: 5799,
          salePrice: 2680,
          image: SkyImages.leatherJacket_3,
          description: 'Full Sleeve Self Design Men Leather Jacket.',
          attributeValues: {'Color': 'Maroon', 'Size': 'XL'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 15,
          price: 6049,
          salePrice: 3570,
          image: SkyImages.leatherJacket_4,
          description: 'Full Sleeve Self Design Men Leather Jacket.',
          attributeValues: {'Color': 'Yellow', 'Size': 'L'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '028',
      title: 'Men Tapered Fit Mid Rise Blue Jeans',
      stock: 50,
      price: 3199,
      isFeatured: false,
      thumbnail: SkyImages.jeans_1,
      description: 'Men Tapered Fit Mid Rise Blue Jeans.',
      brand: BrandModel(
        id: '6',
        image: SkyImages.brandZara,
        name: 'ZARA',
        productsCount: 42,
        isFeatured: true,
      ),
      images: [
        SkyImages.jeans_2,
        SkyImages.jeans_3,
      ],
      salePrice: 2240,
      sku: 'ABR4568',
      categoryId: '3',
      productType: 'ProductType.single',
    ),

    /// Jewellery
    ProductModel(
      id: '029',
      title: 'Alloy Gold-plated Gold Jewel Set ',
      stock: 40,
      price: 2499,
      isFeatured: true,
      thumbnail: SkyImages.jewellery_1,
      description: 'Alloy Gold-plated Gold Jewel Set .',
      brand: BrandModel(
        id: '12',
        image: SkyImages.brandKalyan,
        name: 'Kalyan',
        productsCount: 18,
        isFeatured: false,
      ),
      images: [
        SkyImages.jewellery_2,
      ],
      salePrice: 1840,
      sku: 'ABR4568',
      categoryId: '8',
      productType: 'ProductType.single',
    ),

    /// Cosmetics
    ProductModel(
      id: '030',
      title: 'Pro Ultra 7pcs Makeup Brush set with Tya 6155 Makeup Kit',
      stock: 12,
      price: 3799,
      isFeatured: true,
      thumbnail: SkyImages.cosmetics_1,
      description: 'Pro Ultra 7pcs Makeup Brush set with Tya 6155 Makeup Kit.',
      brand: BrandModel(
        id: '13',
        image: SkyImages.brandLakeMe,
        name: 'LAKEME',
        productsCount: 27,
        isFeatured: false,
      ),
      images: [
        SkyImages.cosmetics_2,
        SkyImages.cosmetics_3,
      ],
      salePrice: 2180,
      sku: 'ABR4568',
      categoryId: '7',
      productType: 'ProductType.single',
    ),
  ];

  /// -- List of all Brand - Category Relation
  static final List<BrandCategoryModel> brandsForCategories = [
    // Brand Nike Relation
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '3'),
    BrandCategoryModel(brandId: '1', categoryId: '6'),

    // Brand Adidas Relation
    BrandCategoryModel(brandId: '2', categoryId: '1'),

    // Brand Jordan Relation
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '6'),

    // Brand Puma Relation
    BrandCategoryModel(brandId: '4', categoryId: '1'),

    // Brand Apple Relation
    BrandCategoryModel(brandId: '5', categoryId: '2'),

    // Brand Zara Relation
    BrandCategoryModel(brandId: '6', categoryId: '3'),

    // Brand Samsung Relation
    BrandCategoryModel(brandId: '7', categoryId: '2'),

    // Brand Kenwood Relation
    BrandCategoryModel(brandId: '8', categoryId: '2'),

    // Brand Ikea Relation
    BrandCategoryModel(brandId: '9', categoryId: '5'),

    // Brand Acer Relation
    BrandCategoryModel(brandId: '10', categoryId: '2'),

    // Brand Pedigree Relation
    BrandCategoryModel(brandId: '11', categoryId: '4'),

    // Brand Kalyan Relation
    BrandCategoryModel(brandId: '12', categoryId: '8'),

    // Brand Acer Relation
    BrandCategoryModel(brandId: '13', categoryId: '7'),
  ];

  /// -- List of all Brand - Product Relation
  static final List<ProductCategoryModel> productsForCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '6'),
    ProductCategoryModel(productId: '002', categoryId: '1'),
    ProductCategoryModel(productId: '002', categoryId: '6'),
    ProductCategoryModel(productId: '003', categoryId: '1'),
    ProductCategoryModel(productId: '003', categoryId: '6'),
    ProductCategoryModel(productId: '004', categoryId: '2'),
    ProductCategoryModel(productId: '005', categoryId: '2'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '2'),
    ProductCategoryModel(productId: '008', categoryId: '2'),
    ProductCategoryModel(productId: '009', categoryId: '2'),
    ProductCategoryModel(productId: '010', categoryId: '2'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '6'),
    ProductCategoryModel(productId: '016', categoryId: '5'),
    ProductCategoryModel(productId: '017', categoryId: '5'),
    ProductCategoryModel(productId: '018', categoryId: '5'),
    ProductCategoryModel(productId: '019', categoryId: '5'),
    ProductCategoryModel(productId: '020', categoryId: '5'),
    ProductCategoryModel(productId: '021', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '4'),
    ProductCategoryModel(productId: '025', categoryId: '3'),
    ProductCategoryModel(productId: '026', categoryId: '3'),
    ProductCategoryModel(productId: '027', categoryId: '3'),
    ProductCategoryModel(productId: '028', categoryId: '3'),
    ProductCategoryModel(productId: '029', categoryId: '8'),
    ProductCategoryModel(productId: '030', categoryId: '7'),
  ];
}
