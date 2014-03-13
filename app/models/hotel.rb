class Hotel < Sequel::Model
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  plugin :timestamps

  one_to_many :fliers, class: HotelFlier

  one_to_one :current_flier, class: :HotelFlier, conditions: {day: Date.today}, limit: 1

  def persisted?
    not new?
  end

  def to_param
    id.to_s
  end

  def location
    address_parts = self.address.split(',').map(&:strip)
    last_parts = address_parts[-1].split(' ')
    return last_parts[-1] if last_parts[-1] =~ /^(\d+-?)+\d+$/ #USA zip
    address_parts[-1] + '/' + address_parts[-2].split(' ')[1..-1].join(' ')
  end
end