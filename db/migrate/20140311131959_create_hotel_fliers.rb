Sequel.migration do
  change do
    create_table :hotel_fliers do
      primary_key :id
      foreign_key :hotel_id, :hotels
      Date        :day
      String      :message
      DateTime    :created_at
      DateTime    :updated_at
      File        :flier_pdf
    end
  end
end
