//
//  ViewController.swift
//  QuoteApp
//
//  Created by Tuba N. Yıldız on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newRandomQuoteButton: UIButton!
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
    }
   
    override func viewWillAppear(_ animated: Bool) {
        Service.getQuote { quote, error in
            guard let quote = quote else { return }
            self.quoteLabel.text = quote.en
            if let author = quote.author {
                self.authorLabel.text = "By " + author
            }
            else {
                self.authorLabel.text = "Anonymous"
            }
            print(quote)
        }
    }
    @IBAction func didTappedNewRandomQuote(_ sender: Any) {
        Service.getQuote { quote, error in
            guard let quote = quote else { return }
            self.quoteLabel.text = quote.en
            if let author = quote.author {
                self.authorLabel.text = "By " + author
            }
            else {
                self.authorLabel.text = "Anonymous"
            }
            print(quote)
        }
        
    }
}

