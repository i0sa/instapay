# InstaPay (Swift)
A simple app for completing transactions using **PayTaps** iOS SDK

# Structure
Application is built using MVC, due to its minimality, and follows the clean code principles to provide a high quality, and dynamic codebase

# Payment
The applications follows two types of transactions that can be proceeded, using PaymentViewController
- Normal SDK credit card popup
- A tokenization integration ( a one-click payment solution via API )

they both conform to *PaymentStateDelegate* protocol, which informs about the state changes of the payment
# KeyChain
Keychain is used to store tokenizable user details (email, password and token)
## Form Builder
Form Builder is a custom made component that makes it easy to create forms as it comes with highly customizable and abstracted options such as

- FormItem
-- FormItemUI
- FormValidable

And comes with 3 different inputs types

- FormTextFieldCell
- FormTextViewCell
- FormDropDownCell

A form is used in checkout main screen, as in "CheckoutForm.swift", it is responsible for all details related to this form that can be later integrated with 'UITableView'.. checkout form comes with an abstracted configurator called
**CheckoutFormConfigurator** : This is an enum-based listed of all inputs, and conforms to CaseIterable protocol, that the form iterates through them to fetch its *FormItem* class of each

