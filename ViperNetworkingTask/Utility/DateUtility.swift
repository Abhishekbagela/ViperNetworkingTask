//
//  DateUtility.swift
//  ViperNetworkingTask
//
//  Created by Abhishek Bagela on 25/04/26.
//

import Foundation

struct DateUtility {
    
    static let shared = DateUtility()
    
    /**
     yyyy-MM-dd    2025-04-30
     dd/MM/yyyy    30/04/2025
     MMM d, yyyy    Apr 30, 2025
     HH:mm:ss    09:41:02 (24-hour)
     h:mm a    9:41 AM (12-hour)
     EEEE    Wednesday (Full weekday)
     */
    
    
    /// FormateType - Different date formate types
    enum FormateType: String {
        /// DD/MM/YYYY
        //MARK: DD/MM/YYYY
        case DD_MM_YYYY = "dd/MM/yyyy"
        /// DD/MM/YY
        case DD_MM_YY = "dd/MM/yy"
        /// MM_DD_YYYY
        case MMM_d_yyyy = "MMM d, yyyy"
        /// DD_MM_YYYY
        case MMM_d_time_AM = "MMM d, h:mm a"
    }
    
    func formateTo(type: FormateType, date: Date) -> String {
        let formater = DateFormatter()
        formater.dateFormat = type.rawValue
        formater.timeZone = .current
        formater.calendar = .current
        formater.dateStyle = .medium        
        return formater.string(from: date)
    }
    
//    /// DD/MM/YYYY
//    /// - Parameter date: Date
//    /// - Returns: String
//    func formateDateTo_DDMMYYYY(_ date: Date) -> String {
//        formateDateTo(type: .DD_MM_YYYY, date: date)
//    }
//    
//    /// DD/MM/YY
//    /// - Parameter date: Date
//    /// - Returns: String
//    func formateiToDD_MM_YY(_ date: Date) -> String {
//        formateDateTo(type: .DD_MM_YY, date: date)
//    }
//    
//    /// MM_DD_YYYY - May 09 1998
//    /// - Parameter date: Date
//    /// - Returns: String
//    func formateDateTo_May_09_1998(_ date: Date) -> String {
//        formateDateTo(type: .MM_DD_YYYY, date: date)
//    }
//    
//    /// DD_MM_YYYY - 09 May 1998
//    /// - Parameter date: Date
//    /// - Returns: String
//    func formateDateTo_09_May_1998(_ date: Date) -> String {
//        formateDateTo(type: .type_four, date: date)
//    }
    
}
