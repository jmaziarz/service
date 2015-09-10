namespace :reports do
  desc 'Generate a blank report for each publisher for the current month'
  task generate: :environment do
    Publisher.active.each do |p|
      p.reports.create!
    end
  end

  desc 'Generate list of missing reports by group and publisher'
  task missing: :environment do
    Group.all.each do |g|
      puts "Group: #{g.name}"
      puts
      g.publishers.each do |p|
        not_reported = p.reports.not_reported.pluck(:report_for)
        unless not_reported.empty?
          not_reported.map! {|d| d.strftime("%Y-%m")}
          puts "  * #{p.last_name}, #{p.first_name} (#{not_reported.join(', ')})"
        end
      end
      puts
    end
  end
end
