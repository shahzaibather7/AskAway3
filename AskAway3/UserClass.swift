//
//  UserClass.swift
//  AskAway3
//
//  Created by Mohammad Shahzaib Ather on 2017-09-08.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

import Foundation

class UserClass: NSObject, NSCoding {
    var name: String = "";
    var email: String = "";
    var uid: String = "";
    
    init(name:String,  email:String, uid:String) {
        self.name = name
        self.email = email
        self.uid = uid
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let email = aDecoder.decodeObject(forKey: "email") as! String
        let uid = aDecoder.decodeObject(forKey: "uid") as! String
        
        self.init(name: name, email: email, uid: uid)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.uid, forKey: "uid")
    }
}
