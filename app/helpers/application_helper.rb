module ApplicationHelper

  def question_count
    current_user.questions.where(answer_description: nil).count
  end

  def unanswered_questions
     current_user.questions.where(answer_description: nil).all
  end

end
