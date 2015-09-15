//
//  BookViewController.swift
//  ComicBook
//
//  Created by inome on 2015. 9. 15..
//  Copyright © 2015년 Nundefined. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var pubDate: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var comicBook = ComicBook()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadData()
        
        setBookData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBookData() {
        bookTitle.text = comicBook.bookTitle
        // TODO: pubDate가 이상하게 나오는데 이걸 해결하는 방법이 동영상에 있음
        pubDate.text = "\(comicBook.pubDate)"
        desc.text = comicBook.desc
        coverImage.image = comicBook.coverImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Temporary functions
    private func loadData() {
        comicBook.bookTitle = "원피스 78"
        comicBook.illustrator = "오다 에이이치로"
        comicBook.desc = "오다 에이이치로 원피스 짱짱맨"
        comicBook.pubDate = NSDate()
        comicBook.coverImage = UIImage(named: "SampleBook")
    }

}