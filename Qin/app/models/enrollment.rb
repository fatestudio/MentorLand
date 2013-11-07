class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  attr_accessible :user_id, :course_id

end

