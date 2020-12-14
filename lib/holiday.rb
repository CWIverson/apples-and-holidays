require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:new_years]=supply
  holiday_hash[:winter][:christmas]=supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day]=supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name]=supply_array

end

def all_winter_holiday_supplies(holiday_hash)
  winter_supplies=[]
  holiday_hash[:winter].each {|holidays, supplies|
    holidays = supplies.each {|item|
      winter_supplies<<item
    }
  }
  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  all_supplies=[]

  holiday_hash.each {|season, holiday|
    puts "#{season.capitalize}:"
    holiday.each{|holiday, supply|
      names=holiday.to_s.split("_")
      capital_names=[]
      names.each{|name|
        capital_names<<name.capitalize
      }
      holiday=capital_names.join(" ")
      supply=supply.join(", ")
      puts "  #{holiday}: #{supply}"
    }
  }
end

def all_holidays_with_bbq(holiday_hash)
  bbq_holidays=[]
  holiday_hash.each{|seasons, holiday| 
    seasons= holiday.each { |holiday, supplies|
      holiday=supplies.each {|item|
        supplies=[item] 
        if item == "BBQ"
          bbq_holidays.push(holiday)
        end
      }
    }

  }
bbq_holidays
end







