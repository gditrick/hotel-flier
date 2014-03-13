class HotelFlier < Sequel::Model
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  plugin :timestamps

  many_to_one :hotel

  def persisted?
    not new?
  end

  def to_param
    id.to_s
  end

  def enqueue
    Resque.enqueue(Utilities::HotelFlierPdfGenerator, self.hotel.id)
  end
end