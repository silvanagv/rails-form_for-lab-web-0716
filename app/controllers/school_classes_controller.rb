class SchoolClassesController < ApplicationController
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.

    def index
    end

    def show
      @school_class = SchoolClass.find(params[:id])
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(school_class_params)
        if @school_class.save
          redirect_to school_class_path(@school_class)
        else
          render 'new'
        end

    end

    def edit
      @school_class = SchoolClass.find(params[:id])
    end

    def update
      @school_class = SchoolClass.find(params[:id])
      @school_class.update(title: school_class_params[:title], room_number: school_class_params[:room_number])
      redirect_to school_class_path(@school_class)
    end



    protect_from_forgery with: :exception

    private

    def school_class_params
      params.require(:school_class).permit(:title, :room_number)
    end
end
