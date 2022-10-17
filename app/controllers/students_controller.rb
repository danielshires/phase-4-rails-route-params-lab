class StudentsController < ApplicationController

  def index

    if params[:name]
      students = Student.all.filter do |student| 
       student[:first_name].downcase == params[:name].downcase || student[:last_name].downcase == params[:name].downcase
      end
      return render json: students
    end

    students = Student.all
    render json: students
  end

  def show
    students = Student.find_by(id: params[:id])
    render json: students
  end

end
