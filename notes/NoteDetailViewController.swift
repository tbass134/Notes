//
//  NoteDetailViewController.swift
//  notes
//
//  Created by Tony Hung on 6/8/14.
//  Copyright (c) 2014 Dark Bear Interactive. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var noteText : UITextView!
    @IBOutlet var dateText : UILabel!
    var theNote:Note!
    
    var theText:String?
    
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, theText:String) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    init(coder aDecoder: NSCoder?)
    {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let someNote = theNote? {
            let df = NSDateFormatter()
            df.dateStyle = NSDateFormatterStyle.ShortStyle
            df.timeStyle = NSDateFormatterStyle.NoStyle
            noteText.text = df.stringFromDate(someNote.dateAdded)
            noteText.text = someNote.noteText + "\n Updated On:" + df.stringFromDate(someNote.dateAdded)

            
        }
        
        // Do any additional setup after loading the view.
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Bordered, target: self, action: "goBack:")
        self.navigationItem.leftBarButtonItem = backButton;
        noteText.becomeFirstResponder()

    }

    func goBack(item:UIBarButtonItem)
    {
        self.navigationController .popViewControllerAnimated(true);
    }
    /*
        Text View Delegate
    */
    func textView(textView: UITextView!, shouldChangeTextInRange range: NSRange, replacementText text: String!) -> Bool
    {
        if(text == "\n")
        {
            if let someNote = theNote? {
                someNote.noteText = textView.text
                someNote.dateAdded = NSDate.date()
            }
            else {
                var note:Note! = Note(noteText: textView.text, dateAdded: NSDate.date())
                appDelegate.notes.append(note);
            }
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
