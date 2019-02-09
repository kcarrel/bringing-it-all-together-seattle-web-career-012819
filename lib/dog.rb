require_relative "../config/environment.rb"

class Dog 
  
  attr_accessor :id, :name, :breed
  
  def initialize(id=nil,name,breed)
    @id = id 
    @name = name 
    @breed = breed 
  end 
  
  def self.create_table 
    sql "CREATE TABLE IF NOT EXISTS dogs
    (id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT)"
    
    DB[:conn].execute(sql)
  end 
  
  def drop_table 
  end 
  
  def new_from_db 
  end 
  
  def find_by_name 
  end 
  
  def update 
  end 
  
  def save 
  end 
  
  
  
end 