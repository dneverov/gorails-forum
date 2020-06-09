require 'csv'

namespace :import do

  desc "Import users from CSV"
  task users: :environment do
    filename = File.join Rails.root, "users.csv"
    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      # with a headers: option
      email, first, last = row.to_a.map(&:last)
      user = User.create(email: email, first_name: first, last_name: last)
      puts "  #{email} - #{user.errors.full_messages.join(',')}" if user.errors.any?
      counter += 1 if user.persisted?
    end

    puts "Imported #{counter} #{'user'.pluralize counter}"
  end
end
