get '/new_survey1' do
  
  erb :new_survey
end

get "/survey_view/:survey_id" do
  puts "="* 80
  puts"params"
  puts params
  
  @survey = Survey.find(params[:survey_id])

  # puts "="* 80
  # puts"params"
  # @params = params
  #@survey
  puts"@survey"
  @questions = @survey.questions
  erb :survey_view
end

get '/delete_survey/:survey_id' do
  survey = Survey.find(params[:survey_id])
  survey.destroy
   # @notice = "Survey exitosamente borrado"
   # @survey_name = params[:survey_name]
   redirect("/user_profile")
end

get '/update_survey/:survey_id' do

  @survey = Survey.find(params[:survey_id])


  @questions = @survey.questions
  @choices = []

  @questions.each do |question|
      @choices << question.choices
  end
  puts "CHOICES: #{@choices}"
  erb :edit_survey
end

get '/survey/edit/:id' do
  puts "+" * 50
  @survey = Survey.find(params[:id])
  erb :update_survey
end

post '/new_survey2' do
  puts "=" * 50
  puts params
  name = params[:survey_name]
  new_question = params[:question]
  new_choice1 = params[:choice1]
  new_choice2 = params[:choice2]
  new_choice3 = params[:choice3]
  survey_name = Survey.create(user_id: current_user.id, survey_name: name)
  question = Question.create(survey_id: survey_name.id, question: new_question)
  choice1 =Choice.create(question_id: question.id, choice: new_choice1)
  choice2 =Choice.create(question_id: question.id, choice: new_choice2)
  choice3 =Choice.create(question_id: question.id, choice: new_choice3)
 puts "=" * 50
  puts survey_name
  redirect to("/user_profile")
end

post '/modify_survey/:id' do
  p "X"*100
  p params
  @survey = Survey.find(params[:id])
  @survey.update(survey_name:params[:survey_name])
  @question = @survey.questions.first
  @question.update(question:params[:question])
  params[:choices].each do |choice_id,val|
    Choice.find(choice_id).update(choice: val)
  end

 # p @survey 
 #  puts "="*50
 #  puts params


 #  puts "=" * 50
 #  puts params
 #  modify_name = params[:survey_name]
 #  modify_question = params[:question]
 #  modify_choice1 = params[:choice1]
 #  modify_choice2 = params[:choice2]
 #  modify_choice3 = params[:choice3]

 #  survey_inst = Survey.find(:id)
 #  question_inst = Question.find_by(:question)
 #  choice_inst1 = Choice.find_by(:choice1)
 #  choice_inst2 = Choice.find_by(:choice2)
 #  choice_inst3 = Choice.find_by(:choice3)

 #  survey_name = survey_inst.update(survey_name: modify_name)
 #  question = question_inst.update(question: modify_question)
 #  choice1 =choice_inst1.update(choice: modify_choice1)
 #  choice2 =choice_inst2.update(choice: modify_choice2)
 #  choice3 =choice_inst3.update(choice: modify_choice3)
 #  puts "=" * 50
  redirect to("/survey_view/#{@survey.id}")
end






# get "user/edit/:id"

#   @user = User.find(params[:id])
#   # Primera forma
#   @user.update(first_name: params[:first_name],last_name: params[:last_name], email: params[:email],password: params[:password])
#   # Segunda forma
#   @user.update(params[:user])


# end

# # Primera forma
# <input type="text" name="first_name" value="<%= @survey.survey_name %>" >
# <input type="text" name="last_name" value="<%= @survey.survey_name %>" >
# <input type="text" name="email" value="<%= @survey.survey_name %>" >
# <input type="text" name="password" value="<%= @survey.survey_name %>" >

# # Segunda forma
# <input type="text" name="user[first_name]" value="<%= @survey.survey_name %>" >
# <input type="text" name="user[last_name]" value="<%= @survey.survey_name %>" >
# <input type="text" name="user[email]" value="<%= @survey.survey_name %>" >
# <input type="text" name="user[password]" value="<%= @survey.survey_name %>" >


