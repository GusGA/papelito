defmodule Papelito.Events.PlayerHandler do
  use GenEvent

  def register_with_manager do
    Papelito.Event.PlayerManager.register(__MODULE__, nil)
  end

  def handle_event({:update, {team_name, player_name}}, _) do
    IO.inspect("evento update")
    PapelitoWeb.PlayersStatusChannel.broadcast_update_status(team_name, player_name, "done")
    {:ok, nil}
  end
end
