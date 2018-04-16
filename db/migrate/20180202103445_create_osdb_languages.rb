class CreateOsdbLanguages < ActiveRecord::Migration[5.1]

  
  def self.up
     create_table :osdb_languages do |t|
        t.string :id_sub_language
        t.string :iso_639
        t.string :language_code
        t.string :language_name

        t.timestamps
    end
    
    create_table :osdb_languages_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :osdb_language, index: true
    end
  end
  
  
  def self.down
    drop_table :osdb_languages
    drop_table :osdb_languages_users
  end
end
