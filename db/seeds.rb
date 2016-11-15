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
news.sections.create(title: 'Marfa pickled DIY', complete: true)
news.sections.create(title: 'Williamsburg trust fund', complete: false)

food = Subject.create(title: 'Food')
food.sections.create(title: 'PBR&B cold-pressed vaporware', complete: false)
food.sections.create(title: 'Unicorn af cronut', complete: true)
food.sections.create(title: 'Authentic food truck austin', complete: true)