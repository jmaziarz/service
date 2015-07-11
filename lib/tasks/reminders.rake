namespace :reminders do
  desc 'Generate monthly reminder reports'
  task monthly: :environment do
    Group.all.each do |g|
      puts "Generating monthly reminder for group: #{g.name}"
      puts "  Sending email to overseer: #{g.overseer.email}"
      puts "  Sending email to assistant: #{g.assistant.email}"
      puts ""

      g.reports.current.each do |r|
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
