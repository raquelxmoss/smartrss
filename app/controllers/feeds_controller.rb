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
  @feeds = apply_feed_subscription_rules(current_user.feed_subscriptions)
  haml :'feeds/index'
end

get '/feeds/:id' do
  @feed = Feed.find(params[:id])
  haml :'feeds/show'
end