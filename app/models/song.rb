require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre_id = genre.id
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    self.notes.map(&:content)
  end

  def note_contents=(notes)
    notes.each do |note|
      if note != ''
        self.notes.build(content: note)
      end
    end
  end
end
