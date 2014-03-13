Sequel.migration do
  change do
    create_table :hotels do
      primary_key :id
      String :name
      String :address
      String :phone
      String :website
    end
  end
end
