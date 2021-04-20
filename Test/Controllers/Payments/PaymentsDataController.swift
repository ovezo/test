//
//  PaymentsDataController.swift
//  Test
//
//  Created by Owez Orazberdiyew on 4/20/21.
//

import Foundation

class PaymentsDataController {
    
    static var data: [Payment]?
    
    static public func getPayments(onError: @escaping (String)->(), onSuccess: @escaping ()->()){
        Request.execute(
            url: Rest.GET_PAYMENTS,
            method: "GET",
            body: nil,
            params: nil,
            shouldAuth: true,
            onError: onError,
            onResult: {
                (result) -> () in
                onResult(result: result, onError: onError, onSuccess: onSuccess)
            }
        )
    }
    
    // Handle result of request
    static private func onResult(result: Data, onError: @escaping (String)->(), onSuccess: @escaping ()->()){
        do{
            let json = try JSONSerialization.jsonObject(with: result, options: []) as? [String: Any]
            let response = HTTPPaymentsResponse(data: json)
                        
            DispatchQueue.main.async {
                if response.success == "false" {
                    onError(response.error?.error_msg ?? "Something went wrong (")
                } else {
                    if let array = response.response {
                        self.data = array
                        onSuccess()
                    } else {
                        onError("Something went wrong (")
                    }
                }
            }
        }catch{
            DispatchQueue.main.async {
                onError(error.localizedDescription)
            }
        }
    }
    
}
