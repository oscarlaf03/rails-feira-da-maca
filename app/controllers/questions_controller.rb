class QuestionsController < ApplicationController
  before_action :set_product, only: [:create, :update, :new, :edit]
  before_action :set_user, only: [:create, :new,:edit, :update]
  before_action :set_question, only: [:edit ,:update]

  def new
    @question = Question.new
    authorize @question
  end

  def create
    @question = Question.new(check_questions_params)
    authorize @question
    @question.asker = @user
    @question.product = @product
    if @question.save
      respond_to  do |format|
        format.html {redirect_to product_path(@product)}
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'shared/form_questions'}
        format.js
      end
    end
  end

  def edit
  end

  def update

    if @question.update(check_questions_params)
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def check_questions_params
    params.require(:question).permit(:question_description, :answer_description)
  end

  def set_user
    @user = current_user
  end

  def set_question
    @question = Question.find(params[:id])
    authorize @question
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end
