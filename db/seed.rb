require 'csv'
require_relative '../app/models/url'

class UrlsImporter
  def self.import(filename=File.dirname(__FILE__) + "/urls.csv")
    csv = CSV.new(File.open(filename))
    csv.each do |links|
      links = links[0]
      Url.shorten(links)
    end
  end
end
UrlsImporter.import