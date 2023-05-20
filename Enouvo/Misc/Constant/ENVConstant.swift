//
//  ENVConstant.swift
//  Enouvo
//
//  Created by Minh Quan on 20/05/2023.
//

import UIKit


enum TitleString: String {
    case zipcode                        = "ZIPCODE"
    case search                         = "Search"
    case category                       = "Category"
    case workDetail                     = "Work Detail"
    case submitABid                     = "Submit a bid"
    
    public func string() -> String {
        return self.rawValue
    }
}

enum Assets {
    
    enum Color: String {
        case primary_color = "PrimaryColor"
        case bgColor = "bgColor"
        case grayColor = "grayColor"
        case teriaryColor = "TeriaryColor"
        
        public func string() -> String {
            return self.rawValue
        }
        
        public func color() -> UIColor {
            return UIColor(named: self.rawValue)!
        }
    }
    
    enum Icon: String {
        case ic_back                    = "ic_back"
        case ic_back_blue               = "ic_back_blue"
        case ic_collection              = "ic_collection"
        case ic_list                    = "ic_list"
        case ic_notification            = "ic_notification"
        case ic_premium                 = "ic_premium"
        case ic_about_us                = "ic_about_us"
        case ic_term_and_condition      = "ic_term_and_condition"
        case ic_privacy_policy          = "ic_privacy_policy"
        case ic_share_app               = "ic_share_app"
        case ic_rating                  = "ic_rating"
        case ic_feedback                = "ic_feedback"
        case ic_share                   = "ic_share"
        case ic_logo                    = "ic_logo"
        case ic_save                    = "ic_save"
        case ic_saved                   = "ic_saved"
        
        public func string() -> String {
            return self.rawValue
        }
    }
    
    enum Background: String {
        case bg_premium_try_for_free    = "bg_premium_try_for_free"
        case bg_premium_insect          = "bg_premium_insect"
        case bg_premium_gradient        = "bg_premium_gradient"
        case bg_capture_take_photo      = "bg_capture_take_photo"
        case bg_capture_flash           = "bg_capture_flash"
        case bg_capture_library         = "bg_capture_library"
        case bg_capture_unflash         = "bg_capture_unflash"
        
        public func string() -> String {
            return self.rawValue
        }
    }
    
    enum LaunchImage: String {
        case appicon                    = "appicon"
        
        public func string() -> String {
            return self.rawValue
        }
    }
    
    enum Onboarding: String {
        case ic_fullname                = "ic_fullname"
        case ic_password                = "ic_password"
        case ic_phone                   = "ic_phone"
        
        public func string() -> String {
            return self.rawValue
        }
    }
    
    enum Payment: String {
        case ic_card_normal             = "ic_card_normal"
        case ic_card_selected           = "ic_card_selected"
        case ic_jcb_selected            = "ic_jcb_selected"
        case ic_mastercard_selected     = "ic_mastercard_selected"
        case ic_visa_normal             = "ic_visa_normal"
        case ic_visa_selected           = "ic_visa_selected"
        
        public func string() -> String {
            return self.rawValue
        }
    }
    
    enum Profile: String {
        case background_blue            = "background_blue"
        case background_top             = "background_top"
        
        public func string() -> String {
            return self.rawValue
        }
    }
    
    enum Progress: String {
        case ic_retry                   = "ic_retry"
        case ic_wireless                = "ic_wireless"
        
        public func string() -> String {
            return self.rawValue
        }
    }
    
    enum Slider: String {
        case favorited_slider           = "favorited_slider"
        case home_slider                = "home_slider"
        case ic_invite                  = "ic_invite"
        case logout_slider              = "logout_slider"
        case my_inbox_slider            = "my_inbox_slider"
        case settings_slide             = "settings_slide"
        case user_guide_slide           = "user_guide_slide"
        
        public func string() -> String {
            return self.rawValue
        }
    }
    
    enum Tabbar: String {
        case ic_home                    = "ic_home"
        case ic_favourites              = "ic_favourites"
        case ic_history                 = "ic_history"
        case ic_settings                = "ic_settings"
        case ic_capture                 = "ic_capture"
        case background_tabbar          = "background_tabbar"
        
        public func string() -> String {
            return self.rawValue
        }
    }
}
