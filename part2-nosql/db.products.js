db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});