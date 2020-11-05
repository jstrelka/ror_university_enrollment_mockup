class Course < ApplicationRecord
  belongs_to :department
  has_many :sections

  validates_uniqueness_of :number, :department_id, scope: [:number, :department_id]
  validates_presence_of :department_id
  validates :number, inclusion: { in: (1000..9999) }
  validates :hours, inclusion: { in: (1..5) }

  def dept_name_course_num
    "#{self.department.name} #{self.number}"
  end

  def self.search_course(search)
    if search
      search = search.upcase
      dept = Department.find_by(name: search)
      if dept
        self.where(department_id: dept)
      else
        @courses = Course.all
      end
    else
      @courses = Course.all
    end
  end

end
