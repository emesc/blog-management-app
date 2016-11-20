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

news = Subject.create(title: 'News')
news.sections.create(title: 'Marfa pickled DIY', complete: true, priority: 6, body: "Salvia listicle succulents man bun mlkshk, roof party hoodie unicorn enamel pin chillwave cornhole 3 wolf moon godard 8-bit. Blue bottle snackwave authentic, drinking vinegar keytar knausgaard swag etsy single-origin coffee butcher literally health goth.")
news.sections.create(title: 'Williamsburg trust fund', complete: false, priority: 3, body: "Deep v etsy man braid DIY chartreuse meditation, shabby chic vice tote bag beard marfa street art franzen butcher post-ironic. Lyft tote bag before they sold out polaroid gentrify. Chicharrones vaporware narwhal tattooed activated charcoal.")

food = Subject.create(title: 'Food')
food.sections.create(title: 'PBR&B cold-pressed vaporware', complete: false, priority: 9, body: "YOLO gentrify ennui, authentic portland bespoke raclette leggings master cleanse selvage fingerstache intelligentsia. Fam pok pok typewriter, raw denim normcore succulents polaroid poke.")
food.sections.create(title: 'Unicorn af cronut', complete: true, priority: 7, body: "Tattooed waistcoat ethical fashion axe. Sartorial chillwave migas franzen photo booth, keytar disrupt kale chips bushwick lomo. Quinoa brunch pug, craft beer direct trade kickstarter butcher ethical mixtape lomo yuccie prism vice hammock jianbing.")
food.sections.create(title: 'Authentic food truck austin', complete: true, priority: 4, body: "Shoreditch green juice activated charcoal af church-key humblebrag. Put a bird on it pug typewriter normcore hella echo park. Trust fund wolf tofu brooklyn snackwave, franzen banjo meditation DIY literally hell of cornhole.")

User.create(first_name: "Abraham", last_name: "Lincoln")
User.create(first_name: "George", last_name: "Washington")
User.create(first_name: "Franklin", middle_initial: "D", last_name: "Roosevelt")
User.create(first_name: "Woodrow", last_name: "Wilson")
User.create(first_name: "John", middle_initial: "F", last_name: "Kennedy")


Product.create(name: "Wise Man's Fear", price: 8.99)
Product.create(name: 'Ukelele Starter Kit', price: 59.99)
Product.create(name: 'KNEX K-Force', price: 16.00)
Product.create(name: 'Palm Sander', price: 15.59)
Product.create(name: 'Bed Sheet', price: 39.98)
Product.create(name: 'Security Camera', price: 119.00)

Category.create(name: 'Books')
Category.create(name: 'Electronics')
Category.create(name: 'Music')
Category.create(name: 'Gifts')
Category.create(name: 'Tools')
Category.create(name: 'Home')
