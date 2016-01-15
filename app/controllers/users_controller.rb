get '/update_user' do

  erb :edit
end

get '/delete_user/:user_id' do
  user = User.find(params[:user_id])
  user.destroy
  @notice = "Usuario exitosamente borrado"
  redirect("/?notice=#{@notice}")
  # puts "p" * 50
  # p user
end

get '/user_profile/:id' do 

  erb :user_profile 
end 

post '/create_user' do 
  # email = params[:user][:email]

  user = params[:user]
  # TEST in Console
  # puts "+" * 30 
  # p user
  user = User.new(params[:user]) #Insert data into database
  if user.save #Save to database
    session[:user_id] = user.id
    puts ">" * 50
    puts "Welcome"
    redirect to("/user_profile/#{user.id}")
  else
    #@errors = @user.errors
    puts ">" * 50
    redirect to('/')
  end
end

post '/update_user/:user_id' do
  user = User.find(params[:user_id])
  user.update(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
  
  # name = params[:user][:name]
  # puts name
  # puts "p" * 100
  # p user
  redirect to("/user_profile/#{user.id}")
end


  
