import UIKit

class HomePageViewController: UIViewController {

    var scrollView: UIScrollView!
    var images: [String] = ["image1", "image2", "image3", "image4", "image5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }

    private func setupScrollView() {
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
            scrollView.addSubview(imageView)
        }

        self.view.addSubview(scrollView)
    }
}
