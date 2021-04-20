//
//  PaymentsViewController.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import UIKit

class PaymentsViewController: UIViewControllerWithLoading {
    
    @IBOutlet weak var paymentTable: UITableView!
    override func viewDidAppear(_ animated: Bool) {
        loadData();
    }
    
    override func viewDidLoad() {
        configurePaymentTable()
    }
    
    func loadData() {
        showLoading {
            PaymentsDataController.getPayments(onError: self.onError, onSuccess: self.onSuccess)
        }
    }
    
    func onError(_ error: String){
        hideLoading {
            self.alertError(errorMessage: error, retry: self.loadData, cancel: nil)
        }
    }
    
    func onSuccess(){
        hideLoading {
            self.paymentTable.reloadData()
        }
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onLogout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Table configuration
extension PaymentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configurePaymentTable() {
        paymentTable.dataSource = self
        paymentTable.delegate = self
        
        paymentTable.tableFooterView = UIView()
        
        paymentTable.register(PaymentCell.nib(), forCellReuseIdentifier: PaymentCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PaymentsDataController.data?.capacity ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PaymentCell.identifier, for: indexPath) as! PaymentCell
        
        cell.configure(with: PaymentsDataController.data![indexPath.row])
        
        return cell
    }
    
    
}
