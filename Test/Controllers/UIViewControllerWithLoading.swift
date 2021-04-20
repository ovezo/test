//
//  UIViewControllerWithLoading.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//


import UIKit

class UIViewControllerWithLoading: UIViewController {
    
    func showLoading(completion: (()->Void)?){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: completion)
    }
    
    func hideLoading(completion: (()->Void)?){
        self.dismiss(animated: true, completion: completion)
    }
    
    func alertError(errorMessage: String, retry: @escaping ()->(), cancel: (()->())?){
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: {
            result in
            cancel?()
        }))
        alert.addAction(UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: {
            result in
            alert.dismiss(animated: false, completion: nil)
            retry()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
