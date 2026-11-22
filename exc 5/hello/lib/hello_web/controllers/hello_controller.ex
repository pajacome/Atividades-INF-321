defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  # Pattern matching no cabeçalho da função filtra o idioma
  def saudacao(conn, %{"lang" => "pt", "name" => name}) do
    render(conn, :saudacao, greeting: "Olá", name: name, page_title: "Saudação")
  end

  def saudacao(conn, %{"lang" => "en", "name" => name}) do
    render(conn, :saudacao, greeting: "Hello", name: name, page_title: "Greeting")
  end

  # Idioma não suportado
  def saudacao(conn, _params) do
    conn
    |> put_status(:not_found)
    |> text("Idioma não suportado. Use /saudacao/pt/seu_nome ou /saudacao/en/seu_nome")
  end
end
