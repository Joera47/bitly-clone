class Url < ActiveRecord::Base
	validates :link, format: {with: URI.regexp}
	
	def self.shorten(details)	
		attributes = {}
		check = false
		list = Url.all
		attributes[:link] = details
		
		@url = Url.find_by(link: details) # Does link exist?
		if @url == nil
			@url = Url.new
			@url.link = details
			@url.short_link = SecureRandom.hex(3)
			@url.save
		end
		return @url
	end

	def self.validate(details)
		Url.new(link: details).valid?
	end

	def up_count
		self.update(clickcount: self.clickcount + 1)
	end
end
