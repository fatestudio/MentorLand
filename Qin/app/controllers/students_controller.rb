class StudentsController < ApplicationController
  # GET /students/1
  def show
    @student = current_user
    my_enrollments = Enrollment.where(:user_id => @student.id)
    my_courses = []
    my_enrollments.each do |e|
      my_courses << Course.find(e.course_id)
    end
    @my_courses = my_courses
    @courses = Course.all
  end

  # POST /students/1	add a course to a student
  def addCourse
    @enrollment = Enrollment.create(:course_id => params[:course_id], :user_id => current_user.id)

    respond_to do |format|
      if @enrollment.save
        flash[:notice] = "Enrollment was successfully created!" 
        format.html { redirect_to student_url }
      else 
	flash[:error] = "Cannot create this enrollment!"
        format.html { redirect_to student_url }
      end
    end
  end
end
