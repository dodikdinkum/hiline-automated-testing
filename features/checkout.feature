Feature: Checkout Process
	As a customer
	I can add a product to my cart
	Which allows me to purchase the product

@javascript
Scenario: Add product to cart and then checkout
	Given I am on "/shop/chocolate-donut/"
	When I press "Add to cart"
		And I wait for 5 seconds
		Then I should see "Successfully Added to Your Cart"
	Given I am on "/checkout/"
	When I follow "Continue as guest"
		And I wait for 3 seconds
		Then I should see "NOT A MEMBER?"
	When I fill in "email-guest" with "era@gmail.com"
		And I press "Continue as Guest"
		Then I should see "Shipping Address"
	When I fill in the following:
		# Shipping
		| shipping_first_name   | CHRIS 		 |
		| shipping_last_name    | NISWANDEE  	 |
		| shipping_address_1    | 795 E DRAGRAM  |
		| shipping_city  		| TUCSON         |
		| shipping_postcode     | 85705 		 |
		And I select "AZ" from "shipping_state"
		And I click on the element with css selector "a.btn-billing"
		And I wait for 10 seconds
		Then I should see "Payment Information"
	When I fill in the following:
		# Billing
		| wc-autoship-braintree-cc-number | 5555555555554444 |
		| wc-autoship-braintree-cc-cvv    | 567  	 	     |
		And I select "07" from "wc_autoship_braintree_cc_expiration_month"
		And I select "2018" from "wc_autoship_braintree_cc_expiration_year"
		And I press "Submit Order"
		And I wait for 5 seconds
		And I press "Submit Order"
		And I wait for 30 seconds
		Then I should see "THANK YOU"
