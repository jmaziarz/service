namespace :reminders do
  desc 'Generate monthly reminder reports'
  task monthly: :environment do
    Group.all.each do |g|
      puts "Generating monthly reminder for group: #{g.name}"
      puts "  Sending email to overseer: #{g.overseer.email}"
      puts "  Sending email to assistant: #{g.assistant.email}"
      puts ""

      if g.reports.by_month(4).not_reported.count > 0
        puts "  No reports for:"
        g.reports.by_month(4).not_reported.each do |r|
          puts "    * #{r.publisher.last_name}, #{r.publisher.first_name}"
        end
        puts ""
      end

      g.reports.by_month(4).each do |r|
        puts "  Report for #{r.publisher.last_name}, #{r.publisher.first_name}:"
        puts "    Remarks: #{r.remarks}"
        puts "    * Books: #{r.books}"
        puts "    * Brochures: #{r.brochures}"
        puts "    * Hours: #{r.hours}"
        puts "    * Magazines: #{r.magazines}"
        puts "    * Return Visits: #{r.visits}"
        puts "    * Individual Studies: #{r.studies}"
        puts ""
      end
    end
  end
end
