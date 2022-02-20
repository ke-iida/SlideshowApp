//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Keisuke Iida on 2022/02/13.
//

import UIKit

class ResultViewController: UIViewController {

    let bigPhoto: [String] = ["sample1-big.jpeg", "sample2-big.jpeg","sample3-big.jpg"]
    var i = 0
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let sampleImage = UIImage(named: bigPhoto[i])
        image.image = sampleImage
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
