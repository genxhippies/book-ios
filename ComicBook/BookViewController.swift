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
    @IBOutlet weak var illustrator: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    // optional로 설정하지 않으면 View contoller를 생성할 때 초기화를 반드시 해야 하므로
    // initializer가 필요하다는 에러 메시지가 발생한다.
    var comicBook: ComicBook?
    
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
        bookTitle.text = comicBook!.bookTitle
        // TODO: pubDate가 이상하게 나오는데 이걸 해결하는 방법이 동영상에 있음
        pubDate.text = comicBook!.pubDate!.getFormattedString("yyyy-MM-dd")
        desc.text = comicBook!.desc
        coverImage.image = comicBook!.coverImage
        illustrator.text = comicBook!.illustrator
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: IBActions
    @IBAction func toggleCheck(sender: AnyObject) {
        // TODO 아래 코드 왼편의 comicBook!.checked 에서 !를 없앨 수 있는 방법은 없나?
        comicBook!.checked = !comicBook!.checked
        
        let checkBtn = sender as! UIButton
        checkBtn.setTitle(comicBook!.checked ? "Checked!" : "Check!", forState: UIControlState.Normal)
    }
    
    // MARK: Temporary functions
    private func loadData() {
        comicBook = ComicBook(isbn: "1234567890123", bookTitle: "원피스 78", illustrator: "오다 에이이치로", desc: "오다 에이이치로 원피스 짱짱맨", coverImage: UIImage(named: "SampleBook"), pubDate: NSDate())
    }
}

extension NSDate {
    func getFormattedString(format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
}


