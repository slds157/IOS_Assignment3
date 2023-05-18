import UIKit
import Foundation

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var attentionLabel: UILabel!
    var scrollView: UIScrollView!
    var images: [String] = ["image1", "image2", "image3", "image4", "image5"]
    var name: String?
    var imageName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageSliding()
       
    }
    
    private func setImageSliding() {
        let imageWidth = self.view.frame.size.width
        let imageHeight = self.view.frame.size.height * 0.5
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight))
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: imageWidth * CGFloat(images.count), height: imageHeight)
        scrollView.showsHorizontalScrollIndicator = false
        
        for i in 0 ..< images.count {
            let imageView = UIImageView(frame: CGRect(x: imageWidth * CGFloat(i), y: 0, width: imageWidth, height: imageHeight))
            guard let image = UIImage(named: images[i]) else {
                continue
            }
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            imageView.tag = i
            let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            imageView.addGestureRecognizer(tap)
            scrollView.addSubview(imageView)
        }
        
        self.view.addSubview(scrollView)
    }
    
    @objc private func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImageView = tapGestureRecognizer.view as! UIImageView
        imageName = images[tappedImageView.tag]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        attentionLabel.text = ""
        if let MovieDetailsControllerVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailsController") as? MovieDetailsController {
            MovieDetailsControllerVC.imageName = imageName
            
            self.present(MovieDetailsControllerVC, animated: true, completion: nil)
        }
    }
}
