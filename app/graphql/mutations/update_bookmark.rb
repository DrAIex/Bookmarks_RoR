module Mutations
    class UpdateBookmark < BaseMutation
      argument :id, ID, required: true
      argument :title, String, required: true
      argument :url, String, required: true
  
      field :bookmark, Types::BookmarkType, null: false
      field :errors, [String], null: false
  
      def resolve(id:, title:, url:)
        bookmark = Bookmark.find(id)
        if bookmark.update(title: title, url: url)
          { bookmark: bookmark, errors: [] }
        else
          { bookmark: nil, errors: bookmark.errors.full_messages }
        end
      end
    end
  end