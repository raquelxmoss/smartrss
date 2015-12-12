enable :sessions
require 'feedjira'

post '/feeds/new' do
  if feed = Feed.add_new(params[:url])
    current_user.feeds << feed
    create_initial_user_article_states(current_user, feed)
    redirect to '/feeds'
  else
    redirect to '/'
  end
end

get '/feeds' do
  @feeds = current_user.feeds
  haml :'feeds/index'
end

get '/feeds/:id' do
  @feed = Feed.find(params[:id])
  haml :'feeds/show'
end