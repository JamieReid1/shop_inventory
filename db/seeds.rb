
require('pry')
require_relative('../models/manufacturer')
require_relative('../models/product')


Product.delete_all()
Manufacturer.delete_all()


manufacturer1 = Manufacturer.new({ 'name' => 'Kirby Morgan',
                                   'address' => '1430 Jason Way, Santa Maria, CA 93455, USA',
                                   'tel_no' => '(805) 928-7772',
                                   'rep_name' => 'Dusty Johnson'
                                  })
manufacturer1.save()

manufacturer2 = Manufacturer.new({ 'name' => 'Submarine Manufacturing & Products',
                                   'address' => 'Blackpool Road, Newton, Preston, Lancashire, United Kingdom, PR4 3RE',
                                   'tel_no' => '01772 687 775',
                                   'rep_name' => 'James Middleton'
                                  })
manufacturer2.save()

manufacturer3 = Manufacturer.new({ 'name' => 'Apeks Marine Equipment',
                                   'address' => 'Neptune Way, Blackburn, United Kingdom, BB1 2BT',
                                   'tel_no' => '01254 692 200',
                                   'rep_name' => 'Kenneth Black'
                                  })
manufacturer3.save()

manufacturer4 = Manufacturer.new({ 'name' => 'Northern Diver',
                                   'address' => 'Appley Lane North, Appley Bridge, Wigan, Lancashire, WN6 9AE',
                                   'tel_no' => '01257 254 444',
                                   'rep_name' => 'Andrew Hardy'
                                  })
manufacturer4.save()


product1 = Product.new({ 'name' => 'Superlite 17B',
                         'category' => 'helmets',
                         'description' => 'Carbon fibre shell, SuperFlow regulator, neck dam clamp with hinged yoke.',
                         'buy_cost' => 4000,
                         'sell_cost' => 5600,
                         'quantity' => 4,
                         'manufacturer_id' => manufacturer1.id
                        })
product1.save()

product2 = Product.new({ 'name' => 'Superlite 27',
                         'category' => 'helmets',
                         'description' => 'Carbon fibre shell, SuperFlow 350 regulator, neck dam ring with hinged locking collar and pull pins.',
                         'buy_cost' => 4200,
                         'sell_cost' => 5800,
                         'quantity' => 6,
                         'manufacturer_id' => manufacturer1.id
                        })
product2.save()

product3 = Product.new({ 'name' => '37SS',
                         'category' => 'helmets',
                         'description' => 'Stainless steel shell, REX regulator, neck dam ring with hinged locking collar and pull pins.',
                         'buy_cost' => 5900,
                         'sell_cost' => 7500,
                         'quantity' => 3,
                         'manufacturer_id' => manufacturer1.id
                        })
product3.save()

product4 = Product.new({ 'name' => 'SMP Fibroline 100m',
                         'category' => 'umbillicals',
                         'description' => '100m twisted umbillical, 4 part - air, pneumo, comms, video, with end fittings.',
                         'buy_cost' => 3000,
                         'sell_cost' => 4500,
                         'quantity' => 6,
                         'manufacturer_id' => manufacturer2.id
                        })
product4.save()

product5 = Product.new({ 'name' => 'DS1 DIN',
                         'category' => 'first stages',
                         'description' => 'Sealed first stage, 1 x low ,1 x high pressure ports, 300 bar DIN fitting.',
                         'buy_cost' => 130,
                         'sell_cost' => 200,
                         'quantity' => 6,
                         'manufacturer_id' => manufacturer3.id
                        })
product5.save()

product6 = Product.new({ 'name' => 'DS1 A-clamp',
                         'category' => 'first stages',
                         'description' => 'Sealed first stage, 1 x low ,1 x high pressure ports, 232 bar A-clamp fitting.',
                         'buy_cost' => 80,
                         'sell_cost' => 130,
                         'quantity' => 4,
                         'manufacturer_id' => manufacturer3.id
                        })
product6.save()

product7 = Product.new({ 'name' => '5mm Neoprene Gloves',
                         'category' => 'gloves',
                         'description' => '5mm basic neoprene diving gloves.',
                         'buy_cost' => 7,
                         'sell_cost' => 15,
                         'quantity' => 20,
                         'manufacturer_id' => manufacturer4.id
                        })
product7.save()

product8 = Product.new({ 'name' => '5mm Kevlar® Superstretch Gloves',
                         'category' => 'gloves',
                         'description' => '5mm neoprene, kevlar reinforced diving gloves.',
                         'buy_cost' => 20,
                         'sell_cost' => 30,
                         'quantity' => 10,
                         'manufacturer_id' => manufacturer4.id
                        })
product8.save()


# binding.pry
# nil
