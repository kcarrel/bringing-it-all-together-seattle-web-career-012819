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
  
  def self.drop_table 
  end 
  
  def new_from_db 
    sql = "DROP TABLE IF EXISTS dogs"
    DB[:conn].execute(sql)
  end 
  
  def self.find_by_name(name) 
    sql = "SELECT * FROM dogs WHERE name = ? LIMIT 1"
    DB[:conn].execute(sql,name).map do |row|
      self.new_from_db(row)
    end.first
  end 
  
  def update
    sql = "UPDATE dogs SET name = ?, breed = ? WHERE id = ?"
    DB[:conn].execute(sql,self.name,self.grade,self.id)
  end 
  
  def save 
    if self.id 
      self.update
    else 
      sql = "INSERT INTO dogs (name,breed) VALUES (?, ?)"
      
      DB[:conn].execute(sql,self.name,self.breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  end 
  
  
  
end 