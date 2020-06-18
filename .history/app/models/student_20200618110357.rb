# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query = "")
    if search
      search_students = Student.where("name LIKE ?", "%#{query}%")
      if search_students
        @students = search_students
      else
        @students = Student.all
      end
    else
      @students = Student.all
    end
  end

end
