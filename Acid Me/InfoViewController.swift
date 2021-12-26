//
//  InfoViewController.swift
//  Acid Me!
//
//  Created by Pedro M. Moreno on 26/12/2020.
//  ELE00083M iOS Programming for Audio.
//  Copyright © 2020 Pedro M.Moreno. All rights reserved.
//

import UIKit

///
/// InfoViewController handles the user interaction with the Info view.
///
/// - author: Pedro M. Moreno
/// - Date: 26/12/2020.
///
class InfoViewController: UIViewController, UIScrollViewDelegate {
    
    /* VARIABLES */
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var contentWidth: CGFloat = 0.0
    
    /* func viewDidLoad */
    /// Sets up the Info view and its initial elements.
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        setUpImages()
        pageControl.layer.cornerRadius = 18
    }
    
    /* func prefersStatusBarHidden */
    /// Hides the status bar.
    ///
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    /* func prefersHomeIndicatorAutoHidden */
    /// Hides the home indicator.
    ///
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
    
    /* func scrollViewDidScroll */
    /// Handles the scrolling functionality of the scroll view.
    /// - Parameter scrollViewDidScroll: the scroll view.
    ///
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage =  Int(scrollView.contentOffset.x / CGFloat(view.frame.width))
    }
    
    /* func setUpImages */
    /// Sets up the images to be shown in the different pages of the scroll view.
    ///
    func setUpImages(){
        for image in 0...5 {
            let imageToDisplay = UIImage(named: "Info_\(image).png")
            let imageView = UIImageView(image: imageToDisplay)
            imageView.contentMode = .scaleToFill
            let xCoordinate = 0 + view.frame.width * CGFloat(image)
            contentWidth += view.frame.width
            
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: xCoordinate , y: 0, width: view.frame.width , height: view.frame.height)
        }
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
    }
}
