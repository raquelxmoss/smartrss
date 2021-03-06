get '/articles' do
  @articles = current_user.user_article_states.visible.map(&:article)
  haml :'articles/show'
end

put '/articles/:id/mark-as-read' do
  article = current_user.user_article_states.where(article_id: params[:id]).first
  article.update(read: true)
  redirect to '/feeds'
end