class QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:create]
  invisible_captcha honeypot: :namee, only: [:create, :update], on_spam: :spam_detected, timestamp_enabled: false


  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    @question.author = current_user if current_user.present?

    @question.create_question_hashtags


    if @question.save
      redirect_to user_path(@question.user), notice: 'Вопрос задан.'
    else
      render :edit
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос сохранен.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    user = @question.user
    @question.destroy

    redirect_to user_path(user), notice: 'Вопрос удален.'
  end

  private
    def authorize_user
      reject_user unless @question.user == current_user
    end

    # Use callbacks to share common setup or constraints between actions.
    def load_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      if current_user.present? && params[:question][:user_id].to_i == current_user.id
        params.require(:question).permit(:user_id, :text, :answer, :name)
      else
        params.require(:question).permit(:user_id, :text, :namee)
      end
    end

    def spam_detected
      redirect_to root_path, alert: 'Сработала спам-защита'
    end
end
