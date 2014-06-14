//
//  NotesTableView.swift
//  notes
//
//  Created by Tony Hung on 6/8/14.
//  Copyright (c) 2014 Dark Bear Interactive. All rights reserved.
//

import UIKit
class NotesTableView: UITableViewController, UITableViewDataSource,UITableViewDelegate {
    
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    override func viewDidLoad()
    {
        var button = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: self, action: "addNote:")
        self.navigationItem.rightBarButtonItem = button
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        super.viewDidLoad()
    }
    override func viewDidAppear(animated: Bool)
    {
        println(appDelegate.notes)
        self.tableView .reloadData()
    }

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return appDelegate.notes.count
    }
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        let theNote = appDelegate.notes[indexPath.row]
        cell.textLabel.text = theNote.noteText
        return cell
    }
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.performSegueWithIdentifier("EditNote", sender: nil)
    }
    
    func addNote(item: UIBarButtonItem)
    {
        self.performSegueWithIdentifier("AddNote", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        if(segue.identifier == "EditNote")
        {
            let indexPath = self.tableView .indexPathForSelectedRow()
            let detail:NoteDetailViewController = segue.destinationViewController as NoteDetailViewController;
            let theNote = appDelegate.notes[indexPath.row]
            detail.theNote = theNote
        }
    }
    
}
