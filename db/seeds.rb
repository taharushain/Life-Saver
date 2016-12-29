# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(:email => "a@a.com", :password => "123456", :name => "A for Alpha")
Admin.create(:email => "b@b.com", :password => "123456", :name => "B for Beta")

aku = Hospital.create(:name => "Aga Khan University Hospital", :logo => File.new(Rails.root+"public/system/hospitals/seed/aga-khan.jpeg"), :address =>"24.892040,67.074774")
patel = Hospital.create(:name => "Patel Hospital", :logo => File.new(Rails.root+"public/system/hospitals/seed/patel.png"), :address =>"24.935018,67.097233")
jinnah = Hospital.create(:name => "Jinnah Post Graduate Medical Centre", :logo => File.new(Rails.root+"public/system/hospitals/seed/jpmc.jpg"), :address =>"24.851830,67.047215")
liaquat = Hospital.create(:name => "Liaquat National Hospital", :logo => File.new(Rails.root+"public/system/hospitals/seed/liaquat.jpg"), :address =>"24.891566,67.068119")
ziauddin = Hospital.create(:name => "Ziauddin Hospital", :logo => File.new(Rails.root+"public/system/hospitals/seed/ziauddin.png"), :address =>"24.924152,67.045124")

AmbulanceUser.create(:email => "a@a.com",:name => "Alpha Driver", :password => "123456", :belongs_to => "Anonymous")
AmbulanceUser.create(:email => "b@b.com",:name => "Beta Driver", :password => "123456", :belongs_to => "Anonymous")

HospitalSuperUser.create(:user_name => "Superuser-AKU", :password => "123456", :hospital_id => aku.id)
HospitalSuperUser.create(:user_name => "Superuser-Patel", :password => "123456", :hospital_id => patel.id)
HospitalSuperUser.create(:user_name => "Superuser-Jinnah", :password => "123456", :hospital_id => jinnah.id)
HospitalSuperUser.create(:user_name => "Superuser-Liaquat", :password => "123456", :hospital_id => liaquat.id)
HospitalSuperUser.create(:user_name => "Superuser-Ziauddin", :password => "123456", :hospital_id => ziauddin.id)

Bed.create([{:name => "BedOne", :hospital_id => aku.id},{:name => "BedTwo", :hospital_id => aku.id},{:name => "BedThree", :hospital_id => aku.id},{:name => "BedFour", :hospital_id => aku.id},{:name => "BedFive", :hospital_id => aku.id},{:name => "BedSix", :hospital_id => aku.id}])
Bed.create([{:name => "BedOne", :hospital_id => patel.id},{:name => "BedTwo", :hospital_id => patel.id},{:name => "BedThree", :hospital_id => patel.id},{:name => "BedFour", :hospital_id => patel.id},{:name => "BedFive", :hospital_id => patel.id},{:name => "BedSix", :hospital_id => patel.id}])
Bed.create([{:name => "BedOne", :hospital_id => jinnah.id},{:name => "BedTwo", :hospital_id => jinnah.id},{:name => "BedThree", :hospital_id => jinnah.id},{:name => "BedFour", :hospital_id => jinnah.id},{:name => "BedFive", :hospital_id => jinnah.id},{:name => "BedSix", :hospital_id => jinnah.id}])
Bed.create([{:name => "BedOne", :hospital_id => liaquat.id},{:name => "BedTwo", :hospital_id => liaquat.id},{:name => "BedThree", :hospital_id => liaquat.id},{:name => "BedFour", :hospital_id => liaquat.id},{:name => "BedFive", :hospital_id => liaquat.id},{:name => "BedSix", :hospital_id => liaquat.id}])
Bed.create([{:name => "BedOne", :hospital_id => ziauddin.id},{:name => "BedTwo", :hospital_id => ziauddin.id},{:name => "BedThree", :hospital_id => ziauddin.id},{:name => "BedFour", :hospital_id => ziauddin.id},{:name => "BedFive", :hospital_id => ziauddin.id},{:name => "BedSix", :hospital_id => ziauddin.id}])

Manager.create(:user_name => "Manager-AKU-X1", :password => "123456", :hospital_id => aku.id)
Manager.create(:user_name => "Manager-Patel-X2", :password => "123456", :hospital_id => patel.id)
Manager.create(:user_name => "Manager-Jinnah-X2", :password => "123456", :hospital_id => jinnah.id)
Manager.create(:user_name => "Manager-Liaquat-X2", :password => "123456", :hospital_id => liaquat.id)
Manager.create(:user_name => "Manager-Ziauddin-X2", :password => "123456", :hospital_id => ziauddin.id)