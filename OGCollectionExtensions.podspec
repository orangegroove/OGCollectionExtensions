Pod::Spec.new do |s|
  s.name                 = "OrangeGroove Collection Extensions"
  s.version              = "0.1.0"
  s.summary              = "Extensions to Foundation collection classes"
  s.homepage             = "https://github.com/jksk/OGCollectionExtensions"
  s.license              = :type => "MIT"
  s.authors              = "Jesper" => "jesper@orangegroove.net"
  s.source               = :git => "https://github.com/jksk/OGCollectionExtensions.git", :tag => s.version.to_s
  s.platform             = :ios, "7.0"
  s.source_files         = "OGCollectionExtensions/"
  s.private_header_files = "OGCollectionExtensions/*Private.h"
  s.requires_arc         = true
end