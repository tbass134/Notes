//
//  Note.swift
//  notes
//
//  Created by Tony Hung on 6/14/14.
//  Copyright (c) 2014 Dark Bear Interactive. All rights reserved.
//

import Foundation

protocol NSCoding {
    
}
class Note : NSObject {
    var noteText:String = ""
    var dateAdded:NSDate = NSDate.date()
    
    // NSCoding
    init(noteText:String, dateAdded:NSDate)
    {
        super.init()
        self.noteText = noteText;
        self.dateAdded = dateAdded
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(noteText, forKey: "noteText");
        aCoder.encodeObject(dateAdded, forKey: "dateAdded");
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init();
        self.noteText = aDecoder.decodeObjectForKey("noteText") as String
        self.dateAdded = aDecoder.decodeObjectForKey("dateAdded") as NSDate
    }
    
}