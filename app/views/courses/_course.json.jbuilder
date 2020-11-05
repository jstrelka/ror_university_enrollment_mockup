json.extract! course, :id, :number, :hours, :department_id, :created_at, :updated_at
json.url course_url(course, format: :json)
