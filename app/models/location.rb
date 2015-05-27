module Location

  def distance_between(x_1, y_1, x_2, y_2)
    ((x_1 - x_2)**2 + (y_1 - y_2)**2)**(0.5)
  end
end