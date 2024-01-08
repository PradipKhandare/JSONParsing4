//
//  SecondViewController.swift
//  JSONParsing4
//
//  Created by NTS on 08/01/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var alpha3: UILabel!
    @IBOutlet weak var alpha2: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var subRegion: UILabel!
    
    var strAlpha3 = ""
    var strAlpha2 = ""
    var strRegion = ""
    var strSubregion = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alpha3.text = strAlpha3
        alpha2.text = strAlpha2
        region.text = strRegion
        subRegion.text = strSubregion
    }

}
