class Story < ActiveRecord::Base
  attr_accessible :body, :title
  
  Field = Struct.new(:name)
  
  def fields
	body.scan(/{([^}]+)}/).flatten.uniq.map do |name|
	  Field.new(name)
	end
  end
  
  def see(answers)
    new_body = body.dup
  	answers.each do |key,value|
	  new_body.gsub!("{#{key}}", value)
	end
	new_body
  end
end
