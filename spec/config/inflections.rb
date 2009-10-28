ActiveSupport::Inflector.inflections do |inflect|
  inflect.proc :pl, lambda{|count, singular, inflections|
    if count == 1
      singular
    elsif (2..4).include?(count%10) && !(12..14).include?(count%100)
      inflections[:few]
    else
      inflections[:other]
    end
  }

  inflect.plural "chleb", :few => "chleby", :other => "chlebów", :proc => :pl
  inflect.plural "szklanka", :few => "szklanki", :other => "szklanek" # use first defined proc
  inflect.plural "one potatoe",
    :two => "two potatoes",
    :three => "three potatoes",
    :four => "four",
    :five => "five potatoes",
    :six => "six potatoes",
    :seven => "seven potatoes",
    :more => "more!",
    :proc => lambda{|count, singular, inflections|
      case count%8
      when 1 then singular
      when 2 then inflections[:two]
      when 3 then inflections[:three]
      when 4 then inflections[:four]
      when 5 then inflections[:five]
      when 6 then inflections[:six]
      when 7 then inflections[:seven]
      else inflections[:more]
      end
  }
end
#(1..20).each {|n| p ActiveSupport::Inflector.pluralize("one potatoe", n)}