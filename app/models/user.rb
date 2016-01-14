class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :user_surveys
  has_many :surveys , :through => :user_surveys

  has_many :answers
end
