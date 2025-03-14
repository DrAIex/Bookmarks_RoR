# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_bookmark, mutation: Mutations::CreateBookmark
    field :delete_bookmark, mutation: Mutations::DeleteBookmark
    field :update_bookmark, mutation: Mutations::UpdateBookmark
  end
end