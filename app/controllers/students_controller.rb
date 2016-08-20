class StudentsController < ApplicationController
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.

    def index
    end

    def show
      @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(student_params)
        if @student.save
          redirect_to student_path(@student)
        else
          render 'new'
        end
    end

    def edit
      @student = Student.find(params[:id])
    end

    def update
      @student = Student.find(params[:id])
      @student.update(first_name: student_params[:first_name], last_name: student_params[:last_name])

      redirect_to student_path(@student)
    end



    protect_from_forgery with: :exception

    private

    def student_params
      params.require(:student).permit(:first_name, :last_name)
    end
end
