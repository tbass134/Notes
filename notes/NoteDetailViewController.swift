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
    var theText:String?
    var notesIndex:Int!
    
    var isUpdating = false;
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

        if(theText){
            isUpdating = true
            self.noteText.text = theText
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
            if isUpdating {
                appDelegate.notes[notesIndex] = textView.text;
            }
            else {
                appDelegate.notes.append(textView.text);
            }
            textView .resignFirstResponder()
            return false
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
