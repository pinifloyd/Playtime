class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :picture
	
	validates_presence_of :title, :description
	validates_length_of :title, :maximum => 10, :message => "has more than 10 simbols"
	validates_numericality_of :price
	validate :price_must_be_at_least_a_cent
	validates_uniqueness_of :title

	has_attached_file :picture, :styles => { :small => "100x100>" }

	def self.find_products_for_sale
		find(:all, :order => "title")
	end

protected
	def price_must_be_at_least_a_cent
		errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
	end
end
