defmodule ElixirJourney.For do
  def basic do
    for i <- 1..5 do
      i * 1
    end
  end

  def no_collect do
    for i <- 1..5 do
      i
    end

    :ok
  end

  def filter do
    for i <- 1..10, div(i, 2) == 0 do
      i * 1
    end
  end

  def match do
    users = [user: "john", admin: "meg", guest: "barbara"]

    for {type, name} when type != :guest <- users do
      String.upcase(name)
    end
  end

  def unique do
    for i <- 1..10, uniq: true do
      i
    end
  end

  def reduce do
    for i <- 1..10, reduce: [] do
      acc -> [i | acc]
    end
  end
end
