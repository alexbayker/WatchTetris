import UIKit
import SwiftUI

extension String
{
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

public class MyColor
{
    public static func getUIColorFromHex(_ hexcolor: String) -> UIColor?
    {
        if hexcolor.count > 0
        {
            let newcolor = (hexcolor.prefix(1) == "#") ? String(hexcolor.suffix(hexcolor.count - 1)) : hexcolor;
            
            if newcolor.count == 6
            {
                return UIColor(red: CGFloat(Int32(newcolor[0..<2], radix: 16)!)/255.0, green: CGFloat(Int32(newcolor[2..<4], radix: 16)!)/255.0, blue:
                    CGFloat(Int32(newcolor[4..<6], radix: 16)!)/255.0, alpha: 1.0)
            }
            else if newcolor.count == 8
            {
                return UIColor(red: CGFloat(Int32(newcolor[2..<4], radix: 16)!)/255.0, green: CGFloat(Int32(newcolor[4..<6], radix: 16)!)/255.0, blue: CGFloat(Int32(newcolor[6..<8], radix: 16)!)/255.0, alpha: CGFloat(Int32(newcolor[0..<2], radix: 16)!)/255.0)
            }
        }
        return nil;
    }
       
    public static func getHexStringFromUIColor(color: UIColor, needalpha: Bool) -> String?
    {
        var red: CGFloat = 0.0;
        var green: CGFloat = 0.0;
        var blue: CGFloat = 0.0;
        var alpha: CGFloat = 0.0;
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        if needalpha
        {
            return String(format: "#%02X%02X%02X%02X", Int(alpha * 255.0), Int(red * 255.0), Int(green * 255.0), Int(blue * 255.0))
        }
        return String(format: "#%02X%02X%02X", Int(red * 255.0), Int(green * 255.0), Int(blue * 255.0))
    }
    
    public static let colorPrimaryUI = MyColor.getUIColorFromHex("#4B8CA0")!
    public static let colorPrimary = Color(colorPrimaryUI)
    
    public static let colorPrimaryDarkUI = MyColor.getUIColorFromHex("#4B8CA0")!
    public static let colorPrimaryDark = Color(colorPrimaryDarkUI)
    
    public static let colorAccentUI = MyColor.getUIColorFromHex("#C86464")!
    public static let colorAccent = Color(colorAccentUI)
    
    public static let bazanetmaincolorUI = MyColor.getUIColorFromHex("#4B8CA0")!
    public static let bazanetmaincolor = Color(bazanetmaincolorUI)
    
    public static let bazanetredcolorUI = MyColor.getUIColorFromHex("#C86464")!
    public static let bazanetredcolor = Color(bazanetredcolorUI)
    
    public static let tcolorUI = MyColor.getUIColorFromHex("#FF00FF")!
    public static let tcolor = Color(tcolorUI)
    
    public static let bazanetselectedcolorUI = MyColor.getUIColorFromHex("#9ABFC8")!
    public static let bazanetselectedcolor = Color(bazanetselectedcolorUI)
    
    public static let colorblackUI = MyColor.getUIColorFromHex("#000000")!
    public static let colorblack = Color(colorblackUI)
    
    public static let colorgrayUI = MyColor.getUIColorFromHex("#D9DBDA")!
    public static let colorgray = Color(colorgrayUI)
    
    public static let colortransparentgrayUI = MyColor.getUIColorFromHex("#40D9DBDA")!
    public static let colortransparentgray = Color(colortransparentgrayUI)
    
    public static let colortarifsgrayUI = MyColor.getUIColorFromHex("#EBEDEC")!
    public static let colortarifsgray = Color(colortarifsgrayUI)
    
    public static let tarifsbluebackgroundUI = MyColor.getUIColorFromHex("#A4D5E3")!
    public static let tarifsbluebackground = Color(tarifsbluebackgroundUI)
    
    public static let speedgraycolorUI = MyColor.getUIColorFromHex("#898989")!
    public static let speedgraycolor = Color(speedgraycolorUI)
    
    public static let colorwhiteUI = MyColor.getUIColorFromHex("#FFFFFF")!
    public static let colorwhite = Color(colorwhiteUI)
    
    public static let colortransparentUI = MyColor.getUIColorFromHex("#00FFFFFF")!
    public static let colortransparent = Color(colortransparentUI)
    
