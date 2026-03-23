use("assignment_db");

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});