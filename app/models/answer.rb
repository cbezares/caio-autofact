class Answer < ApplicationRecord
  belongs_to :user

  QUESTIONS = [
    { id: 1, title: "¿Qué te gustaría que agregáramos al informe?", options: [] },
    { id: 2, title: "¿La información es correcta?", options: ["SI", "NO", "Más o menos"] },
    { id: 3, title: "¿Del 1 al 5, es rápido el sitio?", options: ["1", "2", "3", "4", "5"] }
  ]

  def self.can_get_questions? user
    if user.answers.any?
      last_answer_date = user.get_last_answer.created_at
      current_date = Time.now
      last_answer_date.month.to_s + "/" + last_answer_date.year.to_s != current_date.month.to_s + "/" + current_date.year.to_s
    else
      true
    end
  end
end
