//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport


let cfURL = Bundle.main.url(forResource: "Itim-Regular", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
var fontNames: [[AnyObject]] = []








public class MyViewController : UIViewController {
    override public func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.frame = CGRect(x: 0, y: 500, width: 1366, height: 603.5)
        backgroundImage.image = UIImage(imageLiteralResourceName: "Background.png")
        
        let botaoRitmo = UIImage (named: "BOTAO RITMO.png")
        let botaoMelodia = UIImage (named: "BOTAO MELODIA.png")
        let botaoHarmonia = UIImage(named: "BOTAO HARMONIA.png")
        
        
        let musikidsLabel = UILabel()
        let font = UIFont(name: "Itim", size: 80)
        musikidsLabel.frame = CGRect(x: 531, y: 70, width: 304, height: 100)
        musikidsLabel.text = "Musikids"
        musikidsLabel.textColor = .black
        musikidsLabel.font = font
        
        let jogarRitmoButton = UIButton()
        jogarRitmoButton.frame = CGRect(x: 81.39, y: 200, width: 415.61, height: 445)
        jogarRitmoButton.setTitle("RITMO", for: .normal)
        jogarRitmoButton.setTitleColor(.black, for: .normal)
        jogarRitmoButton.setImage(botaoRitmo, for: .normal)
        
        let jogarMelodiaButton = UIButton()
        jogarMelodiaButton.frame = CGRect(x: 869, y: 200, width: 415.61, height: 445)
        jogarMelodiaButton.setTitle("MELODIA", for: .normal)
        jogarMelodiaButton.setTitleColor(.black, for: .normal)
        jogarMelodiaButton.setImage(botaoMelodia, for: .normal)
        
        let jogarHarmoniaButton = UIButton()
        jogarHarmoniaButton.frame = CGRect(x: 475.195, y: 550, width: 415.61, height: 445)
        jogarHarmoniaButton.setTitle("HARMONIA", for: .normal)
        jogarHarmoniaButton.setTitleColor(.black, for: .normal)
        jogarHarmoniaButton.setImage(botaoHarmonia, for: .normal)
        
        view.addSubview(backgroundImage)
        view.addSubview(musikidsLabel)
        view.addSubview(jogarRitmoButton)
        view.addSubview(jogarMelodiaButton)
        view.addSubview(jogarHarmoniaButton)
        
        
        
        self.view = view
    }
}
// Present the view controller in the Live View window
let mvc = MyViewController(screenType: .ipadPro12_9, isPortrait: false)
mvc.preferredContentSize = CGSize(width: 1024, height: 1366)
PlaygroundPage.current.liveView = mvc.scale(to: 0.4)


