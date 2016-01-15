get '/destroy_session' do
  session.clear
  redirect('/')
end

get '' do
    
end

post '/create_session' do
 
 email = params[:email]
 password =params[:password]
 puts params
 puts password

 user = User.authenticate(email, password)
  
  if user 
    session[:user_id] = user.id
    # puts "+" * 50

    # erb :user_profile
    redirect to("/user_profile/#{user.id}")
  else
    redirect to('/')
  end
end