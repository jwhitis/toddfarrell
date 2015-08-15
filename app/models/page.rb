class Page < ActiveRecord::Base
  DEFAULT_SLUGS = %w(shows music photos videos)

  mount_uploader :image, ImageUploader

  has_one :nav_link, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, inclusion: { in: DEFAULT_SLUGS, unless: :editable? },
    slug: true, uniqueness: true
  validate :only_editable_pages_can_be_published
  validate :scss_compiles_to_css

  before_validation :format_slug

  def only_editable_pages_can_be_published
    if !self.editable? && self.published?
      self.errors[:base] << "Only editable pages can be published"
    end
  end

  def scss_compiles_to_css
    self.css = Sass.compile(scoped_scss) if self.scss_changed?
  rescue Sass::SyntaxError => exception
    self.errors[:base] << exception.message
  end

  def scoped_scss
    "div#page-container { #{self.scss} }"
  end

  def format_slug
    if self.slug_changed?
      text = [self.slug, self.title].find(&:present?) || ""
      self.slug = text.parameterize
    end
  end

  def self.display_order
    order(created_at: :desc)
  end

  def self.published
    where(published: true)
  end

  def self.editable
    where(editable: true)
  end

  def self.uneditable
    where(editable: false)
  end

end
