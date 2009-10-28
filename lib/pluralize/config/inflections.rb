#polish plural rules
#more language plural rules here: http://www.unicode.org/cldr/data/charts/supplemental/language_plural_rules.html
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
end
