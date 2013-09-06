ThinkingSphinx::Index.define :comment, :with => :active_record do
  indexes content
  indexes :author_name, :sortable => true
 # indexes author.first_name, :as => :author_name
  has article_id
end