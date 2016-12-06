# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Section.create(title: 'Marfa pickled DIY', complete: true)
# Section.create(title: 'Williamsburg trust fund', complete: false)
# Section.create(title: 'PBR&B cold-pressed vaporware', complete: false)
# Section.create(title: 'Unicorn af cronut', complete: true)
# Section.create(title: 'Authentic food truck austin', complete: true)

news = Subject.create(title: 'News', description: "Fundamental national conglomeration")
news.sections.create(title: 'Marfa pickled DIY', complete: true, priority: 6, body: "Salvia listicle succulents man bun mlkshk, roof party hoodie unicorn enamel pin chillwave cornhole 3 wolf moon godard 8-bit. Blue bottle snackwave authentic, drinking vinegar keytar knausgaard swag etsy single-origin coffee butcher literally health goth.", deadline: 2.days.from_now)
news.sections.create(title: 'Williamsburg trust fund', complete: false, priority: 13, body: "Deep v etsy man braid DIY chartreuse meditation, shabby chic vice tote bag beard marfa street art franzen butcher post-ironic. Lyft tote bag before they sold out polaroid gentrify. Chicharrones vaporware narwhal tattooed activated charcoal.", deadline: 1.day.from_now)
news.sections.create(title: 'Typewriter organic austin', complete: false, priority: 12, body: "Keytar swag pinterest, craft beer sustainable lyft trust fund distillery hoodie kinfolk ramps jean shorts freegan mixtape. Knausgaard affogato food truck umami flexitarian fixie, plaid yr truffaut locavore shabby chic banh mi chicharrones bicycle rights.", deadline: 2.days.from_now)

food = Subject.create(title: 'Food', description: "Open-architected clear-thinking policy")
food.sections.create(title: 'PBR&B cold-pressed vaporware', complete: false, priority: 9, body: "YOLO gentrify ennui, authentic portland bespoke raclette leggings master cleanse selvage fingerstache intelligentsia. Fam pok pok typewriter, raw denim normcore succulents polaroid poke.", deadline: 1.week.ago)
food.sections.create(title: 'Unicorn af cronut', complete: true, priority: 4, body: "Tattooed waistcoat ethical fashion axe. Sartorial chillwave migas franzen photo booth, keytar disrupt kale chips bushwick lomo. Quinoa brunch pug, craft beer direct trade kickstarter butcher ethical mixtape lomo yuccie prism vice hammock jianbing.", deadline: 2.weeks.from_now)
food.sections.create(title: 'Authentic food truck austin', complete: true, priority: 3, body: "Shoreditch green juice activated charcoal af church-key humblebrag. Put a bird on it pug typewriter normcore hella echo park. Trust fund wolf tofu brooklyn snackwave, franzen banjo meditation DIY literally hell of cornhole.", deadline: 5.days.from_now)
food.sections.create(title: 'Drinking vinegar flexitarian', complete: true, priority: 5, body: "Venmo VHS hot chicken fixie. Flexitarian DIY blog meditation woke art party. Cornhole umami fashion axe raw denim.", deadline: 4.weeks.from_now)
food.sections.create(title: 'Green juice chicharrones', complete: true, priority: 10, body: "Hashtag vinyl. IPhone austin ramps, vinyl try-hard twee banjo. XOXO biodiesel synth ugh. Green juice truffaut church-key, portland lumbersexual vaporware keytar edison bulb stumptown direct trade art party 8-bit.", deadline: 20.days.ago)
food.sections.create(title: 'Ramps disrupt', complete: true, priority: 7, body: "Tousled iPhone woke. Quinoa occupy etsy, literally trust fund irony fam. Biodiesel salvia thundercats ugh.", deadline: 2.weeks.ago)
food.sections.create(title: 'Slow-carb taxidermy affogato', complete: true, priority: 2, body: "Thundercats irony air plant portland shabby chic normcore lo-fi. Chia prism echo park, meggings hexagon waistcoat roof party kinfolk vape live-edge whatever copper mug. Edison bulb pabst hoodie, everyday carry salvia typewriter fashion axe pug wayfarers squid lo-fi schlitz neutra blue bottle umami.", deadline: 3.weeks.from_now)

books = Subject.create(title: 'Books', description: "Streamlined non-volatile contingency")
books.sections.create(title: 'Schlitz migas lomo', complete: true, priority: 1, body: "Drinking vinegar banjo iPhone, locavore gentrify pitchfork cornhole pop-up chillwave hell of mustache intelligentsia butcher pour-over. Vinyl typewriter unicorn, vaporware chicharrones jean shorts la croix.", deadline: 1.month.from_now)
books.sections.create(title: 'Viral subway tile', complete: false, priority: 8, body: "Tofu mlkshk kitsch, literally poutine gentrify selvage. Fanny pack fingerstache you probably haven't heard of them, mlkshk 90's kickstarter truffaut intelligentsia.", deadline: 2.days.ago)
books.sections.create(title: 'Pour-over tacos yuccie', complete: false, priority: 6, body: "Art party poke brooklyn, church-key PBR&B you probably haven't heard of them lumbersexual iPhone four loko pop-up actually trust fund wayfarers next level blue bottle.", deadline: 6.days.from_now)
books.sections.create(title: 'Ennui godard ', complete: true, priority: 11, body: "Cornhole sriracha health goth, photo booth dreamcatcher edison bulb small batch salvia ugh chillwave leggings kitsch gochujang mlkshk. Seitan selvage prism letterpress, vegan lumbersexual sriracha keffiyeh tbh taxidermy blue bottle.", deadline: 5.weeks.ago)

