using System;
using Techshop;

namespace TechShop
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("===== TechShop Full User Input Program =====\n");

            //Customer Input
            Console.WriteLine("Enter Customer Details:");

            Console.Write("Customer ID: ");
            int customerID = int.Parse(Console.ReadLine());

            Console.Write("First Name: ");
            string firstName = Console.ReadLine();

            Console.Write("Last Name: ");
            string lastName = Console.ReadLine();

            Console.Write("Email: ");
            string email = Console.ReadLine();

            Console.Write("Phone: ");
            string phone = Console.ReadLine();

            Console.Write("Address: ");
            string address = Console.ReadLine();

            Console.Write("Order Count: ");
            int orderCount = int.Parse(Console.ReadLine());

            Customers customer = new Customers(customerID, firstName, lastName, email, phone, address, orderCount);

            customer.GetCustomerDetails();
            Console.WriteLine($"Total Orders: {customer.CalculateTotalOrders()}");

            //Product Input
            Console.WriteLine("\nEnter Product Details:");

            Console.Write("Product ID: ");
            int productID = int.Parse(Console.ReadLine());

            Console.Write("Product Name: ");
            string productName = Console.ReadLine();

            Console.Write("Description: ");
            string description = Console.ReadLine();

            Console.Write("Price: ");
            decimal price = decimal.Parse(Console.ReadLine());

            Console.Write("Category: ");
            string category = Console.ReadLine();

            Console.Write("Quantity In Stock: ");
            int quantityInStock = int.Parse(Console.ReadLine());

            Products product = new Products(productID, productName, description, price, category, quantityInStock);
            product.GetProductDetails();

            //Order Input
            Console.WriteLine("\nEnter Order Details:");

            Console.Write("Order ID: ");
            int orderID = int.Parse(Console.ReadLine());

            Console.Write("Order Status: ");
            string status = Console.ReadLine();

            Orders order = new Orders(orderID, customer.CustomerID, DateTime.Now, 0, status);

            Console.Write("Enter quantity to calculate total order amount: ");
            int orderQuantity = int.Parse(Console.ReadLine());
            order.CalculateTotalAmount(product.Price, orderQuantity);
            order.GetOrderDetails();

            //OrderDetails Input
            Console.WriteLine("\nEnter Order Details for OrderDetails:");

            Console.Write("OrderDetail ID: ");
            int orderDetailID = int.Parse(Console.ReadLine());

            OrderDetails orderDetail = new OrderDetails(orderDetailID, order.OrderID, product.ProductID, orderQuantity, product.Price);

            orderDetail.GetOrderDetailInfo();
            Console.Write("Enter discount percentage: ");
            decimal discount = decimal.Parse(Console.ReadLine());
            decimal totalAfterDiscount = orderDetail.AddDiscount(discount);
            Console.WriteLine($"Total after discount: {totalAfterDiscount}");

            //Inventory Input
            Console.WriteLine("\nEnter Inventory Details:");

            Console.Write("Inventory ID: ");
            int inventoryID = int.Parse(Console.ReadLine());

            Inventory inventory = new Inventory(inventoryID, product.ProductID, quantityInStock, DateTime.Now, product.Price, product.ProductName);

            inventory.GetInventoryInfo();

            Console.Write("How many units to add to inventory? ");
            int addQty = int.Parse(Console.ReadLine());
            inventory.AddToInventory(addQty);
            inventory.GetInventoryInfo();

            Console.Write("How many units to remove from inventory? ");
            int removeQty = int.Parse(Console.ReadLine());
            inventory.RemoveFromInventory(removeQty);
            inventory.GetInventoryInfo();

            Console.WriteLine($"\nInventory Value: {inventory.GetInventoryValue()}");

            Console.WriteLine("\n All User Input Classes Tested Successfully!");
        }
    }
}
