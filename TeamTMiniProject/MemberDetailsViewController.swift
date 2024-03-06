//
//  MemberDetailsViewController.swift
//  Team-T_Jihae_Jeonghoon
//
//  Created by 배지해 on 2/27/24.
//

import UIKit
import SafariServices

class MemberDetailsViewController: UIViewController {

    @IBOutlet weak var SubView: UIView!
    @IBOutlet weak var blog_Btn: UIButton!
    
    @IBOutlet weak var Line_Img: UIImageView!
    @IBOutlet weak var Git_btn: UIButton!
    
    enum Team : String {
        case Kim = "김정호"
        case Yoon = "윤소연"
        case Song = "송정훈"
        case Yeom = "염아현"
        case Bae = "배지해"
    }
    
    var nameData : String?
    var blogURL : String?
    var gitURL : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let smallId = UISheetPresentationController.Detent.Identifier("small")
        let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallId) { context in
            return 390}
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [smallDetent ]
            sheetPresentationController.largestUndimmedDetentIdentifier = smallId
        }
        
        mem_Ch(nameData!)
        SubView.layer.cornerRadius = 20
        SubView.layer.masksToBounds = true
    }

    // 이름 확인 후 정보 출력
    @objc func mem_Ch(_ name : String) {
        let member = Team(rawValue: name)
        switch member {
        case .Kim :
            blogURL = "https://jeongnote.tistory.com"
            gitURL = "https://github.com/ohhoooo"
            blog_Btn.setTitle(blogURL, for: .normal)
            Git_btn.setTitle(gitURL, for: .normal)
            break
        case .Yoon:
            blogURL = "https://wood-fxrest.tistory.com"
            gitURL = "https://github.com/wxxd-fxrest"
            blog_Btn.setTitle(blogURL, for: .normal)
            Git_btn.setTitle(gitURL, for: .normal)
            break
        case .Song:
            blogURL = "https://velog.io/@otxoid/posts"
            gitURL = "https://github.com/qkwmapel"
            blog_Btn.setTitle(blogURL, for: .normal)
            Git_btn.setTitle(gitURL, for: .normal)
            break
        case .Yeom:
            blogURL = "https://velog.io/@gritahy/posts"
            gitURL = "https://github.com/Yeom-A-Hyeon"
            blog_Btn.setTitle(blogURL, for: .normal)
            Git_btn.setTitle(gitURL, for: .normal)
            break
        case .Bae:
            blogURL = "https://velog.io/@jihae__qu/posts"
            gitURL = "https://github.com/BaeJihae"
            blog_Btn.setTitle(blogURL, for: .normal)
            Git_btn.setTitle(gitURL, for: .normal)
            break
        case .none:
            break
        }
    }
    
    // Blog 버튼이 눌렸을 때, URL 띄우기
    @IBAction func blogBtnTapped(_ sender: UIButton) {
        if let blogUrl = NSURL(string: blogURL!) {
            let blogSafariView: SFSafariViewController = SFSafariViewController(url: blogUrl as URL)
            self.present(blogSafariView, animated: true, completion: nil)
        }
    }
    
    // Github 버튼이 눌렸을 때, URL 띄우기
    @IBAction func gitBtnTapped(_ sender: UIButton) {
        if let gitUrl = NSURL(string: gitURL!) {
            let githubSafariView: SFSafariViewController = SFSafariViewController(url: gitUrl as URL)
            self.present(githubSafariView, animated: true, completion: nil)
        }
    }
}
