const Map<String, dynamic> dataSet = {
  "APPETIZERS": [
    {
      "id": 1,
      "name":
          "Iceberg Wedge Salad with House Cured Bacon - tomato salsa gorgonzola",
      "variant": {"price": 7.50}
    },
    {
      "id": 2,
      "name": "Sautéed Shredded Brussels Sprouts - bacon hazelnuts gorgonzola",
      "variant": {"price": 6.95}
    },
    {
      "id": 3,
      "name":
          "Kale Salad - parmesan crisp corn radish garlic-lemon vinaigrette",
      "variant": {"price": 7.50}
    },
    {
      "id": 4,
      "name":
          "Pecan Crusted Utah Goat Cheese with Basil-Mint Pesto - grilled tomato salsa crostini",
      "variant": {"price": 6.95}
    },
    {
      "id": 5,
      "name": "Chicken and Cabbage Eggrolls with hot & sour dipping sauce",
      "variant": {"price": 6.95}
    }
  ],
  "ENTREES": [
    {
      "id": 6,
      "name":
          "Farfalle Pasta with Braised Pork in Tomato Cream – capers butternut squash kale",
      "variant": {"price": 12.95}
    },
    {
      "id": 7,
      "name":
          "Stout Braised Bratwurst - horseradish mashed potatoes roasted root veggies grilled onion",
      "variant": {"price": 13.95}
    },
    {
      "id": 8,
      "name":
          "Salmon & Crispy Tofu in Yellow Curry Sauce – vegetable sauté golden raisin chutney",
      "variant": {"price": 15.95}
    },
    {
      "id": 9,
      "name":
          "Sesame Shrimp – udon noodles ramen broth shiitake mushrooms bean sprouts scallions",
      "variant": {"price": 13.95}
    }
  ],
  "SANDWICHES": [
    {
      "id": 10,
      "name": "Turkey & Avocado – with tomato",
      "subcategroy": "cold",
      "variant": {"half": 7.95, "full": 9.25}
    },
    {
      "id": 11,
      "name": "Pub Club – turkey, bacon, lettuce, tomato",
      "subcategroy": "cold",
      "variant": {"half": 7.95, "full": 9.25}
    },
    {
      "id": 12,
      "name": "Rare Roast Beef & Swiss – sweet-hot mustard, lettuce, red onion",
      "subcategroy": "cold",
      "variant": {"half": 7.95, "full": 9.25}
    },
    {
      "id": 13,
      "name": "Veggie – pepper jack, avocado, sprout, tomato",
      "subcategroy": "cold",
      "variant": {"half": 7.95, "full": 9.25}
    },
    {
      "id": 14,
      "name":
          "Southwest Chicken Breast Grilled Onion, Poblano Pepper, Tomato, Lettuce, Jack Cheese",
      "subcategroy": "hot",
      "variant": {"price": 9.50}
    },
    {
      "id": 15,
      "name":
          "Portobello Fresh Mozzarella Caramelized Onion, Roasted Pepper, Tomato, Field Greens, Basil Aioli",
      "subcategroy": "hot",
      "variant": {"price": 9.50}
    },
    {
      "id": 16,
      "name": "Chipotle BBQ Pork Sandwich with Pickled Jalapeño Slaw",
      "subcategroy": "hot",
      "variant": {"price": 9.50}
    },
    {
      "id": 17,
      "name": "Bacon Burger* Swiss, Lettuce, Tomato",
      "subcategroy": "hot",
      "variant": {"price": 9.25}
    },
    {
      "id": 18,
      "name":
          "Mexi Burger* Pepper Relish, Pepper Jack, Tomato, Lettuce, Guacamole",
      "subcategroy": "hot",
      "variant": {"price": 9.25}
    },
    {
      "id": 19,
      "name":
          "Herb Marinated Top Sirloin* Crimini Mushrooms, Caramelized Onion, Gorgonzola, Basil Aioli, Served Open Faced on Focaccia",
      "subcategroy": "hot",
      "variant": {"price": 10.95}
    },
    {
      "id": 20,
      "name":
          "Roast Beef with Ancho Au Jus Jack Cheese, Grilled Onions, Served on Crumb Bros. Baguette",
      "subcategroy": "hot",
      "variant": {"price": 9.75}
    },
    {
      "id": 21,
      "name":
          "Blackened Catfish Creole Peppers & Onions, Fresh Herb Aioli, Served on house-made Sourdough",
      "subcategroy": "hot",
      "variant": {"price": 9.75}
    }
  ],
  "SOUP & SALAD COMBOS": [
    {
      "name": "French Onion or Soup of the Day",
      "id": 22,
      "variant": {
        "price": 4.95,
      }
    },
    {
      "name": "French Onion or Soup of the Day Combos",
      "id": 23,
      "variant": {
        "with small green salad, fresh fruit or house pasta": 7.25,
        "with half pasta of the day": 8.75
      }
    }
  ],
  "FAJITAS": [
    {
      "id": 25,
      "name": "Chicken Onions, Poblano and Bell Peppers, Guacamole, Two Salsas",
      "variant": {"price": 10.95}
    },
    {
      "id": 26,
      "name":
          "Sirloin Steak, Onions, Poblano and Bell Peppers, Carrots, Onion, Guacamole, Two Salsas",
      "variant": {"price": 10.95}
    }
  ],
  "TACOS": [
    {
      "id": 27,
      "name":
          "Beer Battered Fish with Jalapeño Remoulade, Roasted Salsa, Cabbage",
      "variant": {"price": 9.95}
    },
    {
      "id": 28,
      "name": "Carne Asada (marinated sirloin) with Guacamole, Tomatillo Salsa",
      "variant": {"price": 9.95}
    },
    {
      "id": 29,
      "name": "Citrus Marinated Chicken with Guacamole, Tomatillo Salsa",
      "variant": {"price": 9.95}
    },
    {
      "id": 30,
      "name":
          "Grilled Veggie with Zucchini, Yellow Squash, Bell Peppers, Onion, Guacamole, Tomatillo Salsa",
      "variant": {"price": 9.95}
    }
  ],
  "ENCHILADAS": [
    {
      "id": 31,
      "name": "Choice of Beef, Chicken, Cheese or Veggie",
      "variant": {"uno": 8.50, "dos": 9.95, "tres": 11.50}
    },
    {
      "id": 32,
      "name":
          "Chili Relleno Stuffed with Jack Cheese & Corn Glazed Yam, Chayote Squash Succotash, Red Chili Sauce",
      "variant": {"price": 9.95}
    },
    {
      "id": 33,
      "name":
          "Pepita Crusted Salmon with Chipotle Glaze – chevre whipped yams, jicama slaw, tomatillo sauce",
      "variant": {"price": 10.95}
    }
  ],
  "QUICHE": [
    {
      "id": 34,
      "name":
          "Bacon, Swiss, Mushroom, Zucchini and Mushroom Quiche Choice of Fresh Fruit or Green Salad",
      "variant": {"price": 8.95}
    }
  ],
  "GREEN SALADS": [
    {
      "id": 35,
      "name":
          "Grilled Red Trout Lentils, Tomatoes, Cukes, Green Beans, Red Bells, Almonds, Sundried Tomato Vinaigrette",
      "variant": {"price": 10.95}
    },
    {
      "id": 36,
      "name":
          "Smoked Turkey Cheese Tortellini, Bacon, Tomato, Cucumber, Egg, Black Bean-Corn Salsa, Avocado",
      "variant": {"price": 9.95}
    },
    {
      "id": 37,
      "name":
          "Asian Grilled Chicken Snow Peas, Carrot Slaw, Red Bells, Water Chestnut, Peanuts, Baby Corn, Cilantro, Cukes, Spicy Peanut Dressing",
      "variant": {"price": 10.50}
    },
    {
      "id": 38,
      "name":
          "Southwest Grilled Chicken Tomato, Guacamole, pepitas, Jicama, Corn & Black Bean Salsa, Orange Wedges, Spicy Citrus Vinaigrette",
      "variant": {"price": 10.50}
    },
    {
      "id": 39,
      "name":
          "Mediterranean Italian Sausage, Artichoke Hearts, Green Beans, Roma Tomato, Kalamatas, Red Onion, Cucumber, Croutons, Parmesan, Fresh Mozzarella, Gorgonzola Vinaigrette",
      "variant": {"price": 9.95}
    },
    {
      "id": 40,
      "name":
          "Grilled Salmon Artichoke tapenade, shredded kale, corn, radish, parmesan crisps",
      "variant": {"price": 11.50}
    }
  ]
};
