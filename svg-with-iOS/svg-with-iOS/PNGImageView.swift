//
//  PNGImageView.swift
//  svg-with-iOS
//
//  Created by 이승준 on 2/12/25.
//

import UIKit
import WebKit
import SnapKit
import Then
import Alamofire
import SDWebImageSVGNativeCoder

class PNGImageView: UIView {
    
    static let pngURL = URL(string: "https://d1le4wcgenmery.cloudfront.net/de3a3b57-8957-4106-90d4-af828c8f3ba3아기 비숑.png")!
    
    private var webImage = WKWebView().then {
        $0.load(URLRequest(url: PNGImageView.pngURL))
    }
    
    public var pngImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = .appleLogin
        $0.backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        addComponents()
    }
    
    private func addComponents() {
        
        self.addSubview(webImage)
        self.addSubview(pngImageView)
        
        webImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
        
        pngImageView.snp.makeConstraints { make in
            make.top.equalTo(webImage.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView{
    func load(url: URL){
        DispatchQueue.global().async{
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        print("change image")
                        self?.image = image
                    }
                }
            }
        }
    }
}

