Pod::Spec.new do |s|
  s.name         = "JLFractionHelper"
  s.version      = "0.0.2"
  s.summary      = "Provide arithmetic functions on fractional numbers"
  s.description  = <<-DESC
                   Currently, only add and multiply are implemented. Subtract
                   and divide will be next.   

                   DESC
  s.homepage     = "https://www.linkedin.com/in/joeleung"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Joe Leung" => "joe@brightcats.com" }
  s.social_media_url   = "http://twitter.com/kjoeleung"

  s.platform     = :ios
  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/kjleung/JLFractionHelper.git", :tag => "0.0.2" }
  s.source_files  = "*.{h,m}"
end
