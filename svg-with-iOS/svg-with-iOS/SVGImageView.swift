//
//  File.swift
//  svg-with-iOS
//
//  Created by 이승준 on 2/9/25.
//

import UIKit
import WebKit
import SnapKit
import Then
import SDWebImageSVGNativeCoder

class SVGImageView: UIView {
    
    static let svgURL = URL(string: "https://svgsilh.com/svg_v2/1574006.svg")!
    
    private var webImage = WKWebView().then {
        $0.load(URLRequest(url: SVGImageView.svgURL))
    }
    
    private var svgImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = .appleLogin
        $0.backgroundColor = .white
    }
    
    private var pngImageView = UIButton().then {
        $0.contentMode = .scaleAspectFit
        $0.setImage(.appleLogin, for: .normal)
        $0.backgroundColor = .white
        $0.imageView?.contentMode = .scaleAspectFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        addComponents()
    }
    
    private func addComponents() {
        let bitmapSize = CGSize(width: 500, height: 500)
        
        self.addSubview(webImage)
        self.addSubview(svgImageView)
        self.addSubview(pngImageView)
        
        webImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
        
        svgImageView.sd_setImage(
            with: SVGImageView.svgURL,
            placeholderImage: .appleLogin,
            context: [
                .imageThumbnailPixelSize: bitmapSize,
                .imagePreserveAspectRatio: true,
                .imageCoder: SDImageSVGNativeCoder.shared
            ]
        )
        
//        imageView.sd_setImage(
//            with: svgURL,
//            placeholderImage: nil,
//            options: [],
//            context: [.imageThumbnailPixelSize : bitmapSize]
//        )
        
        svgImageView.snp.makeConstraints { make in
            make.top.equalTo(webImage.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
        
        pngImageView.snp.makeConstraints { make in
            make.top.equalTo(svgImageView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
        
        pngImageView.load(url: URL(string: "https://d1le4wcgenmery.cloudfront.net/de3a3b57-8957-4106-90d4-af828c8f3ba3아기 비숑.png")!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIButton{
    func load(url: URL){
        DispatchQueue.global().async{
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        self?.setImage(image, for: .normal)
                    }
                }
            }
        }
    }
}

extension UIImageView{
    func load(url: URL){
        DispatchQueue.global().async{
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        self?.image = image
                    }
                }
            }
        }
    }
}


