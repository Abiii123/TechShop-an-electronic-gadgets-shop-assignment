using System;

namespace TechShop
{
    public class OrderDetails
    {
        private int orderDetailID;
        private int orderID;
        private int productID;
        private int quantity;
        private decimal productPrice;

        public int OrderDetailID { get => orderDetailID; set => orderDetailID = value; }
        public int OrderID { get => orderID; set => orderID = value; }
        public int ProductID { get => productID; set => productID = value; }
        public int Quantity { get => quantity; set => quantity = value; }
        public decimal ProductPrice { get => productPrice; set => productPrice = value; }

        public OrderDetails(int orderDetailID, int orderID, int productID, int quantity, decimal productPrice)
        {
            OrderDetailID = orderDetailID;
            OrderID = orderID;
            ProductID = productID;
            Quantity = quantity;
            ProductPrice = productPrice;
        }

        public decimal CalculateSubtotal() => Quantity * ProductPrice;

        public void GetOrderDetailInfo()
        {
            Console.WriteLine("---- Order Detail Info ----");
            Console.WriteLine($"OrderDetailID: {OrderDetailID}, OrderID: {OrderID}, ProductID: {ProductID}, Quantity: {Quantity}, Price: {ProductPrice}, Subtotal: {CalculateSubtotal()}");
        }

        public void UpdateQuantity(int newQuantity)
        {
            Quantity = newQuantity;
            Console.WriteLine("Quantity updated.");
        }

        public decimal AddDiscount(decimal discountPercentage)
        {
            decimal subtotal = CalculateSubtotal();
            decimal discount = subtotal * (discountPercentage / 100);
            decimal finalTotal = subtotal - discount;
            Console.WriteLine($"Discount applied ({discountPercentage}%): {finalTotal}");
            return finalTotal;
        }
    }
}
