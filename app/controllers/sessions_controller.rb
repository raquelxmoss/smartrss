post '/sessions/new' do
  user = User.find_by_email(params[:email])
  session[:user_id] = user.id
  redirect to '/'
end