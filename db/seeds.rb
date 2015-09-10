# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.open("#{Rails.root}/db/seeds/publishers.csv") do |publishers|
  publishers.read.each_line do |publisher|
    last_name, first_name, middle_name, pioneer, elder, servant, group_name = publisher.chomp.split(",")

    if Group.exists?(name: group_name)
      group = Group.where(name: group_name).first
    else
      group = Group.create(name: group_name)
    end

    if Publisher.create!(last_name: last_name, first_name: first_name, middle_name: middle_name, is_pioneer: pioneer, is_elder: elder, is_servant: servant, group: group)
      puts "Created publisher: #{last_name}, #{first_name} #{middle_name} in group #{group.name}"
    end
  end
end

File.open("#{Rails.root}/db/seeds/groups.csv") do |groups|
  groups.read.each_line do |group|
    name, overseer, assistant = group.chomp.split(",")
    g = Group.where(name: name).first
    g.overseer = Publisher.appointed.where(last_name: overseer).first
    g.assistant = Publisher.appointed.where(last_name: assistant).first
    if g.save
      puts "Updated group: #{g.name} with overseer #{g.overseer.last_name} and assistant #{g.assistant.last_name}"
    end
  end
end

date = Date.parse('2015-03-01')

puts "Generating blank reports for #{date}"
Publisher.active.each do |p|
  p.reports.create!(created_at: date)
end

File.open("#{Rails.root}/db/seeds/reports-march-2015.csv") do |reports|
  reports.read.each_line do |report|
    last_name, first_name, middle_name, card, books, brochures, hours, magazines, visits, studies, remarks, aux = report.chomp.split(",")

    if aux.nil?
      aux = false
    end

    if Publisher.exists?(last_name: last_name, first_name: first_name, middle_name: middle_name)
      publisher = Publisher.where(last_name: last_name, first_name: first_name, middle_name: middle_name).first
    else
      publisher = Publisher.create(last_name: last_name, first_name: first_name, middle_name: middle_name)
      puts "Created new publisher: #{last_name}, #{first_name} #{middle_name}"
    end

    if publisher.reports.by_month(date.month, date.year).exists?
      r = publisher.reports.by_month(date.month, date.year).first
      if r.update_attributes(books: books, brochures: brochures, hours: hours, magazines: magazines, visits: visits, studies: studies, remarks: remarks, report_for: date, reported_at: date, is_auxilliary_pioneer: aux)
        puts "Updated report: #{r.reported_at} for #{publisher.last_name}, #{publisher.first_name} #{publisher.middle_name}"
      end
    else
      puts "Couldn't find report."
    end
  end
end

date = Date.parse('2015-04-01')

puts "Generating blank reports for #{date}"
Publisher.active.each do |p|
  p.reports.create!(created_at: date)
end

File.open("#{Rails.root}/db/seeds/reports-april-2015.csv") do |reports|
  reports.read.each_line do |report|
    last_name, first_name, middle_name, card, books, brochures, hours, magazines, visits, studies, remarks = report.chomp.split(",")

    if Publisher.exists?(last_name: last_name, first_name: first_name, middle_name: middle_name)
      publisher = Publisher.where(last_name: last_name, first_name: first_name, middle_name: middle_name).first
    else
      publisher = Publisher.create(last_name: last_name, first_name: first_name, middle_name: middle_name)
      puts "Created new publisher: #{last_name}, #{first_name} #{middle_name}"
    end

    if publisher.reports.by_month(date.month, date.year).exists?
      r = publisher.reports.by_month(date.month, date.year).first
      if r.update_attributes(books: books, brochures: brochures, hours: hours, magazines: magazines, visits: visits, studies: studies, remarks: remarks, created_at: date, report_for: date, reported_at: date)
        puts "Updated report: #{r.reported_at} for #{publisher.last_name}, #{publisher.first_name} #{publisher.middle_name}"
      end
    else
      puts "Couldn't find report."
    end
  end
end
