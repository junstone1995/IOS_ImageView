//
//  ImageViewController.swift
//  Cassini
//
//  Created by Junseok Lee on 2021/09/03.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate{

    var imageURL: NSURL?{
        didSet{
            image = nil
            if view.window != nil{
                fetchImage()
            }
        }
    }
    
    private func fetchImage(){
        if let url = imageURL{
            DispatchQueue.global(qos: .userInitiated).async {
                let contentsOfURL = NSData(contentsOf: url as URL)
                DispatchQueue.main.async {
                    if url == self.imageURL{
                        if let imageData = contentsOfURL{
                            self.image = UIImage(data: imageData as Data)
                        }
                    }else{
                        print("ignored data returned form url \(url)")
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    {
        didSet{
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage?{
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if image == nil{
            fetchImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        // Do any additional setup after loading the view.
    }
    

}
