class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  after_validation :geocode, if: :full_address_changed?

  geocoded_by :full_address

  private

  def full_address
    "#{country} #{city}, #{address}".strip
  end

  def full_address_changed?
    return false if full_address.blank?
    country.changed? || city.changed? || address.changed?
  end
end
