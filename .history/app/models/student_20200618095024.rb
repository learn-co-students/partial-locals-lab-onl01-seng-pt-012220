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

  def self.query(query)
    if query
      query_students = Student.where("name LIKE ?", "%#{query}%")
      if query_students
        @students = query_students
      else
        @students = Student.all
      end
    else
      @students = Student.all
    end
  end
  
end
