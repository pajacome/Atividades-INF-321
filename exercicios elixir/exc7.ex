defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    # Please implement the get_volume/1 function
    elem(volume_pair,1)
  end

  
  def to_milliliter({:cup,volume}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter,240*volume}
  end
  def to_milliliter({:fluid_ounce,volume}) do
    {:milliliter,30*volume}
    # Please implement the to_milliliter/1 functions
  end
  def to_milliliter({:teaspoon,volume}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter,5*volume}
  end
  def to_milliliter({:tablespoon,volume}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter,15*volume}
  end
  def to_milliliter({:milliliter,volume}) do
    # Please implement the to_milliliter/1 functions
    {:milliliter,volume}
  end

  def from_milliliter({:milliliter, volume},:cup ) do
    # Please implement the from_milliliter/2 functions
    {:cup,volume/240.0}
  end
  def from_milliliter({:milliliter, volume},:fluid_ounce ) do
    # Please implement the from_milliliter/2 functions
    {:fluid_ounce,volume/30.0}
  end
  def from_milliliter({:milliliter, volume},:teaspoon ) do
    # Please implement the from_milliliter/2 functions
    {:teaspoon,volume/5.0}
  end
  def from_milliliter({:milliliter, volume},:tablespoon ) do
    # Please implement the from_milliliter/2 functions
    {:tablespoon,volume/15.0}
  end
  def from_milliliter({:milliliter, volume},:milliliter) do
    # Please implement the from_milliliter/2 functions
    {:milliliter,volume}
  end

  def convert(volume_pair, unit) do
    # Please implement the convert/2 function
    volume_pair = to_milliliter(volume_pair)
    volume_pair = from_milliliter(volume_pair,unit)
    volume_pair
  end
end
