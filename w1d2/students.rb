class Student
  attr_accessor :first_name, :last_name

  def initialize
    @first_name, @last_name = '', ''
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def courses
    @courses
  end

  def enroll(course)
    course.add_student(self)
    @courses << course
  end

  def course_load
    @department_hash = Hash.new(0)
    @courses.each do |course|
      @department_hash[course.course_department] += course.credits
    end

    @department_hash
  end
end

class Course
  attr_accessor :course_department, :credits, :course_department, :course_name

  def initialize
    @course_name, @course_department = '', ''
    @credits = 0
    @students = []
  end

  def students
    @students
  end

  def add_student(student)
    @students << student unless @students.include?(student)
  end
end