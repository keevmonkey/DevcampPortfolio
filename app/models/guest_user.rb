class GuestUser < User
  # attr_accessor allows this subclass to have attributes (Getter, Setter)
  attr_accessor :name, :first_name, :last_name, :email, :id
end