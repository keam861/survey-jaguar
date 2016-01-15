get '/new_survey1' do
  
  erb :new_survey
end

post '/new_survey2' do
  puts "=" * 50
  puts params
  redirect to("/user_profile")
end