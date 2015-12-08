enable :sessions

post '/feeds/new' do
	feed = Feed.new(user_id: session[:user_id], url: params[:url])
	if feed.save
		redirect to '/'
	else
		redirect to '/'
	end
end