films = Subject.create(title: 'Films', description: "Cross-platform bottom-line interface")
f = 13
date1 = Time.now.to_time
date2 = 4.months.from_now.to_time
10.times do
  title = Faker::Company.catch_phrase
  complete = [true, false].sample
  body = Faker::Lorem.sentences(3, true).join(' ')
  f += 1
  deadline = Time.at((date2.to_f - date1.to_f) * rand + date1.to_f)
  films.sections.create(title: title, complete: complete, priority: f, body: body, deadline: deadline)
end

games = Subject.create(title: 'Games', description: "Devolved static matrix")
g = 24
10.times do
  title = Faker::Company.catch_phrase
  complete = [true, false].sample
  g += 1
  body = Faker::Lorem.sentences(3, true).join(' ')
  deadline = Time.at((date2.to_f - date1.to_f) * rand + date1.to_f)
  games.sections.create(title: title, complete: complete, priority: g, body: body, deadline: deadline)
end

clothing = Subject.create(title: 'Clothing', description: "Monitored multi-state open system")
c = 35
10.times do
  title = Faker::Company.catch_phrase
  complete = [true, false].sample
  c += 1
  body = Faker::Lorem.sentences(3, true).join(' ')
  deadline = Time.at((date2.to_f - date1.to_f) * rand + date1.to_f)
  clothing.sections.create(title: title, complete: complete, priority: c, body: body, deadline: deadline)
end

r1 = Role.create(name: "Regular", description: "Can read items")
r2 = Role.create(name: "Seller", description: "Can read and create items. Can update and destroy own items")
r3 = Role.create(name: "Admin", description: "Can perform any CRUD operation on any resource")

u1 = User.create(first_name: "Abraham", last_name: "Lincoln", email: "abe@example.com", password: "foobar", password_confirmation: "foobar", role_id: r3.id)
u2 = User.create(first_name: "George", last_name: "Washington", email: "george@example.com", password: "foobar", password_confirmation: "foobar", role_id: r2.id)
u3 = User.create(first_name: "Franklin", middle_initial: "D", last_name: "Roosevelt", email: "franklin@example.com", password: "foobar", password_confirmation: "foobar", role_id: r2.id)
u4 = User.create(first_name: "Woodrow", last_name: "Wilson", email: "woodrow@example.com", password: "foobar", password_confirmation: "foobar", role_id: r1.id)
u5 = User.create(first_name: "John", middle_initial: "F", last_name: "Kennedy", email: "john@example.com", password: "foobar", password_confirmation: "foobar", role_id: r1.id)

100.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = "foobar"
  password_confirmation = "foobar"
  User.create(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password_confirmation, role_id: r2.id)
end

c1 = Category.create(name: 'Books')
c2 = Category.create(name: 'Electronics')
c3 = Category.create(name: 'Music')
c4 = Category.create(name: 'Gifts')
c5 = Category.create(name: 'Tools')
c6 = Category.create(name: 'Home')
# can use Faker::Commerce.department(max, false(for fixed_amount)) but let's individually create this time
c7 = Category.create(name: 'Computers')
c8 = Category.create(name: 'Health')
c9 = Category.create(name: 'Automotive')
c10 = Category.create(name: 'Sports')
c11 = Category.create(name: 'Clothing')
c12 = Category.create(name: 'Shoes')
c13 = Category.create(name: 'Beauty')
c14 = Category.create(name: 'Movies')
c15 = Category.create(name: 'Kids')

p1 = Product.create(name: "Wise Man's Fear", price: 8.99, user_id: u3.id, category_ids: [1, 4])
p2 = Product.create(name: 'Ukelele Starter Kit', price: 59.99, user_id: u2.id, category_ids: [3, 4])
p3 = Product.create(name: 'KNEX K-Force', price: 16.00, user_id: u3.id, category_ids: [4])
p4 = Product.create(name: 'Palm Sander', price: 15.59, user_id: u2.id, category_ids: [5, 6])
p5 = Product.create(name: 'Bed Sheet', price: 39.98, user_id: u3.id, category_ids: [4, 6])
p6 = Product.create(name: 'Security Camera', price: 119.00, user_id: u2.id, category_ids: [5, 6])

1000.times do
  name = Faker::Commerce.product_name
  price = (rand(0..100.0) * 100).floor / 100.0
  user = ((1..105).to_a).sample
  p = Product.create(name: name, price: price, user_id: user)
  cat = ((1..15).to_a)
  n = (1..3).to_a.sample
  p.category_ids = cat.sample(n)
end


