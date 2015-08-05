# msu-icon
# Author: Noah Hines
# File: person.rb

# define class Person
class Person
	attr_accessor :uid, :first_name, :last_name, :id, :email, :title, :student_class, :major
	def initialize(uid='', first_name='', last_name='', id='', email='', title='', student_class='', major='')
		@uid = uid
		@first_name = first_name
		@last_name = last_name
		@id = id
		@email = email
		@title = title
		@student_class = student_class
		@major = major
	end

	def to_json
        return {'UID' => @uid, 'First Name' => @first_name, 'Last Name' => @last_name, 'MSU ID' => @id, 'Email' => @email, 'Title' => @title, 'Class' => @student_class, 'Major' => @major}.to_json
    end

end