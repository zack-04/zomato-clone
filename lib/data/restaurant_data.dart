import 'package:zomato_clone/model/menu_item.dart';
import 'package:zomato_clone/model/restaurant.dart';

List<Restaurant> dummyRestaurants = [
  Restaurant(
    id: '1',
    name: 'KFC',
    imageUrl:
        'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/bd384dc3b5ef057f8b2dcb91f243f33b',
    rating: 4.1,
    cuisines: 'Burgers, Biryani',
    priceRange: '300-400',
    menuItems: [
      MenuItem(
        id: '1.1',
        name: 'Veg Zinger Burger with Cheese',
        price: 213,
        imageUrl:
            'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/6d8c645fcd7d5368741ccc61933fafed',
        ingredients: 'Crispy patties, cheese slice, veggies & a tangy sauce',
        isVeg: true,
        isBestSeller: true,
      ),
      MenuItem(
        id: '1.2',
        name: 'Duo Chicken Chizza',
        price: 628,
        imageUrl:
            'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/fd28a1625bb03867ebb65d14a741bba5',
        ingredients: 'Cheese, spicy sauce, veggies & herbs',
        isVeg: false,
        isBestSeller: false,
      ),
      MenuItem(
        id: '1.3',
        name: 'Veg Rice Bowlz',
        price: 199,
        imageUrl:
            'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/b55628a57b4ae927013617605d4db6e6',
        ingredients: 'Aromatic Veg rice bowl mixed with spicy gravy',
        isVeg: true,
        isBestSeller: false,
      ),
    ],
  ),
  //restaurant 2

  Restaurant(
    id: '2',
    name: 'Burger King',
    imageUrl:
        'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/e33e1d3ba7d6b2bb0d45e1001b731fcf',
    rating: 4.2,
    cuisines: 'Burgers, American',
    priceRange: '70-500',
    menuItems: [
      MenuItem(
        id: '2.1',
        name: 'Crispy Veg Burger',
        price: 70,
        imageUrl:
            'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/eqaon8guufklmil7ayhr',
        ingredients:
            'Our Best-Selling Burger With Crispy Veg Patty, Fresh Onion And Our Signature Sauce',
        isVeg: true,
        isBestSeller: true,
      ),
      MenuItem(
          id: '2.2',
          name: 'Crispy Chicken + Crispy Chicken.',
          price: 129,
          imageUrl:
              'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/kqxbihqpeimd5cxpinfn',
          ingredients:
              'Crispy Chicken patty burger, our best seller. Enjoy Twice.',
          isVeg: false,
          isBestSeller: false),
      MenuItem(
          id: '2.3',
          name: 'Veg Crunchy Taco',
          price: 90,
          imageUrl:
              'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/424358cb32c40669f3aab9ba92d27141',
          ingredients:
              'Crunchy Shell with mix veg filling, crunchy veggies and spicy sauce',
          isVeg: true,
          isBestSeller: false),
    ],
  ),

  Restaurant(
    id: '3',
    name: 'Dominos Pizza',
    imageUrl:
        'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/glup2zfoo5dwyko6nb9h',
    rating: 4,
    cuisines: 'Pizzas, Italian',
    priceRange: '110-500',
    menuItems: [
      MenuItem(
          id: '3.1',
          name: 'Fiery Jalapeno & Paprika',
          price: 329,
          imageUrl:
              'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/0d542e845410d41657e1c91cd53704d1',
          ingredients:
              'Spiciest veg pizza with jalapeno & red paprika toppings and a new spicy peri peri sauce.',
          isVeg: true,
          isBestSeller: true),
      MenuItem(
          id: '3.2',
          name: 'Loaded Chicken Dominator',
          price: 379,
          imageUrl:
              'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/cced454821771db75117570ba7b28eb3',
          ingredients:
              'Valentine’s Special: Thin Crust Cheese Burst pizza loaded with loads of Chicken',
          isVeg: false,
          isBestSeller: false),
      MenuItem(
        id: '3.3',
        name: 'Loaded Margherita',
        price: 129,
        imageUrl:
            'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/0170a5fd875b9f50e22910d01fff3115',
        ingredients:
            'Valentine’s Special: Thin Crust Cheese Burst pizza with 100% Mozzarella Cheese',
        isVeg: true,
        isBestSeller: false,
      ),
    ],
  ),
];
