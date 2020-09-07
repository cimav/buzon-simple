class Entry < ApplicationRecord
  belongs_to :user

  after_create :set_identificator

  EMAIL = 'comite.etica@cimav.edu.mx'

  def set_identificator
    con = Entry.maximum(:consecutive)
    if con.nil?
      con = 1
    else
      con += 1
    end
    consecutive = "%03d" % con
    self.consecutive = con
    self.year = self.created_at.year
    self.identificator = "B-#{self.year}-#{consecutive}"
    self.save(:validate => false)
  end
end
