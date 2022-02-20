//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Keisuke Iida on 2022/02/13.
//

import UIKit

class ViewController: UIViewController {
//class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var slideShow: UIButton!
    
    let smallPhoto: [String] = ["sample1.jpeg", "sample2.jpeg","sample3.jpeg"]
    var timer: Timer!
    var onoff = false
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if onoff == false {
            slideShow.setTitle("Play", for: .normal)
        }
        else if onoff == true {
            slideShow.setTitle("Stop", for: .normal)
        }

        let sampleImage = UIImage(named: smallPhoto[i])
        image.image = sampleImage
    }
    
    //Tap Gesture Recognizer
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        //need both this func and storyboard operation for image tap
        //to move to next page
        performSegue(withIdentifier: "nextPage", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.i = i
    }
    //進む
    @IBAction func nextImage(_ sender: Any) {
        if onoff == false {
            if i < 2 {
                i += 1
            }
            else if i == 2{
                i = 0
            }
            self.viewDidLoad()
        }
    }
    //戻る
    @IBAction func backImage(_ sender: Any) {
        if onoff == false {
            if i > 0 {
                i -= 1
            }
            else if i == 0 {
                i = 2
            }
            self.viewDidLoad()
        }
    }
    //SlideShow start/stop
    @IBAction func slideShow(_ sender: Any) {
        if onoff == false {
            onoff = true
            //timer start
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideShowStart(_:)), userInfo: nil, repeats: true)
            //self.slideShow.text = String("停止")
        }
        else if onoff == true {
            onoff = false
            //timer stop
            self.timer.invalidate()
            self.viewDidLoad()
            //self.slideShow.text = String("再生")
        }
    }
    
    @objc func slideShowStart(_ sender: Any) {
        if i < 2 {
            i += 1
        }
        else if i == 2 {
            i = 0
        }
        self.viewDidLoad()
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
}

