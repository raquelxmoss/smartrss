require 'pry'
enable :sessions

post '/users/new' do
  user = User.new(name: params[:name], email: params[:email])
  if user.save
    session[:user_id] = user.id
  end
  redirect to '/'
end