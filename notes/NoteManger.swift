//
//  NoteManger.swift
//  notes
//
//  Created by Antonio Hung on 6/17/14.
//  Copyright (c) 2014 Dark Bear Interactive. All rights reserved.
//

import Foundation

let NoteManagerSingletonInstance = NoteManager()

class NoteManager  {
    
    var notes = Note[]()
    
    class var sharedInstance : NoteManager {
    return NoteManagerSingletonInstance
    }
    

    func saveNotes()
    {
        let swiftArray = notes as AnyObject[]
        if let downcastedSwiftArray = swiftArray as? Note[] {
            let dataObject = NSKeyedArchiver.archivedDataWithRootObject(downcastedSwiftArray)
            NSUserDefaults.standardUserDefaults() .setObject(dataObject, forKey:"notes")
        }
    }
    
    func loadNotes() -> Note[]
    {
        if let dataObject : AnyObject = NSUserDefaults.standardUserDefaults().valueForKey("notes")
        {
            notes =   NSKeyedUnarchiver.unarchiveObjectWithData(dataObject as NSData) as Note[]!
            return notes
            
        }
        return Note[]()
    }
}