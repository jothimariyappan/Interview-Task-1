//
//  ViewController.swift
//  Interviewproject1
//
//  Created by Jo on 17/01/23.
//

import UIKit

class ViewController: UIViewController{

//        var num = [1,2,3,4,5]
// MARK: - INSTANCE
    var like = [Int]()
    var dc = Model()
    var img = NSData()
    var imgdata = [UIImage]() {
        didSet {
            print("imgdata \(imgdata.count)")
        }
    }
    var imgdata2 = [UIImage]()
    
// MARK: - OUTLETS
    @IBOutlet var tbl: UITableView!
    
    
// MARK: - VIEWDIDLOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // dc.fetchdata
        dc.fetch()
        // Do any additional setup after loading the view.
    }
    
    
    
// MARK: - VIEWWILLAPPEAR
    
    override func viewWillAppear(_ animated: Bool) {
        dc.fetch()
        print("fetch data count \(dc.fetchdata.count)")
        DispatchQueue.main.async {
            self.tbl.reloadData()
        }
       
        
    }
    
    
// MARK: -  Navigation & BUTTONS
    
    @IBAction func btnAdd(_ sender: UIButton) {
        let registration = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Registration") as! Registration
        
        self.navigationController?.pushViewController(registration, animated: true)
    }
    
    
    @IBAction func btnFav(_ sender: UIButton) {                // BUTTON - ADD FAVOURTE
//        print(sender.tag)
        if !like.contains(sender.tag){
            like.append(sender.tag)
        }else{
            let count = like.lastIndex(of: sender.tag)
            like.remove(at: count ?? 0)
        }
        
        print(like)
        tbl.reloadData()
      
    }
    
    @IBAction func btnPDF(_ sender: UIButton) {                // BUTTON - PDF DOWNLOAD
       
    }
    
    
    
}

// MARK: - TABLEVIEW CONTROLLER

extension ViewController :UITableViewDelegate,UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dc.fetchdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userTvc", for: indexPath) as! userTvc
//        cell.imgprofile.image = UIImage(named: "\(num[indexPath.row])")
        cell.lblName.text = dc.fetchdata[indexPath.row].name
        cell.lblEmail.text = dc.fetchdata[indexPath.row].email
        cell.btnstar.tag = indexPath.row
        
       // image display as binary data
        img = ((dc.fetchdata[indexPath.row].image as? NSData)!)
//        imgdata.append(UIImage(data: img as! Data )!)
        cell.imgprofile.image = UIImage(data: img as! Data )!
        
        let sign = dc.fetchdata[indexPath.row].imagesign as? NSData
        imgdata2.append(UIImage(data: sign as! Data )!)
        
        // LIKE CONTAINS IMAGES
        if !like.contains(indexPath.row){
            
            cell.imgstar.image = UIImage(named: "star")
            
        }else{
            
            cell.imgstar.image = UIImage(named: "star.fill")
        }
               
        return cell
    }
    
    
    
    
// MARK: - HEIGHT
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
        
    }
    
    
    
// MARK: - DIDSELECT
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let preview = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Preview") as! Preview
        preview.name = dc.fetchdata[indexPath.row].name!
        preview.email = dc.fetchdata[indexPath.row].email!
        preview.phone = Int(Double(dc.fetchdata[indexPath.row].phone))
        preview.imgPROFILE = UIImage(data: img as! Data )!
        preview.signpic = imgdata2[indexPath.row]
        
        self.navigationController?.pushViewController(preview, animated: true)
        
    }
    
    
    
// MARK: - DELETE
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete{
            print("Delete")
            
        }
        
        do{
//            self.dc.fetchdata.remove(at: indexPath.row)               // data delete from tbl rows
//            self.tbl.deleteRows(at: [indexPath], with: .automatic)    // data delete from tbl rows
            dc.context.delete(dc.fetchdata[indexPath.row])              // data delete from coredata
            imgdata.remove(at:indexPath.row)                           // data delete from coredata (images)
            imgdata2.remove(at: indexPath.row)
            try dc.context.save()
        }catch{
            
            print("error")
            
        }
        dc.fetch()
        tbl.reloadData()
    }
                
}

