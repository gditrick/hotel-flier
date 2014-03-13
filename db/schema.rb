Sequel.migration do
  change do
    create_table(:hotels) do
      primary_key :id
      column :name, "text"
      column :address, "text"
      column :phone, "text"
      column :website, "text"
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:hotel_fliers) do
      primary_key :id
      foreign_key :hotel_id, :hotels, :key=>[:id]
      column :day, "date"
      column :message, "text"
      column :created_at, "timestamp without time zone"
      column :updated_at, "timestamp without time zone"
      column :flier_pdf, "bytea"
    end
  end
end
Sequel.migration do
  change do
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20140311131942_create_hotels.rb')"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20140311131959_create_hotel_fliers.rb')"
  end
end
