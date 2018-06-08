//
//  Expense.swift
//  Expense
//
//  Created by xinrui Yang on 6/8/18.
//  Copyright © 2018 xinrui Yang. All rights reserved.
//

import UIKit

class Expense{
    var title: String
    var amount: Double
    var date: Date
    
    init?(title:String, amount:Double, date:String){
        
        guard !title.isEmpty else{
            return nil
        }
        
        self.title = title
        self.amount = amount
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy HH:mm"
        self.date = formatter.date(from: date)!
    }
}
