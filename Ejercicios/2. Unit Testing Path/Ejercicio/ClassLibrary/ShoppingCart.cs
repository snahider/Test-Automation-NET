﻿namespace ClassLibrary
{
    using System.Collections.Generic;
    using System.Linq;

    public class ShoppingCart
    {
        public ShoppingCart()
        {
            Items = new List<ShoppingCartItem>();
        }

        public List<ShoppingCartItem> Items { get; set; }

        public decimal TaxAmount { get; set; }

        public int TotalItems
        {
            get
            {
                return this.Items.Sum(x => x.Quantity);
            }
        }

        public decimal SubTotal
        {
            get
            {
                return Items.Sum(x => x.LineTotal);
            }
        }

        public decimal Total
        {
            get
            {
                return SubTotal + TaxAmount;
            }
        }

        public void AddItem(Product product, int quantity)
        {
            var item = new ShoppingCartItem(product, quantity);
            Items.Add(item);
        }

        public void RemoveItem(string sku)
        {
            var itemToRemove = FindItem(sku);
            Items.Remove(itemToRemove);
        }

        public void ClearItems()
        {
            this.Items.Clear();
        }

        public ShoppingCartItem FindItem(string sku)
        {
            return (from items in Items
                    where items.Product.SKU == sku
                    select items).SingleOrDefault();

        }
    }
}