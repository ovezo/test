//
//  Payment.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import Foundation

class Payment {
    var description, currency: String?
    var created: Int?
    var amount: Double?
    
    init(dict: [String: Any]?) {
        description = dict?["desc"] as? String
        currency = dict?["currency"] as? String
        created = dict?["created"] as? Int
        amount = dict?["amount"] as? Double
    }
    
    public func getDate() -> String{
        if let tms = created {
            let date = Date(timeIntervalSince1970: Double(tms))
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "MMM dd YYYY, hh:mm"
//            dateFormatter.timeZone = NSTimeZone(name: timezone) as TimeZone!
            
            return dateFormatter.string(from: date)
        }
        
        return ""
        
    }
}
