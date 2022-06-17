import Foundation

let json = """
 [
   {
     "id": "1",
     "type": "Banking",
     "name": "Basic Savings",
     "amount": 929466.23,
     "createdDateTime" : "2010-06-21T15:29:32Z"
   },
   {
     "id": "2",
     "type": "Banking",
     "name": "No-Fee All-In Chequing",
     "amount": 17562.44,
     "createdDateTime" : "2011-06-21T15:29:32Z"
   },
  ]
"""

enum AccountType: String, Codable {
    case Banking
    case CreditCard
    case Investment
}

struct Account: Codable {
    // 🕹 Game on here
    var id: String
    var type: AccountType
    var name: String
    var amount: Decimal
    var createdDateTime: Date
}

enum NetworkError: Error {
    case serverError
    case decodingError
}

let jsonData = json.data(using: .utf8)!
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601
let result = try! decoder.decode([Account].self, from: jsonData)
print(result)
