class Student < User
  has_many :courses, through: :enrollments
end
