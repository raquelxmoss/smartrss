def current_user
  @current_user = User.find_by_id(session[:user_id])
end

def create_initial_user_article_states(current_user, feed)
  feed.articles.each do |article|
    current_user.user_article_states.create(article_id: article.id, )
  end
end
