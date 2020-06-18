class ClassroomsController < ApplicationController
  def show
    @classroom = set_classroom
    @student = @classroom.oldest_student
    @students = @classroom.students
  end

  def index
    @classrooms = Classroom.all
  end

  private
  def set_classroom
    Classroom.find(params[:id])
  end
  def classroom_params
    params.require(:classroom).permit(
      :course_name,
      :semester,
      :classroom
    )
  end
end