    public static let halftransparentwhitecolorUI = MyColor.getUIColorFromHex("#AAFFFFFF")!
    public static let halftransparentwhitecolor = Color(halftransparentwhitecolorUI)
    
    public static let halftransparentblackcolorUI = MyColor.getUIColorFromHex("#AA000000")!
    public static let halftransparentblackcolor = Color(halftransparentblackcolorUI)
    
    public static let connquantityhighUI = MyColor.getUIColorFromHex("#009746")!
    public static let connquantityhigh = Color(connquantityhighUI)
    
    public static let dividerwhitecolorUI = MyColor.getUIColorFromHex("#80FFFFFF")!
    public static let dividerwhitecolor = Color(dividerwhitecolorUI)
    
    public static let selectedmenucolorUI = MyColor.getUIColorFromHex("#9ABFC8")!
    public static let selectedmenucolor = Color(selectedmenucolorUI)
    
    public static let yellowcardcolorUI = MyColor.getUIColorFromHex("#DDD67C")!
    public static let yellowcardcolor = Color(yellowcardcolorUI)
    
    public static let vipstatusbackgroundUI = MyColor.getUIColorFromHex("#424242")!
    public static let vipstatusbackground = Color(vipstatusbackgroundUI)
    
    public static let vipstatusprogressbarbackgroundUI = MyColor.getUIColorFromHex("#727270")!
    public static let vipstatusprogressbarbackground = Color(vipstatusprogressbarbackgroundUI)
    
    public static let vipstatusgoldcolorUI = MyColor.getUIColorFromHex("#FEE497")!
    public static let vipstatusgoldcolor = Color(vipstatusgoldcolorUI)
    
    public static let notsbackredcolorUI = MyColor.getUIColorFromHex("#E31E25")!
    public static let notsbackredcolor = Color(notsbackredcolorUI)
    
    public static let notsbackgraycolorUI = MyColor.getUIColorFromHex("#D5D5D5")!
    public static let notsbackgraycolor = Color(notsbackgraycolorUI)
    
    public static let notsalarmtextcolorUI = MyColor.getUIColorFromHex("#583839")!
    public static let notsalarmtextcolor = Color(notsalarmtextcolorUI)
    
    public static let flussonicbackgroundUI = MyColor.getUIColorFromHex("#ff1c2029")!
    public static let flussonicbackground = Color(flussonicbackgroundUI)
    
    public static let gradientfirstcolorUI = MyColor.getUIColorFromHex("#FF4F8B9E")!
    public static let gradientfirstcolor = Color(gradientfirstcolorUI)
    
    public static let gradientsecondcolorUI = MyColor.getUIColorFromHex("#FFA0C5DC")!
    public static let gradientsecondcolor = Color(gradientsecondcolorUI)
    
    public static func getUIColorFromColor(_ color: Color) -> UIColor?
    {
        do
        {
            let colorstr = "\(color)"
            let regex = try NSRegularExpression(pattern: "[0-9]+([.][0-9]+)?", options: [])
            let matches = regex.matches(in: colorstr, options: [], range: NSRange(location: 0, length: colorstr.count))
            
            if (matches.count > 2)
            {
                if  let red = Double((colorstr as NSString).substring(with: matches[0].range)),
                    let green = Double((colorstr as NSString).substring(with: matches[1].range)),
                    let blue = Double((colorstr as NSString).substring(with: matches[2].range)),
                    let alpha = Double((matches.count > 3) ? (colorstr as NSString).substring(with: matches[3].range) : "1")
                {
                    return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
                }
            }
        }
        catch
        {
            print("Ошибка преобразования SwiftUI Color в UIColor: \(error.localizedDescription)")
        }
        return nil
    }
    
    public static func getTransparentBackgroundColor(_ color: String) -> Color
    {
        let transparentcoef = "66";
        var newcolor = "#";
        if (color.count == 6)
        {
            newcolor += "\(transparentcoef)\(color)"
        }
        else if (color.count == 7)
        {
            newcolor += "\(transparentcoef)\(color.suffix(color.count - 1))"
        }
        else if (color.count == 8)
        {
            newcolor += "\(transparentcoef)\(color.suffix(color.count - 2))"
        }
        else if (color.count == 9)
        {
            newcolor += "\(transparentcoef)\(color.suffix(color.count - 3))"
        }
        else
        {
            newcolor += color;
        }
        
        if let temp = getUIColorFromHex(newcolor)
        {
            return Color(temp);
        }
        return Color.white
    }
    
    
    
    
    
}
