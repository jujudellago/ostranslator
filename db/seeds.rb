
connection = ActiveRecord::Base.connection

sql = File.read('db/import.sql') # Change path and filename as necessary
statements = sql.split(/;$/)
statements.pop

ActiveRecord::Base.transaction do
  statements.each do |statement|
    connection.execute(statement)
  end
end
