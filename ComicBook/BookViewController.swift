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
    
    // interface builder나 nib file로부터 읽어들인 후에 실행됨
    // custom으로 ui를 그리기에 적당한 곳이라는 생각이 듬
    override func awakeFromNib() {
        // title을 Back으로 선택해도 이전 controller의 title이 표시되는데
        // navigationItem.backBarButtonItem으로 설정했기 때문인듯
        let backButton = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setBookData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBookData() {
        if let comicBook = comicBook {
            bookTitle.text = comicBook.bookTitle
            coverImage.image = UIImage(named: "SampleBook") //comicBook.coverImage
            illustrator.text = comicBook.illustrator
            // TODO: pubDate가 이상하게 나오는데 이걸 해결하는 방법이 동영상에 있음
            pubDate.text = NSDate().getFormattedString("yyyy-MM-dd")// comicBook!.pubDate!.getFormattedString("yyyy-MM-dd")
            desc.text = "Sample text. There's no data." //comicBook!.desc

            // 타이틀바의 제목을 책제목으로 설정
            navigationItem.title = comicBook.bookTitle
        }
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
}

extension NSDate {
    func getFormattedString(format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
}


