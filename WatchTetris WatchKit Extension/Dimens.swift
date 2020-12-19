import SwiftUI

public class Dimens
{
    public static let activity_horizontal_margin = CGFloat(16)
    public static let activity_vertical_margin = CGFloat(16)
    public static let nav_header_vertical_spacing = CGFloat(8)
    public static let nav_header_height = 176
    public static let fab_margin = CGFloat(16)
    
    public static let balancetextsize = CGFloat(60)
    public static let authorizationinputtextsize = CGFloat(45)
    public static let nametextsize = CGFloat(25)
    public static let addresstarifanddoublemenutextsize = CGFloat(18)
    
    public static let authorizationouttextsize = CGFloat(30)
    public static let defaulttextsize = CGFloat(19)
    public static let checkboxestextsize = CGFloat(18)
    public static let smalltextdescsize = CGFloat(16)
    
    public static let requesttextweight = 0.25
    public static let requestinputweight = 0.45
    public static let requestspaceweight = 0.025
    public static let inputfullscreenweight = 0.9
    
    public static let authlayoutmargin = CGFloat(65)
    public static let authorizationmargins = CGFloat(24)
    public static let doublemenuleftandrightpaddings = CGFloat(16)
    public static let doublemenutopandbottompaddings = CGFloat(16)
    public static let doublemenuhalflrpaddings = CGFloat(8)
    public static let doublemenuhalftbpaddings = CGFloat(8)
    public static let inputtopandbottompaddings = CGFloat(4)
    public static let doublemenumargin = CGFloat(8)
    public static let buttonelevationlength = 10
    
    public static let answerratinglrpaddings = CGFloat(15)
    public static let answerratingtbpaddings = CGFloat(10)
    public static let answerratingtextsize = CGFloat(18)
    public static let answerratingdatesize = CGFloat(13)
    public static let messagesiconheight = CGFloat(34)
    public static let messagesicontopmargin = CGFloat(10)
    
    public static let fs_chart_height = 56.0
    public static let fs_chart_height_collapsed = 8.0
    public static let fs_fifteen_minutes_line_height = 8.0
    public static let fs_five_minutes_line_height = 4.0
    public static let fs_hour_length_by_default_zoom = 120.0
    public static let fs_hour_line_height = 14.0
    public static let fs_one_minute_line_height = 3.0
    public static let fs_play_margin_end = 40.0
    public static let fs_play_width = 62.0
    public static let fs_ruler_line_width = 1.0
    public static let fs_time_label_text_size = 12.0
    public static let fs_timeline_max_zoom = 36.0
    public static let fs_timeline_min_zoom = 0.2
    
    public static func getFontSize(_ text: String, _ width: CGFloat) -> CGFloat
    {
        return min(35, Dimens.getOptimalFontSize(text: text, size: Dimens.addresstarifanddoublemenutextsize, needwidth: Double(width)) - 2)
    }
    
    private static func getOptimalFontSize(text: String, size: CGFloat, needwidth: Double) -> CGFloat
    {
        var answer = Double(size)
        var realwidth = 0.0
        if var font = UIFont(name: "PFDinTextCompPro-Regular", size: size)
        {
            realwidth = Double(text.size(withAttributes: [.font: font]).width)
            if (realwidth > needwidth)
            {
                while realwidth > needwidth && answer > 0.0
                {
                    answer -= 1.0
                    font = UIFont(name: "PFDinTextCompPro-Regular", size: CGFloat(answer))!
                    realwidth = Double(text.size(withAttributes: [.font: font]).width)
                }
            }
            else
            {
                while realwidth < needwidth && answer < 1000.0
                {
                    answer += 1.0
                    font = UIFont(name: "PFDinTextCompPro-Regular", size: CGFloat(answer))!
                    realwidth = Double(text.size(withAttributes: [.font: font]).width)
                }
                answer -= 1.0
            }
        }
        return CGFloat(answer > 0.0 ? answer : 1.0);
    }
}
