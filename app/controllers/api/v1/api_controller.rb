#module Api::V1
#  class ApiController < RocketPants::Base
#     map_error! Sequel::NoMatchingRow, RocketPants::NotFound
#     #map_error! CanCan::AccessDenied, RocketPants::Forbidden
#
#     protected
#
#     def current_user
#       User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
#     end
#
#     def current_ability
#       Ability.new(current_user)
#     end
#  end
#end