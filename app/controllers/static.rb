get '/' do
	@line1, @line2 = "", ""	# Default values
	erb :"static/index"
end

post '/urls' do
	@url = Url.find_by(link: params[:long_url])

	redirect '/' if params[:long_url].empty?	# No Link Provided

	unless Url.validate(params[:long_url])		# Invalid Link
		@line1 = "Error. Please provide a valid link"
		erb :"static/index"	
	else										# Valid Link
		@line1 = "Original link: #{@url.link} "
		@line2 = "Shrinked link: #{request.base_url}/#{@url.short_link}"
		erb :"static/index"
	end
end

get '/:short' do	# Click on shortened link
	@url = Url.find_by(short_link: params[:short])
	@url.up_count
	redirect to "#{@url.link}"
end