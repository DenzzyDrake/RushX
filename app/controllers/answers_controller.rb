class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @pin = Pin.find(params[:pin_id])
    @answer = @pin.answers.create(answer_params)
    redirect_to pin_path(@pin)
  end
 
  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def correct_user
      @answer = current_user.answers.find_by(id: params[:id])
      redirect_to answers_path, notice: "Not authorized to edit this pin" if @answer.nil?
    end

    def answer_params
      params.require(:answer).permit(:description)
    end
end