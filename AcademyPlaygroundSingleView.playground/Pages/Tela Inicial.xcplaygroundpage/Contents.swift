//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport


let cfURL = Bundle.main.url(forResource: "Itim-Regular", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

let cfURL2 = Bundle.main.url(forResource: "Raleway-Regular", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL2, CTFontManagerScope.process, nil)

let cfURL3 = Bundle.main.url(forResource: "Raleway-Bold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL3, CTFontManagerScope.process, nil)

//for family in UIFont.familyNames {
//    print("\(family)")
//    for name in UIFont.fontNames(forFamilyName: family) {
//        print("   \(name)")
//    }
//}


class MainScreenViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.frame = CGRect(x: 0, y: 420, width: 1366, height: 603.5)
        backgroundImage.image = UIImage(imageLiteralResourceName: "Background.png")
        
        let musikidsLabel = UILabel()
        let font = UIFont(name: "Itim", size: 80)
        musikidsLabel.frame = CGRect(x: 531, y: 70, width: 304, height: 100)
        musikidsLabel.text = "Musikids"
        musikidsLabel.textColor = .black
        musikidsLabel.font = font
        
        let botaoRitmo = UIImage (named: "BOTAO RITMO.png")
        let botaoMelodia = UIImage (named: "BOTAO MELODIA.png")
        let botaoHarmonia = UIImage(named: "BOTAO HARMONIA.png")
        
        let jogarRitmoButton = UIButton()
        jogarRitmoButton.frame = CGRect(x: 81.39, y: 200, width: 415.61, height: 445)
        jogarRitmoButton.setTitle("RITMO", for: .normal)
        jogarRitmoButton.setTitleColor(.black, for: .normal)
        jogarRitmoButton.setImage(botaoRitmo, for: .normal)
        jogarRitmoButton.addTarget(nil, action: #selector(tapButton), for: .touchUpInside)
        
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
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func tapButton() {
        //print("Apertou botão de RITMO")
        navigationController?.pushViewController(ritmoScreenOne, animated: false)
    }
}

class RitmoScreenOneViewController: UIViewController {
    let labelRitmo2 = UILabel()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let botaoRetornarImage = UIImage(named: "BotaoRetornar.png")
        
        let botaoRetornar = UIButton()
        botaoRetornar.frame = CGRect(x: 30, y: 30, width: 126, height: 126)
        botaoRetornar.setImage(botaoRetornarImage, for: .normal)
        botaoRetornar.addTarget(nil, action: #selector(tapButton), for: .touchUpInside)
        
        let ritmoTitleLabel = UILabel()
        ritmoTitleLabel.frame = CGRect(x: 533, y: 30, width: 300, height: 100)
        ritmoTitleLabel.text = "RITMO"
        ritmoTitleLabel.textColor = .black
        let font = UIFont(name: "Raleway-Regular", size: 80)
        ritmoTitleLabel.font = font
        
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont(name: "Raleway-Bold", size: 28)!
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont(name: "Raleway-Regular", size: 28)!
        ]
        let boldText = NSAttributedString(string: "duração", attributes: boldAttribute)
        let boldText2 = NSAttributedString(string: "ritmo.", attributes: boldAttribute)
        let regularText = NSAttributedString(string: "Na música, o ritmo está ligado à ", attributes: regularAttribute)
        let regularText2 = NSAttributedString(string: " de um som. Ou seja, por quanto tempo aquele som é tocado. Sons podem ser curtos ou longos, e combinando diferentes durações, nós temos o ", attributes: regularAttribute)
        let newString1 = NSMutableAttributedString()
        newString1.append(regularText)
        newString1.append(boldText)
        newString1.append(regularText2)
        newString1.append(boldText2)
        
        let boldText3 = NSAttributedString(string: "ritmo.", attributes: boldAttribute)
        let regularText3 = NSAttributedString(string: "Quando contamos de 1 até 4, sempre seguimos um ", attributes: regularAttribute)
        let regularText4 = NSAttributedString(string: " Vamos tentar? Sempre que um número mudar de cor, toque na tela!", attributes: regularAttribute)
        let newString2 = NSMutableAttributedString()
        newString2.append(regularText3)
        newString2.append(boldText3)
        newString2.append(regularText4)
        
        let labelRitmo1 = UILabel(frame: CGRect(x: 183, y: 100, width: 1000, height: 200))
        labelRitmo1.attributedText = newString1
        labelRitmo1.numberOfLines = 3
        labelRitmo1.textAlignment = .center
        
        
        labelRitmo2.frame = CGRect(x: 183, y: 250, width: 1000, height: 150)
        labelRitmo2.attributedText = newString2
        labelRitmo2.numberOfLines = 2
        labelRitmo2.textAlignment = .center
        labelRitmo2.text = "adsad"
//        labelRitmo2.isHidden = false
        
        let screenButton = UIButton()
        screenButton.frame = CGRect(x: 0, y: 156, width: 1366, height: 868)
        screenButton.addTarget(nil, action: #selector(tapScreen), for: .touchUpInside)
        
        
        let backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.frame = CGRect(x: 0, y: 420, width: 1366, height: 603.5)
        backgroundImage.image = UIImage(imageLiteralResourceName: "Background.png")
        
        view.addSubview(backgroundImage)
        view.addSubview(screenButton)
        view.addSubview(botaoRetornar)
        view.addSubview(ritmoTitleLabel)
        view.addSubview(labelRitmo1)
        view.addSubview(labelRitmo2)
        
        
        self.view = view
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func tapButton() {
//        print("Apertou botão de RETORNO")
    navigationController?.popToRootViewController(animated: false)
        
    }
    @objc func tapScreen() {
//        print("Tocou na tela")
//        if (labelRitmo2.isHidden == true){
//
//            labelRitmo2.isHidden = false
//        }
//        else {
//            print("Label está visível")
//        }
        
    }
}
// Present the view controller in the Live View window

let mainScreen = MainScreenViewController()
let ritmoScreenOne = RitmoScreenOneViewController()
let navigation = UINavigationController(screenType: .ipadPro12_9, isPortrait: false)
navigation.pushViewController(mainScreen, animated: false)

let msvc = MainScreenViewController(screenType: .ipadPro12_9, isPortrait: false)
msvc.preferredContentSize = CGSize(width: 1024, height: 1366)
//PlaygroundPage.current.liveView = msvc.scale(to: 0.4)
PlaygroundPage.current.liveView = navigation.scale(to: 0.4)


