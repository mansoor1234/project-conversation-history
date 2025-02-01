# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a user
user = User.create!(
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password'
)

# Create multiple projects
projects = [
  { name: 'Project One', status: 'Pending'},
  { name: 'Project Two', status: 'Pending'},
  { name: 'Project Three', status: 'Pending'}
]

projects.each do |project_attrs|
  Project.create!(project_attrs)
end