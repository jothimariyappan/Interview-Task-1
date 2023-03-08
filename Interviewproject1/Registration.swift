//
//  Registration.swift
//  Interviewproject1
//
//  Created by Jo on 17/01/23.
//

import UIKit
import SwiftSignatureView

class Registration: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
// MARK: - OUTLETS - UIVIEW
    
    @IBOutlet var scl: UIScrollView!
    @IBOutlet var baseView: UIView!
    @IBOutlet var b1: BaseView!
    @IBOutlet var b2: BaseView!
    @IBOutlet var b3: BaseView!
    @IBOutlet var b4: BaseView!
    
// MARK: - OUTLETS -  INPUT DATA
    @IBOutlet var imgprofile: UIImageView!
    @IBOutlet var txtfullname: UITextField!
    @IBOutlet var txtDob: UITextField!
    @IBOutlet var txtemail: UITextField!
    @IBOutlet var txtphone: UITextField!
    @IBOutlet var signatureView:  SwiftSignatureView!
    
 // MARK: - INSTANCE
    
    var dc = Model()
    var photo = UIImagePickerController()
    var imgconvert : Data!
    var canVasView = UIImageView()
    
// MARK: - VARIABLES FOR SIGNATURE
    
    var imgconvert2 : Data!
    var croppedSignatureView = UIImageView()
    
    
    
 // MARK: - VIEWDIDLOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.layer.cornerRadius = 30
        baseView.layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]
        
        b1.layer.cornerRadius = b1.frame.size.height / 2
        b2.layer.cornerRadius = b2.frame.size.height / 2
        b3.layer.cornerRadius = b3.frame.size.height / 2
        b4.layer.cornerRadius = b4.frame.size.height / 2
        
//        signatureView.setStrokeColor(color: .black)
        signatureView.layer.borderColor = UIColor.gray.cgColor
        signatureView.layer.borderWidth = 1
        // Do any additional setup after loading the view.
        
        photo.delegate = self
      
        
    }
    

    // MARK: - BUTTON - REGISTER
    
    
    @IBAction func btnRegister(_ sender: UIButton) {
       // dc.fetch()
        
      
       // let image = croppedSignatureView.image! as! UIImage
        let imageData = signatureView.getCroppedSignature()?.pngData()
        imgconvert2 = imageData!
        
        let value = dc.fetchdata
        let contain = value.contains(where: {
            $0.name == txtfullname.text
        })
        
        if txtfullname.text != "" && txtemail.text != "" && txtphone.text != "" && txtDob.text != ""{
            if imgconvert != nil && imgconvert2 != nil {
                
                if !contain{
                    
                    dc.save(FULLNAME: txtfullname.text ?? "",
                            DOB: txtDob.text ?? "",
                            PHONE: Int16(txtphone.text ?? "") ?? 0,
                            EMAIL: txtemail.text ?? "" ,
                            IMGPROFILE: imgconvert,
                            IMGSIGN: imgconvert2)
                    print("__++_",imgconvert)
                    self.navigationController?.popViewController(animated: true)
                    
                }else{
                    
                    Alert(message: "Name already used")
                }
            }else{
                Alert(message: "please add image")
            }
        }else{
            
            Alert(message: "Empty Textfiled")
        }
        
    }
    
    
    
    
// MARK: - BUTTON - NAVIGATIONS
    
    @IBAction func btnAdd(_ sender: UIButton) {
        
        photo.sourceType = .photoLibrary
        present(photo, animated: true)
    }
    
    @IBAction func btnback(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btn(_ sender: UIButton) {
        
        if scl.isScrollEnabled == true{
            scl.isScrollEnabled = false
        }else{
            scl.isScrollEnabled = true
        }
    }
    
    
    
// MARK: - IMAGE-PICKER
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let picker = info[UIImagePickerController.InfoKey.originalImage]as? UIImage
        {
            imgprofile.image = picker
            imgconvert = picker.pngData()
        }
        dismiss(animated: true)
    }
    
    
    
    
// MARK: - ALERT FUNCTION
    
    func Alert (message : String){
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    

    
    @IBAction  func didTapRefreshCroppedSignature() {
//        croppedSignatureView.image = signatureView.getCroppedSignature()
//        let image = croppedSignatureView.image! as! UIImage
//
//        let imageData = image.pngData()
//        imgconvert2 = imageData!
//      print(imgconvert2)
//                let image = UIImage(named: "croppedSignatureView")
//             photo = croppedSignatureView
//        print("fullRender \(croppedSignatureView.image?.size ?? CGSize.zero)")
    }


}

//extension ViewController : SwiftSignatureViewDelegate{
//    func swiftSignatureViewDidDrawGesture(_ view:ISignatureView, _ tap: UIGestureRecognizer) {
//        <#code#>
//    }
//
//    func swiftSignatureViewDidDraw(_ view: ISignatureView) {
//        <#code#>
//    }
//
//
//}
