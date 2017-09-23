//
//  AppData.swift
//  AskAway3
//
//  Created by Mohammad Shahzaib Ather on 2017-09-08.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

import UIKit
import Firebase

class AppData: NSObject {

    static let sharedInstance = AppData()
    
    public var dataNode: DatabaseReference
    public var usersNode: DatabaseReference
    
    public override init() {
       
        FirebaseApp.configure()
        dataNode = Database.database().reference().child("data")
        usersNode = Database.database().reference().child("users")
    }
    
    
    
    func readSomethingOffTheCloud()
    {
        let userID = Auth.auth().currentUser?.uid;
        
        dataNode.child(userID!).observeSingleEvent(of: .value, with:
            { (snapshot) in
                let value = snapshot.value as? NSDictionary;
                
                if ( value!["entry_Dict"] != nil)
                {
                    let dict : [String : String] = value!["entry_Dict"] as! Dictionary <String, String>;
                    
                    print(dict)
                    let readName : String = dict["name"]!
                    let readPlace : String = dict["place"]!
                    let readRole : String = dict["role"]!
                }
        })
        { (error) in
            
        }
    }
    
    
    func saveSomethingOnCloud <T> (entry: T)
    {
        if (Auth.auth().currentUser == nil) {
            return
        }
        
        let uid: String = Auth.auth().currentUser!.uid
        
        if type(of: entry) == String.self
        {
            dataNode.child(uid).child("entry_String").setValue(entry);
        }
        else if type(of: entry) == Dictionary <String, Any>.self
        {
            dataNode.child(uid).child("entry_Dict").setValue(entry);
        }
    }
    
    
    func deleteSomethingOffTheCloud () {
        if (Auth.auth().currentUser == nil) {
            return
        }
        
        let uid: String = Auth.auth().currentUser!.uid
        
        
        let deleteNode : DatabaseReference = dataNode.child(uid).child("entry_Dict");
        deleteNode.removeValue();
    }
    
    
    func changeValueOnCloud () {
        if (Auth.auth().currentUser == nil) {
            return
        }
        
        let uid: String = Auth.auth().currentUser!.uid
        
        let newSaveVal: String = "New Ding";
        dataNode.child(uid).child("entry_String").setValue(newSaveVal);
        
    }
    
    
    
    func registerMethod(inpName: String, inpEmail: String, inpPassword: String)   {
        Auth.auth().createUser(withEmail: inpEmail, password: inpPassword) {
            (user, error) in
            if (error == nil) {
                let changeRequest = user?.createProfileChangeRequest();
                changeRequest?.displayName = inpName;
                
                changeRequest?.commitChanges(completion: {
                    (profError) in
                    if ( profError == nil) {
                        let userDict : [String : String] = ["name" : inpName,
                                                            "email" : inpEmail,
                                                            "uid" : user!.uid];
                        
                        self.usersNode.child(user!.uid).setValue(userDict)
                    }
                    else  {
                        
                    }
                });
            }
            else {
                
            }
        }
    }
    
    
    func loginMethod(inpEmail: String, inpPassword: String) {
        Auth.auth().signIn(withEmail: inpEmail, password: inpPassword) {
            (user, error) in
            if ( error == nil) {
                
            }
        }
    }
    
    
    func logoutMethod () {
        let firebaseAuth = Auth.auth();
        do {
            try firebaseAuth.signOut();
        }
        catch _ as NSError  {
            
        }
    }

}
