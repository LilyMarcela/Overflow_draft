class AnswersController < ApplicationController
	before_action :authenticate_user!, only: [:create, :edit, :udpate, :destroy]


	def index
		@answers = Answer.all
	end

	def create
		@answer = Answer.new(answer_params)
		if @answer.save
			flash [:success] = "La respuesta ha sido guardada"
		end
		redirect_to question_path(params[:question_id])
	end

	def edit
	end

	def update
		if @answer.update(answer_params)
			flash [:success] = "La respuesta ha sido actualizada"
		end
		redirect_to question_path(params[:question_id])
	end

	def destroy
		@answer = Answer.find_by(question_id: params[:question_id], id: params[:id])
		if @answer.destroy
			flash [:success] = "La respuesta ha sido eliminada"
		end
		redirect_to question_path(params[:question_id])
	end

	private

	def answer_params
		params.require(:answer).permit(:body)
		.merge(user_id: current_user.id, question_id: params[:question_id])
	end

end
