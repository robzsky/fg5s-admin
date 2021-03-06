__dir__ = File.dirname(__FILE__)
$LOAD_PATH.unshift("#{__dir__}")
$LOAD_PATH.unshift("#{__dir__}/lib")

require 'mysql2'
require 'active_record'


puts "ENV['DATABASE_URL']=#{ENV['DATABASE_URL']}"

ENV['DATABASE_URL'] = 'localhost' if ENV['DATABASE_URL'].nil?
ENV['USER_NAME'] = 'root' if ENV['USER_NAME'].nil?
ENV['PASSWORD'] = '' if ENV['PASSWORD'].nil?
ENV['SCHEMA'] = 'forest_glade' if ENV['SCHEMA'].nil?
#ENV['SCHEMA'] = 'fgfc_in_memory' if ENV['SCHEMA'].nil?
puts "ENV['DATABASE_URL']=#{ENV['DATABASE_URL']}"

ActiveRecord::Base.establish_connection({
:adapter => "mysql2",
:host => ENV['DATABASE_URL'],
:username => ENV['USER_NAME'],
:password => ENV['PASSWORD'],
:database => ENV['SCHEMA'],
:reconnect => true
})



# ActiveRecord::Base.establish_connection({
# :adapter => "mysql2",
# :host => 'us-cdbr-east-02.cleardb.com',
# :username => 'bd0887a8404bd6',
# :password => 'c0ec2ec7',
# :database => 'heroku_d700529ea100691',
# :reconnect => true})

#$age_groups = AgeGroup.find(:all)
#$user = User.find(:all)
year = Date.today.year
$saturday_date = 'Saturday 27th May'
$sunday_date = 'Sunday 28th May'
# $fives_year =  Date.today.month > 8 ? year + 1 : year
season_year =  Date.today.month < 8 ? year - 1 : year
$season = "#{season_year}/#{season_year + 1}"

$closing_date = 'Friday 6th May 2015'
$discount_end_date = 'Friday 6th May 2016'

require "fives_controller"
run FivesController

#   heroku_d700529ea100691
#
#Username:	bd0887a8404bd6
#Password:	c0ec2ec7
# shema heroku_d700529ea100691
# mysql2://bd0887a8404bd6:c0ec2ec7@us-cdbr-east-02.cleardb.com/heroku_d700529ea100691?reconnect=true