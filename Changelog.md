## 2.5.0
- Fix some stuff in the Oauth logic (thanks @michielverkoijen)
- Add division class (thanks @michielverkoijen)
- Remove mandatory attribute from SalesInvoice (thanks @michielverkoijen)
- Add configurable logger (thanks @jdlombardozzi)
- Add refresh token logic so you do not always have to reauthorize (thanks @jdlombardozzi)
- Fix all rubocop issues (thanks @jdlombardozzi)

## 2.4.2
- Add thread safety

## 2.4.1

- Update gem versions of mechanize and faraday

## 2.4.0

- Add security measures for constantizing Exact Resources thanks to @confiks
- Add possibility to filter on Date or Time. Added test for BankEntry. thanks to @confiks
- Custom exception shouldn't inherit Exception. Use StandardError instead. thanks to @confiks
- Let go of unecessary dev dependency versions

## 2.3.3

- Add bank accounts resource

## 2.3.2

- Fix ruby_dep dependency
- Add SaleItemPrices Resource
- Add some missing attributes, thanks @Dahie and @Korstiaan
- Make it easier to setup more diverse exact requests
These changes make the requests to exact slightly more flexible to configure.
This is useful to reuse the Request class also connecting to the XML-API of exact. Also thanks to @Dahie (f7d3e6d7481544ef9148f52175bc1a1d31a16e8e)

## 2.3.1

- Fix typo in bank entry
- Add GL_account to invoice line


## 2.3.0

- add PaymentCondition resource (fb072e97394bdefd499d432336f7303d4befc4b0)

## 2.2.2

- Fix rubocop issues and specs

## 2.2.1

- Fix date sanitizing (608883148a367d2388b9daa9b454ac6b2dbbf10d)
- Fix `order_by` filter (ea643593304bba56a73b8263a601526679baaa5a)

## 2.2.0

- Updates to the README
- New resources General Journal Entry and General Journal Entry Line

## 2.1.0

- Allow filtering with 'greater_than' and 'less_than'
- Set proper endpoint for the AgingReceivablesList

## 2.0.0

- Pagination for resources
- Implement receivables and aging receivables list resources
- Filter by array

## 1.0.0

- Use 'proper' date format for ExactOnline
- Don't add quotes to integers when filtering
- Raise error on invalid request
- Add project and time tracking functionality

## 0.2.0

- First official release, used within Hoppinger, basic functionality and resources Hoppinger needed.

## 0.1.0

- Dev release
