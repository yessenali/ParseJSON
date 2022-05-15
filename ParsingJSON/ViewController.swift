//
//  ViewController.swift
//  ParsingJSON
//
//  Created by Yessenali Zhanaidar on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://icodeschool.ru/json2.php"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
//            let jsonParsing = String(data: data, encoding: .utf8)
//            print(jsonParsing)
            
            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-mm-dd hh:mm:ss"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let examples = try decoder.decode([Model].self, from: data)
                print(examples.first?.comments?.first?.user.name)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    


}

