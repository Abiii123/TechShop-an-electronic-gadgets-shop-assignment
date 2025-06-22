using System;


namespace Techshop
{
    public class Inventory
    {
        private int inventoryID;
        private int productID;
        private int quantityInStock;
        private DateTime leastStockUpdate;
        private decimal productPrice;
        private string productName;

        public int InventoryID { get {  return inventoryID; } set { inventoryID = value; } }
        public int ProductID { get { return productID;} set { productID = value; } }
        public int QuantityInStock { get { return quantityInStock; } set { quantityInStock = value; } }
        public DateTime LeastStockUpdate { get { return leastStockUpdate; } set { leastStockUpdate = value; } }
        public decimal ProductPrice { get { return productPrice; } set { productPrice = value; } }
        public string ProductName { get { return productName; } set {productName = value; } }

        public Inventory(int inventoryID, int productID, int quantityInStock, DateTime leastStockUpdate, decimal productPrice, string productName)
        {
            InventoryID = inventoryID;
            ProductID = productID;
            QuantityInStock = quantityInStock;
            LeastStockUpdate = leastStockUpdate;
            ProductPrice = productPrice;
            ProductName = productName;
        }

        public void AddToInventory(int quantity)
        {
            QuantityInStock += quantity;
            LeastStockUpdate = DateTime.Now;
            Console.WriteLine($"{quantity} units added to inventory.");
        }

        public void RemoveFromInventory(int quantity)
        {
            QuantityInStock -= quantity;
            LeastStockUpdate = DateTime.Now;
            Console.WriteLine($"{quantity} units removed from inventory.");
        }

        public decimal GetInventoryValue() => QuantityInStock * ProductPrice;

        public void GetInventoryInfo()
        {
            Console.WriteLine("---- Inventory Info ----");
            Console.WriteLine($"InventoryID: {InventoryID}, Product: {ProductName}, Quantity: {QuantityInStock}, Updated: {LeastStockUpdate}, Value: {GetInventoryValue()}");
        }
    }
}
