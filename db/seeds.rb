UserDetail.delete_all
User.delete_all
Broadcast.delete_all

User.transaction do
  1..40.times do |i|
    user = User.create(surname: "Surname#{i}",
                       firstname: "Firstname#{i}",
                       email: "user#{i}@aber.ac.uk",
                       phone: '07000 00000',
                       grad_year: 2016)
    UserDetail.create!(login: "user#{i}",
                       password: 'pass',
                       user: user)
  end

  # Create one special admin user
  user = User.create!(surname: 'Admin',
                      firstname: 'Admin',
                      email: 'admin@aber.ac.uk',
                      phone: '07000 000000',
                      grad_year: 2016)
  UserDetail.create!(login: 'admin',
                     password: 'admin',
                     user: user)

  # Create some dummy feeds
  Feed.create!(name: 'twitter')
  Feed.create!(name: 'facebook')
  Feed.create!(name: 'email')
  Feed.create!(name: 'RSS')
  Feed.create!(name: 'atom')
  Feed.create!(name: 'CSA')

  1..40.times do |i|
    Broadcast.create(content: "TestContent#{i}",
                     user: user)
  end
end
