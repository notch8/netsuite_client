class String

  def self.random_string(len = 8)
    ar = 'abcdefgijhklmnopqrstwxyz0123456789'.split('')
    str = ''
    len.times { str << ar[rand(ar.size)]}
    str
  end

end

