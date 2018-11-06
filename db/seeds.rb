# frozen_string_literal: true

return unless Rails.env.development?

AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)

competition = Competition.create(name: 'World Championship')

cloud9 = Team.create(name: 'Cloud9', acronym: 'C9', slug: 'cloud-9')
tsm = Team.create(name: 'Team SoloMid', acronym: 'TSM', slug: 'team-solo-mid')

Match.create(
  first_team: cloud9,
  second_team: tsm,
  started_at: Time.zone.now + 1.hour,
  competition: competition
)
