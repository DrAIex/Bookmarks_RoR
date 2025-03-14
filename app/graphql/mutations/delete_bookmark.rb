require_relative '../types/bookmark_type'

module Mutations
    class DeleteBookmark < BaseMutation
      argument :id, ID, required: true

      field :bookmark, Types::BookmarkType, null: false
      field :errors, [String], null: false

      def resolve(id:)
        bookmark = Bookmark.find(id)
        if bookmark.destroy
          { bookmark: bookmark, errors: [] }
        else
          { bookmark: nil, errors: bookmark.errors.full_messages }
        end
      end
    end
  end