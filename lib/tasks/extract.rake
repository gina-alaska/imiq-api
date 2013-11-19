namespace :extract do
  desc "Extract source data out to a json file"
  task :source => :environment do
    File.open(Rails.root.join('db/sources.json'), 'w') do |fp|
      fp << Source.all.to_json
    end
  end
end