require 'spec_helper'

describe "Pluralize" do
  it "should pluralize polish word \"chleb\"" do
    {
      0   => 'chlebów',
      1   => 'chleb',
      2   => 'chleby',
      3   => 'chleby',
      4   => 'chleby',
      5   => 'chlebów',
      6   => 'chlebów',
      11  => 'chlebów',
      22  => 'chleby',
      221 => 'chlebów'
    }.each do |count, plural_form|
      ActiveSupport::Inflector.pluralize("chleb", count).should.equal plural_form
    end
  end
  it "should pluralize polish word \"szklanka\"" do
    {
      0   => 'szklanek',
      1   => 'szklanka',
      2   => 'szklanki',
      3   => 'szklanki',
      4   => 'szklanki',
      5   => 'szklanek',
      6   => 'szklanek',
      11  => 'szklanek',
      22  => 'szklanki',
      221 => 'szklanek'
    }.each do |count, plural_form|
      ActiveSupport::Inflector.pluralize("szklanka", count).should.equal plural_form
    end
  end
  it "should pluralize english word \"word\"" do
    {
      0   => 'words',
      1   => 'words',
      2   => 'words',
      3   => 'words',
      4   => 'words',
      5   => 'words',
      6   => 'words',
      11  => 'words',
      22  => 'words',
      221 => 'words',
      nil => 'words'
    }.each do |count, plural_form|
      ActiveSupport::Inflector.pluralize("word", count).should.equal plural_form
    end
    
  end
  
end
