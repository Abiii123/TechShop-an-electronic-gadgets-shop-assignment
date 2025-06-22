using System;


namespace Techshop
{
    public class Products
    {
        private int productID;
        private string productName;
        private string description;
        private decimal price;
        private string category;
        private int quantityInStock;

        public int ProductID { get { return productID; } set { productID = value; } }
        public string ProductName { get { return productName; } set { productName = value; } }
        public string Description { get { return description; } set { description = value; } }
        public decimal Price { get { return price; } set { price = value; } }
        public string Category { get { return category; } set { category = value; } }
        public int QuantityInStock { get { return quantityInStock; } set { quantityInStock = value; } }

        public Products(int productID, string productName, string description, decimal price, string category, int quantityInStock)
        {
            ProductID = productID;
            ProductName = productName;
            Description = description;
            Price = price;
            Category = category;
            QuantityInStock = quantityInStock;

        }

        public void GetProductDetails()
        {
            Console.WriteLine("Product Details");
            Console.WriteLine($"ID: {ProductID},Name: {ProductName},Description: {Description},Price: {Price},Category: {Category},Stock: {QuantityInStock}");
        }
        public void UpdateProductInfo(string description , decimal price)
        {
            Description = description;
            Price = price;
            Console.WriteLine("Product info");
        }
        public bool IsProductInStock() => QuantityInStock > 0;
    }
}
