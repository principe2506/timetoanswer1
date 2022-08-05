class AdminsBackoffice::QuestionsController < AdminsBackofficeController
    before_action :set_question, only: [:edit, :update, :show]
    before_action :get_subject, only: [:edit, :new]
    
    def index
        @questions = Question.includes(:subject).all.order(:description).page(params[:page]).per(10)
    end
    
    def new
        @question = Question.new
    end
    
    def create
        @question = Question.new(params_question)
        if @question.save()
            redirect_to admins_backoffice_questions_path, notice: "Pergunta cadastrada com sucesso!"    
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @question.update(params_question)
        redirect_to admins_backoffice_questions_path, notice: "Pergunta actualizada com sucesso!"    
        else
        render :edit
        end
    end
    
    def show
        if @question.destroy
        redirect_to admins_backoffice_questions_path, notice: "Pergunta excluida com sucesso!"    
        else
        render :index
        end
    end
    
    private
    
    def params_question
        params.require(:question).permit(:description, :subject_id,
            answers_attributes: [:id, :description, :correct, :_destroy])
    end
    
    def set_question
        @question = Question.find(params[:id])
    end

    def get_subject
        @subjects = Subject.all
    end
end