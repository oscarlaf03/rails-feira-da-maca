module ApplicationHelper


  def unanswered_questions
    @products = []
    products = current_user.products
    products.each do |product|
      product.questions.each do |question|
        if question.answer_description == nil
          @products << product
        end
      end
    end
    @products.uniq
  end


  def question_count
    @counter = 0
    products = current_user.products
    products.each do |product|
      product.questions.each do |question|
        if question.answer_description == nil
          @counter += 1
        end
      end
    end
    @counter
  end


  end
