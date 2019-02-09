require_relative "../config/environment.rb"

class Dog 
  
  attr_accessor :id, :name, :breed
  @@ all = []
  
  def self.all 
    rows = DB[:conn].execute("SELECT * FROM dogs")
    rows.each do |x|
      x.id ==row["id"]
    end 
    
    if !is_in_array
      Dog.new(row)
    end 
  end 
  @@ all 
end
  
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
    sql = "DROP TABLE IF EXISTS dogs"
    DB[:conn].execute(sql)
  end 
  
  def self.new_from_db(row)
    self.new(row[0],row[1],row[2])
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
  
  
  
end 