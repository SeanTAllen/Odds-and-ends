require 'rubygems'
require 'nokogiri'

rules = "#content"
handler = nil
ns = {}
rules = rules.map { |rule|
  xpath_rule = Nokogiri::CSS.xpath_for(rule, :prefix => ".//", :ns => ns)
}.flatten.uniq + [ns, handler].compact

puts rules

paths = "#content"
ns = {}
paths = paths.map { |path|
  path = path.to_s
  path =~ /^(\.\/|\/)/ ? path : Nokogiri::CSS.xpath_for(
             path,
            :prefix => ".//",
             :ns     => ns
           )
         }.flatten.uniq + [ns]

puts paths
