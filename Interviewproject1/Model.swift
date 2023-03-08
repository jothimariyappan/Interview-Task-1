//
//  Model.swift
//  Interviewproject1
//
//  Created by Jo on 17/01/23.
//

import Foundation
import CoreData
import UIKit


class Model{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchdata = [Entity]()
    
    
    func save(FULLNAME : String , DOB : String , PHONE : Int16 , EMAIL : String , IMGPROFILE : Data , IMGSIGN : Data){
        let details = Entity(context: context)
        details.image = IMGPROFILE
        details.name = FULLNAME
        details.dob = DOB
        details.phone = PHONE
        details.email = EMAIL
        details.imagesign = IMGSIGN
        
        do{
           try context.save()
            print("OK")
        }catch{
            print("error")
        }
    }
    
    func fetch(){
        do{
            let fetchvalue = try context.fetch(Entity.fetchRequest())
            fetchdata = fetchvalue
            print(fetchvalue)
        }catch{
            print("error")
        }
        
    }
}
