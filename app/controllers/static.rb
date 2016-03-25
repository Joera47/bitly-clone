get '/' do		
	@line1, @line2 = "", ""
	erb :"static/index"
end

post '/urls' do
	@url = Url.find_by link: params[:long_url]
	redirect '/' if params[:long_url].empty?	
	unless Url.validate(params[:long_url])
		@line1 = "Error. Please provide a valid link"
		erb :"static/index"
	else
		@url = Url.shorten(params[:long_url]) if @url == nil
		@line1 = "Original link: #{@url["link"]}"
		@line2 = "Shrinked link: localhost:9393/#{@url["short_link"]}"
		erb :"static/index"
	end
end

get '/:short' do
	@url = Url.find_by short_link: params[:short]
	p @url
	@url.count
	redirect to "#{@url[:link]}"
end