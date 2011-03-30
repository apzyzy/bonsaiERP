# encoding: utf-8
# author: Boris Barroso
# email: boriscyber@gmail.com
class Currency < ActiveRecord::Base

  has_many :organisations

  validates_presence_of :name, :symbol

  def to_s
    %Q(#{symbol} #{name})
  end

  def plural
    %Q(#{name.pluralize} #{symbol})
  end

  def self.json
    hash = Hash.new {|h,v| h[v.id] = {:name => v.name, :symbol => v.symbol, :code => v.code } }
    Currency.all.each {|c| hash[c] }
    hash
  end
end
