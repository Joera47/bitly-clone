class Url < ActiveRecord::Base
	validates :link, format: {with: URI.regexp}
	def self.shorten(details)
		attributes, check, list = {}, false, Url.all
		attributes[:link] = details.to_s
		until check == true			#to ensure that there is no duplicate of short_link for this 16.7 million database limit.
			attributes[:short_link], n = SecureRandom.hex(3), 0   
			list.each { |x| n = 1 if x.short_link == attributes[:short_link] }
			check = true if n == 0
		end
		attributes[:clickcount] = 0
		Url.create(attributes)
	end

	def self.validate(details)
		Url.new(link: details).valid?
	end

	def count
		self.clickcount = 0 if self.clickcount == nil
		self.update(clickcount: self.clickcount + 1)
	end
end