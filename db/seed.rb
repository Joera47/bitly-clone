# require 'csv'
require_relative '../app/models/url'

# class UrlsImporter
#   def self.import(filename=File.dirname(__FILE__) + "/urls.csv")
#     csv = CSV.new(File.open(filename))
#     csv.each do |links|
#       links = links[0]
#       Url.shorten(links)
#     end
#   end
# end
#UrlsImporter.import
p "Helloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo"
url = Url.all.sort_by {|k, v| k[:link]}.reverse.sort_by {|k, v| k[:clickcount]}.reverse

url.first(20).each do |x|
	p x
end

# people.sort_by { |k, v| v[:age] }
#   # => [[:joan, {:name=>"Joan", :age=>18}],
#         [:fred, {:name=>"Fred", :age=>23}],
#         [:pete, {:name=>"Pete", :age=>54}]]




# congress = Congressperson.where(in_office: 1).group(:state).count.sort_by {|state,count| state}.
# reverse.sort_by {|state,count| count}.reverse
# 		congress.each do |x|
# 			congress = Congressperson.where(in_office: 1, state: x[0]).group(:title).count
# 			unless congress["Sen"] == nil or congress["Rep"] == nil
# 				puts "#{x[0]}: #{congress["Sen"]} Senators, #{congress["Rep"]} Representative(s)"
# 			end
# 		end