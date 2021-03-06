class MentorsController < ApplicationController
  # GET /mentors/1
  def show
    @mentor = current_user
    @courses = Course.where(:user_id => @mentor.id)
    @course = Course.new	# you must new one first!!
  end

  # POST /mentors/1
  # POST a course
  def createCourse
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        flash[:notice] = "Course was successfully created!" 
        format.html { redirect_to mentor_url }
      else 
	flash[:error] = "Cannot add this course!"
        format.html { redirect_to mentor_url }
      end
    end
  end

end
