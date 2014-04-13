namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    # make_admins
    # make_resources
    # make_glossaries
    # make_english_brochures
    # make_tags
    make_taggings
  end
end

def make_admins
  5.times do |n|
    email = "johndoe#{n+1}@cornell.edu"
    password = "foobar"
    password_confirmation = "foobar"
    Admin.create!(email: email,
                  password: password,
                  password_confirmation: password)
  end
end

def make_resources
  30.times do
    admin = Admin.all.sample
    name = Faker::Lorem.sentence(5)
    p_voice = Faker::PhoneNumber.phone_number
    p_fax = Faker::PhoneNumber.phone_number
    p_tty = Faker::PhoneNumber.phone_number
    p_other = Faker::PhoneNumber.phone_number
    p_other_desc = Faker::Lorem.sentence
    street_1 = Faker::Address.street_address
    street_2 = Faker::Address.street_address
    city = Faker::Address.city
    state = Faker::Address.state
    zip = Faker::Address.zip
    url = Faker::Internet.url
    desc = Faker::Lorem.paragraph
    language = 1
    resource = admin.resources.create!(name: name,
                                      p_voice: p_voice,
                                      p_fax: p_fax,
                                      p_tty: p_tty,
                                      p_other: p_other,
                                      p_other_desc: p_other_desc,
                                      street_1: street_1,
                                      street_2: street_2,
                                      city: city,
                                      state: state,
                                      zip: zip,
                                      url: url,
                                      desc: desc,
                                      language: language)
  end
end

def make_glossaries
  30.times do |n|
    admin = Admin.all.sample
    project = Faker::Lorem.sentence(10)
    term = Faker::Lorem.sentence(10)
    source = Faker::Lorem.sentence(7)
    source_label = Faker::Lorem.sentence(5)
    source_year = (2000+30%(n+1)).to_s
    stats_id = (n%4).to_s
    definition = Faker::Lorem.paragraph
    language = 1
    admin.glossaries.create!(project: project,
                            term: term,
                            source: source,
                            source_label: source_label,
                            source_year: source_year,
                            stats_id: stats_id,
                            definition: definition,
                            language: language)
  end
end

def make_english_brochures
  30.times do |n|
    admin = Admin.all.sample
    topic = Faker::Lorem.sentence(7)
    name = Faker::Lorem.sentence(10)
    group_id = rand(5) + 1
    link = Faker::Internet.url
    content = Faker::Lorem.paragraph
    pdf_link = Faker::Internet.url
    author_hist = Faker::Lorem.sentence(30)
    admin.english_brochures.create!(topic: topic,
                                    name: name,
                                    group_id: group_id,
                                    link: link,
                                    content: content,
                                    pdf_link: pdf_link,
                                    author_hist: author_hist)
  end
end

def make_tags
  ActsAsTaggableOn::Tag.all.each do |t|
    t.delete
  end
  fopen = File.open("lib/tags.txt", "r")
  tags = fopen.gets.split("\r")
  tags.each do |tag|
    ActsAsTaggableOn::Tag.create!(name: tag)
  end
  fopen.close
end

def make_taggings
  Brochure.all.each do |b|
    t1 = ActsAsTaggableOn::Tag.all.sample
    t2 = ActsAsTaggableOn::Tag.all.sample
    t3 = ActsAsTaggableOn::Tag.all.sample
    b.tag_list.add(t1.name,t2.name,t3.name)
    b.save
  end
end