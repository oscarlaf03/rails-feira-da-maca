class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def show
    scope.all
  end

  def scope
    record.all
  end

  def update?
    # record.product.owner == user && question.answer_description.nil?
    true
  end

end
