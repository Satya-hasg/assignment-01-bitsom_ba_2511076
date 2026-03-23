// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    product_id: "E1001",
    name: "Smartphone X",
    category: "Electronics",
    price: 45000,
    brand: "TechCorp",
    specifications: {
      ram: "8GB",
      storage: "128GB",
      battery: "5000mAh",
      warranty_years: 2
    },
    features: ["5G", "Fast Charging", "AMOLED Display"],
    ratings: {
      average: 4.5,
      reviews: 1200
    }
  },
  {
    product_id: "C2001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    price: 1200,
    brand: "FashionHub",
    sizes: ["S", "M", "L", "XL"],
    material: "Cotton",
    colors: ["Blue", "White", "Black"],
    stock: {
      warehouse: 150,
      store: 40
    },
    ratings: {
      average: 4.2,
      reviews: 300
    }
  },
  {
    product_id: "G3001",
    name: "Organic Milk",
    category: "Groceries",
    price: 60,
    brand: "FreshFarm",
    expiry_date: new Date("2024-12-20"),
    nutritional_info: {
      calories: 150,
      protein: "8g",
      fat: "7g"
    },
    packaging: {
      type: "Tetra Pack",
      volume: "1L"
    },
    available_units: [1, 2, 5]
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_id: "E1001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

// Reason:
// The category index improves performance for frequent category-based filtering,
// such as finding all Electronics or Groceries products.