defmodule BirdCount do

  def today([]) do nil
  end
  def today(list) do
    [head | tail] = list
    head
  end
  
  def increment_day_count([]) do
   list = [1]
   list
  end
  def increment_day_count([head | tail]) do
   head = head + 1
   list = [head | tail]
   list
  end

  def has_day_without_birds?([]) do
    false
  end
  def has_day_without_birds?([head|tail]) do
    if head == 0 do
      true
    else 
      has_day_without_birds?(tail)
    end
  end

  def total([]) do
    0
  end
  def total([head|tail]) do
    head + total(tail)
  end

  
  def busy_days([]) do
    0
  end
  def busy_days([head|tail]) do
    if head > 4 do
      1 + busy_days(tail)
    else
      0 + busy_days(tail)
    end
  end
end
