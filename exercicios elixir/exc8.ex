defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)
  
  def compare(secret_number, guess) when guess == secret_number do
    # Please implement the compare/2 function
    "Correct"
  end
  def compare(secret_number,:no_guess) do
    # Please implement the compare/2 function
    "Make a guess"
  end
  def compare(secret_number, guess) when guess - secret_number == 1 do
    # Please implement the compare/2 function
    "So close"
  end
  def compare(secret_number, guess) when guess - secret_number == -1 do
    # Please implement the compare/2 function
    "So close"
  end
  def compare(secret_number, guess) when guess > secret_number do
    # Please implement the compare/2 function
    "Too high"
  end
  def compare(secret_number, guess) when guess < secret_number do
    # Please implement the compare/2 function
    "Too low"
  end

  def compare(secret_number,guess) do
    # Please implement the compare/2 function
    "Make a guess"
  end

  

  
end
