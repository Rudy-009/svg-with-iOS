//
//  ViewController.swift
//  svg-with-iOS
//
//  Created by 이승준 on 2/9/25.
//

import UIKit
import Alamofire

class SVGImageViewController: UIViewController {
    
    let pngView = PNGImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = pngView
        self.getPupptInfo()
    }
    
    func getPupptInfo() {
        let fcm = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzM4NCJ9.eyJpYXQiOjE3MzkzNjk4NDcsImV4cCI6MTczOTQ1NjI0NywidXNlcklkIjoiMTEifQ.1t0ToAdsSFioMnrnZUN2-94i1SJqWEHx5S5MSXLG2UzI2xIcbmuUAvOOWlqRnb4N"
        
        AF.request( "https://puppy-mode.site/puppies",
                    headers: [
                        "accept": "*/*",
                        "Authorization": "Bearer " + fcm
                    ])
        .responseDecodable(of: PuppyInfoResponse.self) { response in
            switch response.result {
            case .success(let response):
                let puppyInfo = response.result
                print(puppyInfo)
                self.pngView.pngImageView.load(url: PNGImageView.pngURL)
                // self.homeView.setPuppyImage(svgURL: URL(string: puppyInfo.imageUrl!)!)
            case .failure(let error):
                // 강아지 정보 불러오기에 실패했습니다. 라는 알림 띄우기? (다시시도)
                print("/puppies error", error)
            }
        }
    }
    
}

