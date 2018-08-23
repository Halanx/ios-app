//
//  HNPaymentOptionsViewController.swift
//  Halanx
//
//  Created by Shubham Arora on 21/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class HNPaymentOptionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let paymentOptionCell = CellIdentifier.paymentOptionCell
    
    var imageArray = [#imageLiteral(resourceName: "card"),#imageLiteral(resourceName: "paytm_logo")]
    var textArry = ["Credit / Debit Card", "Paytm"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        //changeNavigationTitle(title: "Payment")
        self.title = "Payment"
    }

}

// Table View
extension HNPaymentOptionsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: paymentOptionCell, for: indexPath)
        
        cell.imageView?.image = imageArray[indexPath.row]
        cell.imageView?.contentMode = .scaleAspectFit
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 18)
        cell.textLabel?.text = textArry[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
}







