# module Archivable
#   extend ActiveSupport::Concern
#
#   included do
#     scope :archived, -> { where('archived_at != ?', nil) }
#   end
# end