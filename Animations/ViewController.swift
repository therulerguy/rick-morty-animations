//
//  ViewController.swift
//  Animations
//
//  Created by j Wang on 9/8/16.
//  Copyright © 2016 jonwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var counter = 1
  
  var timer = Timer()
  
  var isAnimating = false
  
  @IBOutlet var imageView: UIImageView!
  
  @IBAction func fadeIn(_ sender: AnyObject) {
    
    imageView.alpha = 0
    
    UIView.animate(withDuration: 1, animations: {
      
      self.imageView.alpha = 1
      
    })
  }
  
  @IBAction func fadeOut(_ sender: AnyObject) {
    
    UIView.animate(withDuration: 1, animations: {
    
      self.imageView.alpha = 0
    })
  }
  
  @IBAction func fadeInOut(_ sender: AnyObject) {
    
    while imageView.alpha == 1 {
      
      fadeOut(imageView)
    }
    
    fadeIn(imageView)    
  }
  
  @IBAction func speedUp(_ sender: AnyObject) {
    
    timer  = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
  }
  
  @IBAction func slideIn(_ sender: AnyObject) {
    
    imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
    
    UIView.animate(withDuration: 2, animations: {
      
      self.imageView.center = CGPoint(x: self.imageView.center.x + 500, y: self.imageView.center.y)
    })
  }
  
  @IBAction func grow(_ sender: AnyObject) {
    
    imageView.frame = CGRect(x: imageView.center.x, y: imageView.center.y, width: 0, height: 0)
    
    UIView.animate(withDuration: 2, animations: {
    
      self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    })
  }
  
  
  
  
  
  
  
  
  @IBOutlet var button: UIButton!
  
  func animate() {
    
    imageView.image = UIImage(named: "frame_\(counter)_delay-0.07s.gif")
    
    counter += 1
    
    if counter == 54 {
      
      counter = 0
    }
  }
  
  @IBAction func next(_ sender: AnyObject) {
    
    if isAnimating {
      
      timer.invalidate()
      button.setTitle("Start Animation", for: [])
      isAnimating = false
      
    } else {
    
    timer  = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
      
      button.setTitle("Stop Animation", for: [])
      isAnimating = true
    }
    
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

