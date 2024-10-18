## PROBLEM STATEMENT ##

Coding Challenge: Store checkout

Store sells 3 products: Code | Name | Price
1. VOUCHER | Voucher | 5.00 $
2. TSHIRT | T-Shirt | 20.00 $
3. MUG | Coffee Mug | 7.50 $

There can be discounts/pricing rules for a product. Ideally your code should have the ability to add multiple pricing rules for a product but only the best should apply.
An example of rules:

2-for-1 promotions (buy two of the same product, get one free), and would like for there to be a 2-for-1 special on VOUCHER items.

There can also be discounts on bulk purchases (buying x or more of a product, the price of that product is reduced), and demands that if you buy 3 or more TSHIRT items, the price per unit should be 19.00 $.

Your code should be able to cater at least these 2 type of rules with configurable values. For eg. instead of 2 for 1, we can make 3 for 1 or 5 for 2 offers as well or for 4 shirts, price of each tshirt becomes 15$ and similar.
Checkout process allows for items to be scanned in any order, and should return the total amount to be paid. The interface for the checkout process may look like this (ruby):

co = Checkout.new
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("TSHIRT")
price = co.total

This is just an example, you can have your own class and method names, your own way to do it.
Plain ruby implementation is preferable than Rails. But it can be done as a rails project as well if you are not comfortable with plain ruby implementation.
Products should be configurable with a JSON file. It can be added as seed data if Rails being used.

Examples based on above pricing rules:
1. Items: VOUCHER, TSHIRT, MUG
Total: 32.50 $
2. Items: VOUCHER, TSHIRT, VOUCHER
Total: 25.00 $
3. Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT
Total: 81.00 $
4. Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT
Total: 74.50 $

The code submission should:
1. Demonstrate OOP
2. Be easy to grow and easy to add new functionality.
3. Clean, minimal, well-designed code
4. Have a Readme file explaining the setup to run the solution and tests and why certain things are included and others are left out if any.
5. Bonus - Test cases
6. No 3rd party gems etc to be used apart from maybe test cases.