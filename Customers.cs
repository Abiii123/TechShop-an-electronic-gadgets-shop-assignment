using System;


namespace Techshop
{
    public class Customers
    {
        private int customerID;
        private string firstName;
        private string lastName;
        private string email;
        private string phone;
        private string address;
        private int orderCount;

        public int CustomerID { get { return customerID; } set { customerID = value; } }
        public string FirstName { get { return firstName; } set { firstName = value; } }
        public string LastName { get { return lastName; } set { lastName = value; } }
        public string Email { get { return email; } set { email = value; } }
        public string Phone { get { return phone; } set { phone = value; } }
        public string Address {get{ return address; } set { address = value; } }
        public int OrderCount { get { return orderCount; } set { orderCount = value; } }

        public Customers(int customerID,string firstName,string lastName,string email,string phone,string address, int orderCount)
        {
            CustomerID = customerID;
            FirstName = firstName;
            LastName = lastName;
            Email = email;
            Phone = phone;
            Address = address;
            OrderCount = orderCount;
        }

        public int CalculateTotalOrders() => orderCount;

        public void GetCustomerDetails()
        {
            Console.WriteLine("Customer Details");
            Console.WriteLine($"ID: {CustomerID},Name: {FirstName}{LastName}, Email: {Email},Phone: {phone},Address: {Address},Orders: {orderCount};");
             
        }
        public void UpdateCustomerInfo( string email,string phone, string address)
        {
            Email = email;
            Phone = phone;
            Address = address;
            Console.WriteLine("Customer info updated.");
        }


        
     
    }
}
