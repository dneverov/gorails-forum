require 'csv'

namespace :import do

  desc "Import users from CSV"
  task users: :environment do
    filename = File.join Rails.root, "users.csv"
    counter = 0

    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      user = User.new row.to_hash.slice(:email, :first_name, :last_name)
      if user.save
        counter += 1 if user.persisted?
      else
        puts "  #{email} - #{user.errors.full_messages.join(',')}"
      end
    end

    puts "Imported #{counter} #{'user'.pluralize counter}"
  end
end
