class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(classroom_params)
    @student = @classroom.oldest_student
  end

  def index
    @classrooms = Classroom.all
  end

  private
  def classroom_params
    params.require(:classroom).permit(
      :course_name,
      :semester,
      :room
    )
  end
end
