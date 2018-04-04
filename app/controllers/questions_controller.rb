class QuestionsController < ApplicationController
  before_action :set_product, only: [:create, :update, :new, :edit]
  before_action :set_user, only: [:create, :new]

  def new
    @question = Question.new
    @product = Product.find(params[:product_id])
  end

  def create
    @question = Question.new(check_questions_params)
    @question.asker = @user
    @question.product = @product
    if @question.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def check_questions_params
    params.require(:question).permit(:question_description)
  end

  def set_user
    @user = current_user
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end
