# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, File.join(Whenever.path, "log", "cron.log")

every :day, at: '3:00pm' do
  rake 'user_scores:update'
end

# Learn more: http://github.com/javan/whenever
