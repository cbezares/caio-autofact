class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :registerable

  has_many :answers

  def get_last_answer
  	answers.last
  end

  def get_last_answer_by_question question
    answers.where(question_id: question).last
  end

  def admin?
    self.role == 1
  end

  def user?
    self.role == 2
  end

  def to_s
  	email
  end
end
