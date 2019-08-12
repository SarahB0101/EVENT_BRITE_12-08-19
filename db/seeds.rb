require 'faker'

User.destroy_all




10.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'salut@yopmail.com', encrypted_password: Faker::TvShows::BreakingBad.episode, description: Faker::TvShows::Friends.quote)

end
