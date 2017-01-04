# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

meetup_1 = Meetup.create(name: 'Dino Concert', description: 'Watch the crete sing & dance!', location: 'Crete DUH!')
meetup_2 = Meetup.create(name: 'PopSocket Sale', description: 'trade, sell, buy PopSockets!', location: 'PopSocket HQ')
