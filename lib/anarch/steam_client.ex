defmodule Anarch.SteamClient do

    def steam_api_key do 
        Application.get_env(:anarch, Anarch.SteamClient)
        |> Keyword.get(:steam_api_key)
    end

    def get_heroes do
        get("http://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key=#{steam_api_key()}&language=en_us&format=JSON",
            [],
            [
                [proxy: {'127.0.0.1:8080'}], ssl: [server_name_indication: '127.0.0.1', versions: :'tlsv1.2']
            ])
    end

    def get_items do
        get("http://api.steampowered.com/IEconDOTA2_570/GetGameItems/v0001/?key=#{steam_api_key()}&language=en_us&format=JSON",
            [],
            [
                [proxy: {'127.0.0.1', 8080}], ssl: [server_name_indication: '127.0.0.1', versions: :'tlsv1.2']
            ])
    end

    def get(url, headers \\ [], options) do
        # :hackney_trace.enable(:max, :io)
        case HTTPoison.get(url, headers, options) do
          {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
          {:error, %{reason: reason}} -> {:error, reason}
        end
    end
end