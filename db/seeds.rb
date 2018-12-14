
require_relative('../models/manufacturer')
require_relative('../models/product')
require_relative('../models/stock')


product1 = Product.new({ 'name' => 'Superlite 17B',
                         'category' => 'helmets',
                         'description' => 'Carbon fibre shell, SuperFlow regulator, neck dam clamp with hinged yoke.',
                         'buy_cost' => 4000,
                         'sell_cost' => 5600
                        })

product2 = Product.new({ 'name' => 'Superlite 27',
                         'category' => 'helmets',
                         'description' => 'Carbon fibre shell, SuperFlow 350 regulator, neck dam ring with hinged locking collar and pull pins.',
                         'buy_cost' => 4200,
                         'sell_cost' => 5800
                        })

product3 = Product.new({ 'name' => '37SS',
                         'category' => 'helmets',
                         'description' => 'Stainless steel shell, REX regulator, neck dam ring with hinged locking collar and pull pins.',
                         'buy_cost' => 5900,
                         'sell_cost' => 7500
                        })

product4 = Product.new({ 'name' => 'SMP Fibroline 100m',
                         'category' => 'umbillicals',
                         'description' => '100m twisted umbillical, 4 part - air, pneumo, comms, video, with end fittings.',
                         'buy_cost' => 3000,
                         'sell_cost' => 4500
                        })

product5 = Product.new({ 'name' => 'DS1 DIN',
                         'category' => 'first stages',
                         'description' => 'Sealed first stage, 1 x low ,1 x high pressure ports, 300 bar DIN fitting.',
                         'buy_cost' => 130,
                         'sell_cost' => 200
                        })

product6 = Product.new({ 'name' => 'DS1 A-clamp',
                         'category' => 'first stages',
                         'description' => 'Sealed first stage, 1 x low ,1 x high pressure ports, 232 bar A-clamp fitting.',
                         'buy_cost' => 80,
                         'sell_cost' => 130
                        })

product7 = Product.new({ 'name' => '5mm Neoprene Gloves',
                         'category' => 'gloves',
                         'description' => '5mm basic neoprene diving gloves.',
                         'buy_cost' => 7,
                         'sell_cost' => 15
                        })

product8 = Product.new({ 'name' => '5mm Kevlar® Superstretch Gloves',
                         'category' => 'gloves',
                         'description' => '5mm neoprene, kevlar reinforced diving gloves.',
                         'buy_cost' => 20,
                         'sell_cost' => 30
                        })

manufacturer1 = Manufacturer.new({ 'name' => 'Kirby Morgan',
                                   'address' => '1430 Jason Way, Santa Maria, CA 93455, USA',
                                   'tel_no' => '(805) 928-7772',
                                   'rep_name' => 'Dusty Johnson'
                                  })

manufacturer2 = Manufacturer.new({ 'name' => 'Submarine Manufacturing & Products',
                                   'address' => 'Blackpool Road, Newton, Preston, Lancashire, United Kingdom, PR4 3RE',
                                   'tel_no' => '01772 687 775',
                                   'rep_name' => 'James Middleton'
                                  })

manufacturer3 = Manufacturer.new({ 'name' => 'Apeks Marine Equipment',
                                   'address' => 'Neptune Way, Blackburn, United Kingdom, BB1 2BT',
                                   'tel_no' => '01254 692 200',
                                   'rep_name' => 'Kenneth Black'
                                  })

manufacturer4 = Manufacturer.new({ 'name' => 'Northern Diver',
                                   'address' => 'Appley Lane North, Appley Bridge, Wigan, Lancashire, WN6 9AE',
                                   'tel_no' => '01257 254 444',
                                   'rep_name' => 'Andrew Hardy'
                                  })

stock_item1 = Stock.new({ 'product_id' => product1.id, 'manufacturer_id' => manufacturer1.id, 'quantity' => 2 })

stock_item2 = Stock.new({ 'product_id' => product2.id, 'manufacturer_id' => manufacturer1.id, 'quantity' => 6 })

stock_item3 = Stock.new({ 'product_id' => product3.id, 'manufacturer_id' => manufacturer1.id, 'quantity' => 3 })

stock_item4 = Stock.new({ 'product_id' => product4.id, 'manufacturer_id' => manufacturer2.id, 'quantity' => 6 })

stock_item5 = Stock.new({ 'product_id' => product5.id, 'manufacturer_id' => manufacturer3.id, 'quantity' => 10 })

stock_item6 = Stock.new({ 'product_id' => product6.id, 'manufacturer_id' => manufacturer3.id, 'quantity' => 2 })

stock_item7 = Stock.new({ 'product_id' => product7.id, 'manufacturer_id' => manufacturer4.id, 'quantity' => 20 })

stock_item8 = Stock.new({ 'product_id' => product8.id, 'manufacturer_id' => manufacturer4.id, 'quantity' => 10 })
