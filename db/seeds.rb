h = Hotel.create(name: 'Bates Motel',
                 address: 'Fairvale, CA 92225',
                 phone: '888-555-1111',
                 website: 'http://bates-motel.com')
h.add_flier(HotelFlier.new(day: Date.today, message: 'Have a Bloody Good Day!'))
