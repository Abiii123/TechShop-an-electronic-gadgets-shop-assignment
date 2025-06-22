using System;

namespace TechShop
{
    public class Orders
    {
        private int orderID;
        private int customerID;
        private DateTime orderDate;
        private decimal totalAmount;
        private string status;

        public int OrderID { get => orderID; set => orderID = value; }
        public int CustomerID { get => customerID; set => customerID = value; }
        public DateTime OrderDate { get => orderDate; set => orderDate = value; }
        public decimal TotalAmount { get => totalAmount; set => totalAmount = value; }
        public string Status { get => status; set => status = value; }

        public Orders(int orderID, int customerID, DateTime orderDate, decimal totalAmount, string status)
        {
            OrderID = orderID;
            CustomerID = customerID;
            OrderDate = orderDate;
            TotalAmount = totalAmount;
            Status = status;
        }

        public void CalculateTotalAmount(decimal productPrice, int quantity)
        {
            TotalAmount = productPrice * quantity;
        }

        public void GetOrderDetails()
        {
            Console.WriteLine("---- Order Details ----");
            Console.WriteLine($"OrderID: {OrderID}, CustomerID: {CustomerID}, Date: {OrderDate}, Total: {TotalAmount}, Status: {Status}");
        }

        public void UpdateOrderStatus(string newStatus)
        {
            Status = newStatus;
            Console.WriteLine("Order status updated.");
        }

        public void CancelOrder()
        {
            Status = "Cancelled";
            Console.WriteLine("Order cancelled.");
        }
    }
}
