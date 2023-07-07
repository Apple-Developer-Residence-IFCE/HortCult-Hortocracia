import UIKit
var formatedToday: Date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "MM/dd/yyyy"
let formattedToday = formatter.string(from: formatedToday)
print(formattedToday)

if let date = formatter.date(from: formattedToday) {
    print(date.formatted())// Imprime a data convertida de volta para o tipo Date
    print(type(of: date))
} else {
    print("Falha ao converter a string em uma data")
}

//formatedToday = formatter.date(from: String(formatedToday.formatted().prefix(9)))!
//print(formatedToday.formatted())

//datas = Calendar.current.date(byAdding: .day, value: 1, to: formatDate ?? Date())!
//print(type(of: formatDate))
//print(datas)
//


//let formatter = DateFormatter()
//formatter.dateFormat = "MM/dd/yyyy"

var nextDate: Date = Date()
nextDate = formatter.date(from: String(nextDate.formatted().prefix(10))) ?? Date()
nextDate = Calendar.current.date(byAdding: .day, value: 4, to: nextDate)!
