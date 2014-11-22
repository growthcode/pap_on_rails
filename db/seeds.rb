# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_count = 0
User.all.each do |user|
  if user.organization == "Faker_Seed"
    user_count += 1
    puts "================= Seed User '##{user_count}' ================="
    puts "Object: #{user}"
    puts "Name: #{user.first_name} #{user.last_name}"

    project_count = 0
    user.projects.each do |project|
      project_count += 1
      puts "  Project #{project_count}: #{project.project_name}" 
    end
    user.destroy
    puts  "\n"
    puts "#{user.first_name} #{user.last_name} and projects -- DESTROYED" + "\n\n"
  end
end

5.times do 
  user_first_name = Faker::Name.first_name
  user_last_name = Faker::Name.last_name
  user_email = Faker::Internet.safe_email(user_first_name) 

  user = User.create!(
    first_name: user_first_name,
    last_name: user_last_name,
    email: user_email,
    password: 'asdfasdf',
    password_confirmation: 'asdfasdf',
    organization: 'Faker_Seed'
  )


  user.projects.create!(
      [{project_name: "Perfect Sales Process"},
      {project_name: "WikiLogic App"},
      {project_name: "WikiWit"},
      {project_name: "Ruby OOP vs. Universe OOP"}]
    )

end

