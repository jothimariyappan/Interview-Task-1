//
//  Preview.swift
//  Interviewproject1
//
//  Created by Jo on 17/01/23.
//

import UIKit

class Preview: UIViewController {
    var dc3 = Model()
// MARK: - EMPTY VARIABLES
    
    var imgPROFILE = UIImage()
    var name = String()
    var email = String()
    var phone = Int()
   var signpic = UIImage()
    
    
// MARK: - OUTLETS
    
    @IBOutlet var imgpro: UIImageView!
    @IBOutlet var lblname: UILabel!
    @IBOutlet var lblemail: UILabel!
    @IBOutlet var lblphone: UILabel!
    @IBOutlet var lblsigname: UILabel!
    @IBOutlet var imgsign: UIImageView!
    // MARK: - VIEWDIDLOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.isNavigationBarHidden = true
        dc3.fetch()
        lblname.text = name
        lblemail.text = email
        lblphone.text = "\(phone)"
        lblsigname.text = name
        imgpro.image = imgPROFILE
        imgsign.image = signpic
        
//        let pic = dc3.fetchdata.Imagesign as? NSData
//        imgdata.append(UIImage(data: pic as! Data )!)
//        imgsign.image = imgdata

        // Do any additional setup after loading the view.
    }
    


// MARK: - Navigation

    @IBAction func btnBackuser(_ sender: UIButton) {
    
        self.navigationController?.popViewController(animated: true)
    }
    
}
