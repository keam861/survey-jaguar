helpers do
  def current_survey
    puts "hW"
    if session[:user_id]
      @current_survey ||= Survey.find_by_id(session[:user_id])
    end
  end
end